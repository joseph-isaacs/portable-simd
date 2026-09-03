//! Tiny deterministic RNG so tests and benches share input generation without extra deps.

/// xorshift64* – good enough for test data.
#[derive(Clone)]
pub struct Rng(pub u64);

impl Rng {
    pub fn new(seed: u64) -> Self {
        Rng(seed | 1)
    }

    #[inline]
    pub fn next_u64(&mut self) -> u64 {
        let mut x = self.0;
        x ^= x >> 12;
        x ^= x << 25;
        x ^= x >> 27;
        self.0 = x;
        x.wrapping_mul(0x2545F4914F6CDD1D)
    }

    /// Random word where each bit is set with probability ~`ones_out_of_8 / 8`.
    pub fn word_with_density(&mut self, ones_out_of_8: u32) -> u64 {
        // Combine 3 random words: AND lowers density to 1/8 steps, OR raises it.
        let a = self.next_u64();
        let b = self.next_u64();
        let c = self.next_u64();
        match ones_out_of_8 {
            0 => 0,
            1 => a & b & c,
            2 => a & b,
            3 => a & (b | c),
            4 => a,
            5 => a | (b & c),
            6 => a | b,
            7 => a | b | c,
            _ => !0,
        }
    }

    pub fn words(&mut self, n: usize, ones_out_of_8: u32) -> Vec<u64> {
        (0..n).map(|_| self.word_with_density(ones_out_of_8)).collect()
    }

    /// Bitmap of alternating true/false runs with geometrically distributed lengths
    /// (mean `avg_run`), like vortex's `make_correlated_runs` mask: many all-ones and
    /// all-zero words.
    pub fn words_runs(&mut self, n: usize, avg_run: f64) -> Vec<u64> {
        let mut out = vec![0u64; n];
        let mut pos = 0usize;
        let mut current = true;
        let total = n * 64;
        while pos < total {
            let u = (self.next_u64() >> 11) as f64 / (1u64 << 53) as f64;
            let run = ((u.max(1e-12)).ln() / (1.0 - 1.0 / avg_run).ln()) as usize + 1;
            let end = (pos + run).min(total);
            if current {
                for i in pos..end {
                    out[i / 64] |= 1 << (i % 64);
                }
            }
            pos = end;
            current = !current;
        }
        out
    }

    /// Random byte array of `n` elements, each nonzero with probability ~`p_num/8`.
    /// Non-zero values are arbitrary bytes (not just 1) to exercise the `!= 0` semantics.
    pub fn bytes(&mut self, n: usize, ones_out_of_8: u32) -> Vec<u8> {
        (0..n)
            .map(|_| {
                let r = self.next_u64();
                if (r & 7) < ones_out_of_8 as u64 {
                    ((r >> 8) as u8) | 1
                } else {
                    0
                }
            })
            .collect()
    }
}
