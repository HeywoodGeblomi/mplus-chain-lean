# mplus-chain-lean

Author: Heywood Geblomi. Public snapshot built 24 November 2026.

## What this is

A small Lean 4 (v4.35.0) package. `MplusChain.lean` is a pure computation that links the stored matrices `M_plus` and `A` (from `data/kz_along_A.json` in [HeywoodGeblomi/omega-ed6-h1plus-measure](https://github.com/HeywoodGeblomi/omega-ed6-h1plus-measure) at commit `b7c4a7a`) to a stored 2:1 ratio. Numbers of the form a + b√3 are kept as integer pairs (a, b). No Mathlib.

The file proves, in this encoding: one block of `M_plus` has eigenvalue -(2+√3)^2, the other has eigenvalue -(2+√3), and `A` has eigenvalue (2+√3)^3. The log-rates are then 2, 1, and 3 times log(2+√3), so the ratio is exactly 2:1, and those pieces are 2/3 and 1/3 of log ρ(A).

The exact 2:1 in this package depends on the toy model's sign choice. With physical signs the trace ratio is about 1.40. A is not a sub-action of M_plus.

The file does not prove that these are the only eigenvalues, that `M_plus` is the real H1+ action of the affine map with derivative `A`, or anything about the global Masur-Veech exponents.

## How to check it

You need Lean 4.35.0 (see `lean-toolchain`).

```
lake build
```

Or check the frozen hash file:

```
sha256sum -c FROZEN_v1.sha256
```

## Status

The Lean file is a computation on stored matrices, not a geometric theorem. The hash file is the original frozen hash, unchanged.

No files were skipped from the source tree.
