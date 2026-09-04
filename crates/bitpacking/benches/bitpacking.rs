use bitpacking::util::Rng;
use bitpacking::{bit_to_byte, byte_to_bit, expand, filter, indices, rank, rank_index, select, unpack};
use criterion::{BenchmarkId, Criterion, Throughput, black_box, criterion_group, criterion_main};

fn bench_byte_to_bit(c: &mut Criterion) {
    // 16 KiB of bytes -> 256 words: comfortably L1-resident so we measure compute, not memory.
    const N: usize = 1 << 14;
    let mut rng = Rng::new(1);
    let bytes = rng.bytes(N, 4);
    let mut out = vec![0u64; N / 64];
    let mut g = c.benchmark_group("byte_to_bit");
    g.throughput(Throughput::Bytes(N as u64));
    macro_rules! b {
        ($name:literal, $f:path) => {
            g.bench_function($name, |b| {
                b.iter(|| {
                    $f(black_box(&bytes), black_box(&mut out));
                    black_box(&out);
                })
            });
        };
    }
    b!("scalar", byte_to_bit::bytes_to_bits_scalar);
    b!("swar", byte_to_bit::bytes_to_bits_swar);
    b!("portable_u8x64", byte_to_bit::bytes_to_bits_portable);
    b!("portable_u8x32", byte_to_bit::bytes_to_bits_portable32);
    #[cfg(target_feature = "avx2")]
    b!("avx2", byte_to_bit::bytes_to_bits_avx2);
    #[cfg(target_feature = "avx512bw")]
    b!("avx512", byte_to_bit::bytes_to_bits_avx512);
    g.finish();
}

fn bench_rank(c: &mut Criterion) {
    let mut rng = Rng::new(2);
    let mut g = c.benchmark_group("rank");
    // 8 KiB (L1) and 512 KiB (L2) bitmaps; rank position at 3/4 so 3/4 of the words are scanned.
    for &words in &[1usize << 10, 1 << 16] {
        let bits = rng.words(words, 4);
        let i = words * 64 * 3 / 4 + 5;
        g.throughput(Throughput::Bytes((i / 8) as u64));
        macro_rules! b {
            ($name:literal, $f:path) => {
                g.bench_with_input(BenchmarkId::new($name, words), &i, |b, &i| {
                    b.iter(|| $f(black_box(&bits), black_box(i)))
                });
            };
        }
        b!("scalar", rank::rank_scalar);
        b!("portable_u64x8", rank::rank_portable);
        b!("portable_u8x64", rank::rank_portable_u8);
        #[cfg(target_feature = "avx2")]
        b!("avx2", rank::rank_avx2);
        #[cfg(target_feature = "avx512bw")]
        b!("avx512_lut", rank::rank_avx512);
        #[cfg(target_feature = "avx512vpopcntdq")]
        b!("avx512_vpopcnt", rank::rank_vpopcnt);
    }
    g.finish();
}

fn bench_select(c: &mut Criterion) {
    let mut rng = Rng::new(3);

    // In-word select on its own: 4096 random (word, k) pairs, mixed densities.
    let pairs: Vec<(u64, u32)> = (0..4096)
        .map(|_| {
            let d = (rng.next_u64() % 8) as u32 + 1;
            let w = rng.word_with_density(d);
            (w, (rng.next_u64() % w.count_ones() as u64) as u32)
        })
        .collect();
    let mut g = c.benchmark_group("select64");
    g.throughput(Throughput::Elements(pairs.len() as u64));
    macro_rules! b {
        ($name:literal, $f:path) => {
            g.bench_function($name, |b| {
                b.iter(|| {
                    let mut s = 0u32;
                    for &(w, k) in black_box(&pairs) {
                        s = s.wrapping_add($f(w, k));
                    }
                    s
                })
            });
        };
    }
    b!("naive", select::select64_naive);
    b!("broadword", select::select64_broadword);
    b!("portable_u8x8", select::select64_portable);
    #[cfg(target_feature = "bmi2")]
    b!("pdep", select::select64_pdep);
    g.finish();

    // Whole-bitmap select: 8 KiB bitmap, 50% density, n at 3/4 of the set bits.
    let words = 1usize << 10;
    let bits = rng.words(words, 4);
    let total = rank::rank_scalar(&bits, words * 64);
    let n = total * 3 / 4;
    let mut g = c.benchmark_group("select");
    g.throughput(Throughput::Bytes((words * 8 * 3 / 4) as u64));
    macro_rules! b {
        ($name:literal, $f:path) => {
            g.bench_function($name, |b| b.iter(|| $f(black_box(&bits), black_box(n))));
        };
    }
    b!("scalar_scan+naive", select::select_naive);
    b!("scalar_scan+broadword", select::select_broadword);
    b!("portable_scan+portable", select::select_portable);
    #[cfg(target_feature = "bmi2")]
    b!("scalar_scan+pdep", select::select_pdep);
    #[cfg(target_feature = "bmi2")]
    b!("scalar_scan8+pdep", select::select_scan8_pdep);
    #[cfg(target_feature = "bmi2")]
    b!("portable_scan+pdep", select::select_portable_scan_pdep);
    g.finish();
}

