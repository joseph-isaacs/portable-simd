#![feature(portable_simd)]
#![feature(f16)]
#![feature(cfg_target_has_reliable_f16_f128)]
#![allow(internal_features)]
#![allow(unused_features)]

macro_rules! unary_test {
    { $scalar:tt, $($func:tt),+ } => {
        test_helpers::test_lanes! {
            $(
            fn $func<const LANES: usize>() {
                test_helpers::test_unary_elementwise(
                    &core_simd::simd::Simd::<$scalar, LANES>::$func,
                    &$scalar::$func,
                    &|_| true,
                )
            }
            )*
        }
    }
}

macro_rules! unary_approx_test {
    { $scalar:tt, $($func:tt),+ } => {
        test_helpers::test_lanes! {
            $(
            fn $func<const LANES: usize>() {
                test_helpers::test_unary_elementwise_approx(
                    &core_simd::simd::Simd::<$scalar, LANES>::$func,
                    &$scalar::$func,
                    &|_| true,
                    16,
                )
            }
            )*
        }
    }
}

macro_rules! ternary_test {
    { $scalar:tt, $($func:tt),+ } => {
        test_helpers::test_lanes! {
            $(
            fn $func<const LANES: usize>() {
                test_helpers::test_ternary_elementwise(
                    &core_simd::simd::Simd::<$scalar, LANES>::$func,
                    &$scalar::$func,
                    &|_, _, _| true,
                )
            }
            )*
        }
    }
}

macro_rules! impl_tests {
    { $scalar:tt } => {
        mod $scalar {
            use std_float::StdFloat;

            unary_test! { $scalar, sqrt, ceil, floor, round, trunc, round_ties_even }
            ternary_test! { $scalar, mul_add }

            // https://github.com/rust-lang/miri/issues/3555
            unary_approx_test! { $scalar, sin, cos, exp, exp2, ln, log2, log10 }

            // The implementation of log is a.ln() / b.ln(), so there are 2 inexact operations,
            // hence a larger ulps is needed.
            test_helpers::test_lanes! {
                fn log<const LANES: usize>() {
                    test_helpers::test_binary_elementwise_approx(
                        &core_simd::simd::Simd::<$scalar, LANES>::log,
                        &$scalar::log,
                        &|_, _| true,
                        32,
                    )
                }
            }

            // Pins down the documented halfway-case behavior of the rounding functions, which
            // the elementwise tests above cannot distinguish from the scalar functions being
            // wrong in the same way.
            // See https://github.com/rust-lang/portable-simd/issues/499
            #[test]
            fn round_ties_away_from_zero() {
                use core_simd::simd::Simd;
                let x = Simd::<$scalar, 8>::from_array([
                    0.5, -0.5, 1.5, -1.5, 2.5, -2.5, 3.5, -3.5,
                ]);
                assert_eq!(
                    x.round().to_array(),
                    [1.0, -1.0, 2.0, -2.0, 3.0, -3.0, 4.0, -4.0],
                );
            }

            #[test]
            fn round_ties_even_ties_to_even() {
                use core_simd::simd::Simd;
                let x = Simd::<$scalar, 8>::from_array([
                    0.5, -0.5, 1.5, -1.5, 2.5, -2.5, 3.5, -3.5,
                ]);
                assert_eq!(
                    x.round_ties_even().to_array(),
                    [0.0, -0.0, 2.0, -2.0, 2.0, -2.0, 4.0, -4.0],
                );
            }

            #[test]
            fn trunc_rounds_toward_zero() {
                use core_simd::simd::Simd;
                let x = Simd::<$scalar, 4>::from_array([1.5, -1.5, 1.75, -1.75]);
                assert_eq!(x.trunc().to_array(), [1.0, -1.0, 1.0, -1.0]);
            }

            #[test]
            fn ceil_and_floor() {
                use core_simd::simd::Simd;
                let x = Simd::<$scalar, 4>::from_array([1.5, -1.5, 2.0, -2.0]);
                assert_eq!(x.ceil().to_array(), [2.0, -1.0, 2.0, -2.0]);
                assert_eq!(x.floor().to_array(), [1.0, -2.0, 2.0, -2.0]);
            }

            test_helpers::test_lanes! {
                fn fract<const LANES: usize>() {
                    test_helpers::test_unary_elementwise_flush_subnormals(
                        &core_simd::simd::Simd::<$scalar, LANES>::fract,
                        &$scalar::fract,
                        &|_| true,
                    )
                }
            }
        }
    }
}

#[cfg(target_has_reliable_f16_math)]
impl_tests! { f16 }
impl_tests! { f32 }
impl_tests! { f64 }
