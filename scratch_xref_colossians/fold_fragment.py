#!/usr/bin/env python3
"""Orchestrator helper: fold a minion fragment into a book's session migration.
Idempotent — skips if the fragment's delimiter is already present.
Creates the migration with BEGIN/COMMIT + \\echo wrapper if it does not exist.

Usage:
  python3 fold_fragment.py <migration.sql> <fragment.sql> "<Book label>"
"""
import sys, os

mig_path, frag_path, label = sys.argv[1], sys.argv[2], sys.argv[3]
frag = open(frag_path, encoding="utf-8").read().rstrip()
delim = frag.splitlines()[0].strip()           # the "-- ----- fragment: ... -----" line
session = os.path.basename(mig_path).split("_")[0]  # e.g. session218

if not os.path.exists(mig_path):
    header = (f"-- =====================================================================\n"
              f"-- {session.replace('session','Session ')} — {label} FULL-LIBRARY cross-references\n"
              f"-- =====================================================================\n"
              f"-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven\n"
              f"-- per passage). Edition-aware schema; Come-and-See; sacred names restored;\n"
              f"-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.\n"
              f"-- Apply:  python3 api/apply_migration.py {mig_path}\n"
              f"-- =====================================================================\n\n"
              f"\\echo '{session} — {label} cross-references starting...'\nBEGIN;\n\n"
              f"\n\nCOMMIT;\n\\echo '{session} — {label} cross-references complete.'\n")
    open(mig_path, "w", encoding="utf-8").write(header)

mig = open(mig_path, encoding="utf-8").read()
if delim in mig:
    print(f"SKIP (already folded): {os.path.basename(frag_path)}")
    sys.exit(0)

idx = mig.rfind("COMMIT;")
if idx == -1:
    print("ERROR: no COMMIT; in migration", file=sys.stderr); sys.exit(1)
# back up over whitespace before COMMIT
pre = mig[:idx].rstrip()
post = mig[idx:]
mig = pre + "\n\n" + frag + "\n\n\n" + post
open(mig_path, "w", encoding="utf-8").write(mig)
print(f"FOLDED: {os.path.basename(frag_path)} -> {os.path.basename(mig_path)}")