fn bench_filter(c: &mut Criterion) {
    let mut rng = Rng::new(4);
    let words = 1usize << 12; // 32 KiB values + 32 KiB mask
    let values = rng.words(words, 4);
    let mut out = vec![0u64; words + 1]; // +1: the branchless writers store one word ahead
    let mut g = c.benchmark_group("filter");
    g.throughput(Throughput::Bytes((words * 16) as u64));
    // Three uniform densities plus a run-structured mask (mean run 64 => many all-ones /
    // all-zero words) where vortex's fast paths apply.
    for density in [1u32, 4, 7, 100] {
        let mask = if density == 100 { rng.words_runs(words, 64.0) } else { rng.words(words, density) };
        let label = if density == 100 { "runs64".to_string() } else { format!("mask{}/8", density) };
        macro_rules! b {
            ($name:literal, $f:path) => {
                g.bench_with_input(BenchmarkId::new($name, &label), &mask, |b, mask| {
                    b.iter(|| $f(black_box(&values), black_box(mask), black_box(&mut out)))
                });
            };
        }
        b!("naive", filter::filter_naive);
        b!("scalar_hd", filter::filter_scalar);
        b!("scalar_byte_lut", filter::filter_byte_lut);
        b!("scalar_byte_lut_branchless", filter::filter_byte_lut_branchless);
        b!("vortex_lut", filter::filter_vortex_lut);
        b!("vortex_lut_branchless", filter::filter_vortex_lut_branchless);
        b!("portable_u64x4", filter::filter_portable4);
        b!("portable_u64x8", filter::filter_portable);
        b!("portable_u64x8_branchless", filter::filter_portable_branchless);
        #[cfg(target_feature = "bmi2")]
        b!("bmi2_pext", filter::filter_bmi2);
        #[cfg(target_feature = "bmi2")]
        b!("bmi2_pext_branchless", filter::filter_bmi2_branchless);
        #[cfg(target_feature = "bmi2")]
        b!("vortex_pext", filter::filter_vortex_pext);
        #[cfg(target_feature = "avx512vbmi2")]
        b!("vbmi2_compressb", filter::filter_vbmi2);
    }
    g.finish();
}

fn bench_rank_index(c: &mut Criterion) {
    let mut rng = Rng::new(5);
    let mut g = c.benchmark_group("rank_index");
    for &words in &[1usize << 10, 1 << 16] {
        let bits = rng.words(words, 4);
        let mut out = vec![0u32; words];
        g.throughput(Throughput::Bytes((words * 8) as u64));
        macro_rules! b {
            ($name:literal, $f:path) => {
                g.bench_with_input(BenchmarkId::new($name, words), &words, |b, _| {
                    b.iter(|| {
                        $f(black_box(&bits), black_box(&mut out));
                        black_box(&out);
                    })
                });
            };
        }
        b!("scalar", rank_index::rank_index_scalar);
        b!("portable_u64x8", rank_index::rank_index_portable);
        #[cfg(target_feature = "avx2")]
        b!("avx2", rank_index::rank_index_avx2);
        #[cfg(target_feature = "avx512bw")]
        b!("avx512", rank_index::rank_index_avx512);
    }
    g.finish();
}

fn bench_indices(c: &mut Criterion) {
    let mut rng = Rng::new(6);
    // In-word select-all: 4096 random words of mixed density.
    let words: Vec<u64> = (0..4096)
        .map(|_| {
            let d = (rng.next_u64() % 8) as u32 + 1;
            rng.word_with_density(d)
        })
        .collect();
    let mut out = vec![0u32; 64 + 64];
    let mut g = c.benchmark_group("select_all64");
    g.throughput(Throughput::Elements(words.len() as u64));
    macro_rules! b {
        ($name:literal, $f:path) => {
            g.bench_function($name, |b| {
                b.iter(|| {
                    let mut n = 0usize;
                    for &w in black_box(&words) {
                        n += $f(w, 0, black_box(&mut out));
                    }
                    n
                })
            });
        };
    }
    b!("scalar_tzcnt", indices::select_all64_scalar);
    b!("portable_lut", indices::select_all64_portable);
    #[cfg(target_feature = "avx2")]
    b!("avx2_lut", indices::select_all64_avx2);
    #[cfg(target_feature = "avx512f")]
    b!("avx512_compress", indices::select_all64_avx512);
    #[cfg(target_feature = "avx512vbmi2")]
    b!("vbmi2_compressb", indices::select_all64_vbmi2);
    g.finish();

    // Streaming: 8 KiB bitmap at three densities.
    let words = 1usize << 10;
    let mut g = c.benchmark_group("bitmap_to_indices");
    g.throughput(Throughput::Bytes((words * 8) as u64));
    for density in [1u32, 4, 7] {
        let bits = rng.words(words, density);
        let mut out = vec![0u32; words * 64 + 64];
        let label = format!("mask{}/8", density);
        macro_rules! b {
            ($name:literal, $f:path) => {
                g.bench_with_input(BenchmarkId::new($name, &label), &bits, |b, bits| {
                    b.iter(|| $f(black_box(bits), black_box(&mut out)))
                });
            };
        }
        b!("scalar_tzcnt", indices::bitmap_to_indices_scalar);
        b!("portable_lut", indices::bitmap_to_indices_portable);
        #[cfg(target_feature = "avx2")]
        b!("avx2_lut", indices::bitmap_to_indices_avx2);
        #[cfg(target_feature = "avx512f")]
        b!("avx512_compress", indices::bitmap_to_indices_avx512);
        #[cfg(target_feature = "avx512vbmi2")]
        b!("vbmi2_compressb", indices::bitmap_to_indices_vbmi2);
    }
    g.finish();
}

