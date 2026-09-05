//! `cargo run --release` (natively on aarch64, or under qemu for correctness only).
use std::hint::black_box;
use std::time::Instant;
use to_bitmask_loop::*;

fn main() {
    const N: usize = 1 << 14; // 16 KiB of bytes -> 256 words, L1-resident
    let mut x = 0x9E37_79B9_7F4A_7C15u64;
    let bytes: Vec<u8> = (0..N)
        .map(|_| {
            x ^= x << 13; x ^= x >> 7; x ^= x << 17;
            if x & 1 == 1 { (x >> 8) as u8 | 1 } else { 0 }
        })
        .collect();
    let mut expect = vec![0u64; N / 64];
    scalar_loop(&bytes, &mut expect);

    let mut run = |name: &str, f: fn(&[u8], &mut [u64])| {
        let mut out = vec![0u64; N / 64];
        f(&bytes, &mut out);
        assert_eq!(out, expect, "{name} mismatch");
        let iters = 20_000;
        for _ in 0..1_000 { f(black_box(&bytes), black_box(&mut out)); }
        let t = Instant::now();
        for _ in 0..iters { f(black_box(&bytes), black_box(&mut out)); }
        let ns = t.elapsed().as_nanos() as f64 / iters as f64;
        println!("{name:18} {:8.1} ns/iter  {:6.2} GB/s  {:5.2} ns/word", ns, N as f64 / ns, ns / (N / 64) as f64);
    };
    run("portable_u8x64", to_bitmask_loop);
    run("portable_u8x32", to_bitmask32_loop);
    #[cfg(target_arch = "aarch64")]
    run("neon", neon_loop);
}
