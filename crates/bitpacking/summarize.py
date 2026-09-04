#!/usr/bin/env python3
"""Turns results/bench-<cfg>.txt (criterion text output) into a markdown table, one time column per cfg."""
import re, sys, pathlib

root = pathlib.Path(__file__).parent
cfgs = sys.argv[1:] or ["v3", "native", "a64", "a64sve2"]
rows, order = {}, []

def parse(cfg):
    lines = (root / "results" / f"bench-{cfg}.txt").read_text().splitlines()
    for i, line in enumerate(lines):
        # criterion prints "id   time: [..]" on one line, or the id alone on the previous line when it is long
        m = re.match(r"^(\S*)\s+time:\s+\[(\S+) (\S+) (\S+) (\S+) (\S+) (\S+)\]", line)
        if not m:
            continue
        bench = m.group(1) or lines[i - 1].strip()
        ns = float(m.group(4)) * {"ns": 1, "µs": 1e3, "ms": 1e6, "s": 1e9}[m.group(5)]
        group, _, name = bench.partition("/")
        key = (group, name)
        if key not in rows:
            rows[key] = {}
            last = max((i for i, k in enumerate(order) if k[0] == group), default=None)
            order.insert(len(order) if last is None else last + 1, key)
        rows[key][cfg] = ns

present = []
for c in cfgs:
    try:
        parse(c); present.append(c)
    except FileNotFoundError:
        pass

def fmt(ns):
    return f"{ns/1e3:.2f} µs" if ns >= 1e3 else f"{ns:.1f} ns"

out, cur = [], None
for group, name in order:
    if group != cur:
        cur = group
        out.append(f"\n### {group}\n")
        out.append("| variant | " + " | ".join(present) + " |")
        out.append("|---|" + "---|" * len(present))
    r = rows[(group, name)]
    out.append(f"| {name} | " + " | ".join(fmt(r[c]) if c in r else "–" for c in present) + " |")
print("\n".join(out))
