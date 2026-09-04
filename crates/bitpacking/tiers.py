#!/usr/bin/env python3
"""Best variant per tier (auto-vectorised scalar / portable SIMD / intrinsics) per kernel and cfg."""
import re, sys, pathlib
root = pathlib.Path(__file__).parent
cfgs = sys.argv[1:] or ["v3", "native", "a64", "a64sve2"]

def parse(cfg):
    L = (root / "results" / f"bench-{cfg}.txt").read_text().splitlines(); d = {}
    for i, l in enumerate(L):
        m = re.match(r"^(\S*)\s+time:\s+\[\S+ \S+ (\S+) (\S+) \S+ \S+\]", l)
        if not m: continue
        name = m.group(1) or L[i - 1].strip()
        d[name] = float(m.group(2)) * {"ns": 1, "µs": 1e3, "ms": 1e6}[m.group(3)]
    return d
R = {}
for c in cfgs:
    try: R[c] = parse(c)
    except FileNotFoundError: pass

def tier(v):
    if "portable" in v and not any(x in v for x in ("pdep", "neon", "sve2")): return "portable"
    if any(x in v for x in ("avx", "bmi2", "pdep", "pext", "vbmi", "vpopcnt", "neon", "sve2")): return "intr"
    return "auto"
def fmt(ns): return f"{ns/1e3:.1f}µs" if ns >= 1e3 else f"{ns:.0f}ns"
def short(k): return k.split("/", 1)[1].split("/")[0]
reps = [("byte→bit", "byte_to_bit", None), ("rank/popcount", "rank", "1024"), ("select64 in-word", "select64", None),
        ("select whole", "select", None), ("filter (PEXT)", "filter", "mask4/8"), ("expand (PDEP)", "expand", "mask4/8"),
        ("rank index", "rank_index", "1024"), ("select_all64", "select_all64", None),
        ("bitmap→indices", "bitmap_to_indices", "mask4/8"), ("bit→byte", "bit_to_byte", None), ("unpack k=3", "unpack", "k3")]
print("| kernel | build | auto-vec (best) | portable (best) | intrinsics (best) | auto→portable | portable→intr |")
print("|---|---|---|---|---|---|---|")
for label, g, p in reps:
    for cfg in R:
        b = {}
        for k, v in R[cfg].items():
            if not k.startswith(g + "/"): continue
            if p is not None and not k.endswith("/" + p): continue
            t = tier(k[len(g) + 1:])
            if t not in b or v < b[t][0]: b[t] = (v, k)
        a, po, i = b.get("auto"), b.get("portable"), b.get("intr")
        cell = lambda x: "–" if x is None else f"{short(x[1])} {fmt(x[0])}"
        r1 = "–" if not (a and po) else f"{a[0]/po[0]:.1f}x"
        r2 = "–" if not (po and i) else f"{po[0]/i[0]:.1f}x"
        print(f"| {label} | {cfg} | {cell(a)} | {cell(po)} | {cell(i)} | {r1} | {r2} |")