fn bench_bit_to_byte(c: &mut Criterion) {
    let mut rng = Rng::new(7);
    let words = 256usize; // 16 KiB of output bytes
    let bits = rng.words(words, 4);
    let mut out = vec![0u8; words * 64];
    let mut g = c.benchmark_group("bit_to_byte");
    g.throughput(Throughput::Bytes((words * 64) as u64));
    macro_rules! b {
        ($name:literal, $f:path) => {
            g.bench_function($name, |b| {
                b.iter(|| {
                    $f(black_box(&bits), black_box(&mut out));
                    black_box(&out);
                })
            });
        };
    }
    b!("scalar", bit_to_byte::bits_to_bytes_scalar);
    b!("swar", bit_to_byte::bits_to_bytes_swar);
    b!("portable_select", bit_to_byte::bits_to_bytes_portable);
    b!("portable_to_simd", bit_to_byte::bits_to_bytes_portable_int);
    #[cfg(target_feature = "avx2")]
    b!("avx2", bit_to_byte::bits_to_bytes_avx2);
    #[cfg(target_feature = "avx512bw")]
    b!("avx512", bit_to_byte::bits_to_bytes_avx512);
    #[cfg(target_feature = "bmi2")]
    b!("pdep", bit_to_byte::bits_to_bytes_pdep);
    g.finish();
}

fn bench_expand(c: &mut Criterion) {
    let mut rng = Rng::new(8);
    let words = 1usize << 12;
    let values = rng.words(words, 4);
    let mut out = vec![0u64; words];
    let mut g = c.benchmark_group("expand");
    g.throughput(Throughput::Bytes((words * 16) as u64));
    for density in [1u32, 4, 7] {
        let mask = rng.words(words, density);
        let mut packed = vec![0u64; words + 1];
        filter::filter_naive(&values, &mask, &mut packed);
        let label = format!("mask{}/8", density);
        macro_rules! b {
            ($name:literal, $f:path) => {
                g.bench_with_input(BenchmarkId::new($name, &label), &mask, |b, mask| {
                    b.iter(|| {
                        $f(black_box(&packed), black_box(mask), black_box(&mut out));
                        black_box(&out);
                    })
                });
            };
        }
        b!("naive", expand::expand_naive);
        b!("scalar_hd", expand::expand_scalar);
        b!("portable_u64x8", expand::expand_portable);
        #[cfg(target_feature = "bmi2")]
        b!("bmi2_pdep", expand::expand_bmi2);
        #[cfg(target_feature = "avx512vbmi2")]
        b!("vbmi2_expandb", expand::expand_vbmi2);
    }
    g.finish();
}

fn bench_unpack(c: &mut Criterion) {
    let mut rng = Rng::new(9);
    let n = 1usize << 14; // 16 KiB of output values
    let packed = rng.bytes(n + 64, 8);
    let mut out = vec![0u8; n];
    let mut g = c.benchmark_group("unpack");
    g.throughput(Throughput::Elements(n as u64));
    macro_rules! k {
        ($k:literal) => {{
            let label = format!("k{}", $k);
            macro_rules! b {
                ($name:literal, $f:expr) => {
                    g.bench_with_input(BenchmarkId::new($name, &label), &n, |b, _| {
                        b.iter(|| {
                            $f(black_box(&packed), black_box(&mut out));
                            black_box(&out);
                        })
                    });
                };
            }
            b!("scalar", unpack::unpack_scalar::<$k>);
            b!("portable_mul", unpack::unpack_portable_mul::<$k>);
            b!("portable_shift", unpack::unpack_portable_shift::<$k>);
            #[cfg(target_feature = "bmi2")]
            b!("pdep", unpack::unpack_pdep::<$k>);
            #[cfg(target_feature = "avx2")]
            b!("avx2", unpack::unpack_avx2::<$k>);
            #[cfg(target_feature = "avx512bw")]
            b!("avx512", unpack::unpack_avx512::<$k>);
            #[cfg(target_feature = "avx512vbmi")]
            b!("vbmi_multishift", unpack::unpack_vbmi::<$k>);
        }};
    }
    k!(1);
    k!(3);
    k!(7);
    g.finish();
}

criterion_group!(
    benches,
    bench_byte_to_bit,
    bench_rank,
    bench_select,
    bench_filter,
    bench_rank_index,
    bench_indices,
    bench_bit_to_byte,
    bench_expand,
    bench_unpack
);
criterion_main!(benches);
