#!/usr/bin/env python3
"""Turns results/bench-{v3,native}.txt (criterion text output) into a markdown table."""
import re, sys, pathlib

root = pathlib.Path(__file__).parent
cfgs = ["v3", "native"]
rows = {}   # (group, name) -> {cfg: (time_ns, unit_str, thrpt_str)}
order = []

def parse(cfg):
    text = (root / "results" / f"bench-{cfg}.txt").read_text()
    lines = text.splitlines()
    for i, line in enumerate(lines):
        # criterion prints "id   time: [..]" on one line, or the id alone on the previous
        # line when it is longer than 23 characters.
        m = re.match(r"^(\S*)\s+time:\s+\[(\S+) (\S+) (\S+) (\S+) (\S+) (\S+)\]", line)
        if not m:
            continue
        bench = m.group(1) or lines[i - 1].strip()
        mid, unit = float(m.group(4)), m.group(5)
        ns = mid * {"ns": 1, "µs": 1e3, "ms": 1e6, "s": 1e9}[unit]
        thr = ""
        if i + 1 < len(lines):
            t = re.search(r"thrpt:\s+\[\S+ \S+ (\S+ \S+) ", lines[i + 1])
            if t:
                thr = t.group(1)
        group, _, name = bench.partition("/")
        key = (group, name)
        if key not in rows:
            rows[key] = {}
            order.append(key)
        rows[key][cfg] = (ns, thr)

for c in cfgs:
    try:
        parse(c)
    except FileNotFoundError:
        pass

def fmt(ns):
    return f"{ns/1e3:.2f} µs" if ns >= 1e3 else f"{ns:.1f} ns"

out = []
cur = None
for group, name in order:
    if group != cur:
        cur = group
        out.append(f"\n### {group}\n")
        out.append("| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |")
        out.append("|---|---|---|---|---|")
    r = rows[(group, name)]
    cells = []
    for c in cfgs:
        if c in r:
            cells += [fmt(r[c][0]), r[c][1]]
        else:
            cells += ["–", "–"]
    out.append(f"| {name} | " + " | ".join(cells) + " |")
print("\n".join(out))
