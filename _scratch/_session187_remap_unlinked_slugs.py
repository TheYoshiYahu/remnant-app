#!/usr/bin/env python3
"""
S187 — Remap the 73 unlinked Luke bulk-attach cross-references.

For each unlinked attempted_slug, finds the closest existing thread slug in
the DB via difflib similarity. Above the confidence threshold (default 0.65),
proposes a remap; below threshold, leaves the row unmapped for S188 review.

Two modes:
  python3 _session187_remap_unlinked_slugs.py            # dry-run, propose only
  python3 _session187_remap_unlinked_slugs.py --apply    # apply the remaps

Run from ~/Desktop/App/.
"""

import os
import sys
import difflib
import psycopg2
import psycopg2.extras

DATABASE_URL = os.environ.get("DATABASE_URL")
if not DATABASE_URL:
    # Fall back to file-stored credential per S185 pattern.
    cred_paths = [
        os.path.expanduser("~/Desktop/App/_scratch/_db_url.txt"),
        os.path.expanduser("~/Desktop/App/_scratch/dburl.txt"),
    ]
    for p in cred_paths:
        if os.path.exists(p):
            with open(p) as f:
                DATABASE_URL = f.read().strip()
                break

if not DATABASE_URL:
    sys.exit("DATABASE_URL not set and no credential file found.")

CONFIDENCE_THRESHOLD = 0.65
APPLY = "--apply" in sys.argv

# Manual overrides — places where similarity matching would mis-route by surface
# similarity but framework substance demands a different routing. Keys are
# attempted_slug; values are the canonical existing-thread slug to remap to.
# Empty string means "leave unlinked, queue for S188 NEW thread creation."
MANUAL_OVERRIDES = {
    # Drafter-invented; framework substance has no close existing thread.
    # Queue for S188 NEW thread creation.
    "kinship-redefinition-kingdom-family": "",
    "grace-and-the-opportunity-that-can-be-lost": "",
    "kingdoms-now-under-watcher-rebellion-administration": "",
    "messiah-as-torah-affirming-healer": "",
    "son-of-adam-as-judge-and-ladder": "",
    "take-up-the-cross-discipleship-cost": "",
    "parables-of-the-kingdom-and-the-cause-and-effect-of-hearing": "",
    "first-passion-prediction-and-the-must-of-the-passion": "",
    "bridegroom-messianic-identification": "",
    "trumpets-and-the-day-of-yahuah": "",
    "blasphemy-against-the-ruach-warning": "",
    "sign-of-yonah-resurrection-credential": "",
    "wilderness-feeding-as-messianic-banquet-pre-figuration": "",
    "messianic-line-preservation-by-sovereign-decree": "",
    "the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah": "",
    "the-son-of-adam-glorified-in-1-enoch-throne-vision-and-parables": "",
    "caesarea-philippi-confession-the-rock-the-keys-the-assembly": "",
    "another-gospel-as-judaizer-flesh-credential": "",
    "the-hour-and-the-cup-of-the-fathers-wrath": "",
    "gospel-promised-afore": "",
    "word-made-flesh-formed-of-the-formless": "",
    "the-seed-of-promise-is-singular-paternal": "",
    "avraham-reckoned-before-circumcision": "",
    "son-of-david-messianic-recognition-by-marginalized": "",
    "twelve-apostles-twelve-tribes-restoration-architecture": "",
    "pharisaic-traditions-make-the-commandment-of-none-effect": "",
    "scripture-twisting-and-the-harmonization-discipline": "",
    "my-brethren-substance-distinguishing-the-seed-of-promise-from-the-categorical-nations": "",
    "shake-the-dust-off-rejection-response": "",
}


def main():
    conn = psycopg2.connect(DATABASE_URL, connect_timeout=20)
    conn.autocommit = False
    cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)

    # 1. Pull all existing thread slugs from the DB.
    cur.execute("SELECT slug FROM cross_reference_threads ORDER BY slug")
    existing_slugs = [r["slug"] for r in cur.fetchall()]
    print(f"DB has {len(existing_slugs)} existing threads.")

    # 2. Pull the unlinked attempted_slug list with row counts.
    cur.execute("""
        SELECT substring(x.note from 8 for position(' | ' in x.note) - 8) AS attempted_slug,
               count(*) AS unlinked_count
          FROM cross_references x
          JOIN verses v ON v.id = x.source_verse_id
          JOIN chapters c ON c.id = v.chapter_id
          JOIN books b ON b.id = c.book_id
         WHERE b.slug = 'luke'
           AND x.source = 'manual'
           AND x.note LIKE 'thread:%'
           AND NOT EXISTS (SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = x.id)
         GROUP BY attempted_slug
         ORDER BY unlinked_count DESC, attempted_slug
    """)
    unlinked = cur.fetchall()
    total_rows = sum(r["unlinked_count"] for r in unlinked)
    print(f"\nUnlinked: {len(unlinked)} distinct attempted_slugs, {total_rows} total rows.\n")

    # 3. For each unlinked attempted_slug, propose a remap.
    remap = []
    queued_for_s188 = []

    for row in unlinked:
        attempted = row["attempted_slug"]
        count = row["unlinked_count"]

        # Check exact match (slug exists in DB — link bug?)
        if attempted in existing_slugs:
            print(f"[EXISTS-IN-DB] {attempted} ({count} rows)")
            print(f"  → slug already in DB; investigate why JOIN failed")
            remap.append((attempted, attempted, count, "exact"))
            continue

        # Manual override?
        if attempted in MANUAL_OVERRIDES:
            target = MANUAL_OVERRIDES[attempted]
            if target == "":
                print(f"[QUEUE-S188] {attempted} ({count} rows) — no close framework match")
                queued_for_s188.append((attempted, count))
                continue
            else:
                print(f"[MANUAL]    {attempted} ({count} rows)")
                print(f"  → {target}")
                remap.append((attempted, target, count, "manual"))
                continue

        # Fall back to similarity match.
        matches = difflib.get_close_matches(attempted, existing_slugs, n=3, cutoff=CONFIDENCE_THRESHOLD)
        if matches:
            target = matches[0]
            ratio = difflib.SequenceMatcher(None, attempted, target).ratio()
            print(f"[SIMILAR]   {attempted} ({count} rows) — conf={ratio:.2f}")
            print(f"  → {target}")
            if len(matches) > 1:
                for m in matches[1:]:
                    r = difflib.SequenceMatcher(None, attempted, m).ratio()
                    print(f"    alt → {m} (conf={r:.2f})")
            remap.append((attempted, target, count, f"sim={ratio:.2f}"))
        else:
            print(f"[QUEUE-S188] {attempted} ({count} rows) — no match above {CONFIDENCE_THRESHOLD}")
            queued_for_s188.append((attempted, count))

    print()
    print(f"=== PROPOSED REMAP ===")
    print(f"  {len(remap)} slugs will be remapped ({sum(r[2] for r in remap)} rows)")
    print(f"  {len(queued_for_s188)} slugs queued for S188 ({sum(r[1] for r in queued_for_s188)} rows)")

    if not APPLY:
        print("\nDRY-RUN. Re-run with --apply to execute.")
        conn.close()
        return

    # 4. Apply the remaps.
    print("\n=== APPLYING ===")
    remapped_xref_count = 0
    linked_member_count = 0

    for attempted, target, count, reason in remap:
        if attempted == target:
            # Exact match — slug exists in DB, just re-link.
            cur.execute("""
                INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
                SELECT t.id, x.id,
                       COALESCE((SELECT MAX(sort_order) FROM cross_reference_thread_members WHERE thread_id = t.id), 0) +
                         ROW_NUMBER() OVER (PARTITION BY t.id ORDER BY x.id),
                       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
                  FROM cross_references x
                  JOIN cross_reference_threads t ON t.slug = %s
                  JOIN verses sv ON sv.id = x.source_verse_id
                  JOIN chapters sc ON sc.id = sv.chapter_id
                  JOIN books sb ON sb.id = sc.book_id
                 WHERE sb.slug = 'luke'
                   AND x.source = 'manual'
                   AND x.note LIKE %s
                   AND NOT EXISTS (SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = x.id)
                ON CONFLICT (thread_id, cross_reference_id) DO NOTHING
            """, (target, f"thread:{attempted} | %"))
            linked_member_count += cur.rowcount
        else:
            # Remap: UPDATE cross_references.note to use target slug.
            cur.execute("""
                UPDATE cross_references
                   SET note = 'thread:' || %s || substring(note from position(' | ' in note))
                 WHERE source = 'manual'
                   AND note LIKE %s
                   AND source_verse_id IN (
                     SELECT v.id FROM verses v
                       JOIN chapters c ON c.id = v.chapter_id
                       JOIN books b ON b.id = c.book_id
                      WHERE b.slug = 'luke'
                   )
                   AND NOT EXISTS (
                     SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = cross_references.id
                   )
            """, (target, f"thread:{attempted} | %"))
            updated = cur.rowcount
            remapped_xref_count += updated

            # Now link those rows to the target thread.
            cur.execute("""
                INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
                SELECT t.id, x.id,
                       COALESCE((SELECT MAX(sort_order) FROM cross_reference_thread_members WHERE thread_id = t.id), 0) +
                         ROW_NUMBER() OVER (PARTITION BY t.id ORDER BY x.id),
                       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
                  FROM cross_references x
                  JOIN cross_reference_threads t ON t.slug = %s
                  JOIN verses sv ON sv.id = x.source_verse_id
                  JOIN chapters sc ON sc.id = sv.chapter_id
                  JOIN books sb ON sb.id = sc.book_id
                 WHERE sb.slug = 'luke'
                   AND x.source = 'manual'
                   AND x.note LIKE %s
                   AND NOT EXISTS (SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = x.id)
                ON CONFLICT (thread_id, cross_reference_id) DO NOTHING
            """, (target, f"thread:{target} | %"))
            linked_member_count += cur.rowcount

    conn.commit()
    print(f"  cross_references.note remapped: {remapped_xref_count}")
    print(f"  cross_reference_thread_members linked: {linked_member_count}")

    # 5. Final state.
    cur.execute("""
        SELECT count(*) AS unlinked_remaining
          FROM cross_references x
          JOIN verses v ON v.id = x.source_verse_id
          JOIN chapters c ON c.id = v.chapter_id
          JOIN books b ON b.id = c.book_id
         WHERE b.slug = 'luke'
           AND x.source = 'manual'
           AND x.note LIKE 'thread:%'
           AND NOT EXISTS (SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = x.id)
    """)
    remaining = cur.fetchone()["unlinked_remaining"]
    print(f"\n  Unlinked remaining (expect {sum(r[1] for r in queued_for_s188)} queued for S188): {remaining}")

    conn.close()

    # 6. Write S188 queue log.
    if queued_for_s188:
        log_path = os.path.expanduser("~/Desktop/App/_scratch/_session187_unlinked_queued_for_s188.md")
        with open(log_path, "w") as f:
            f.write("# S187 — Slugs queued for S188 (drafter-invented, no close existing match)\n\n")
            f.write(f"Total: {len(queued_for_s188)} slugs, {sum(r[1] for r in queued_for_s188)} rows.\n\n")
            f.write("These rows live in `cross_references` (Luke source, source='manual', "
                    "note='thread:<slug> | <prose>') but their target slugs don't match any "
                    "existing thread. They are queryable via direct cross_references lookup but "
                    "do not surface in the chapter-end card.\n\n")
            f.write("Fix path: at S188 (Luke EXTRAS migration) re-walk the inventory; either "
                    "rename to a current canonical slug or create NEW threads for the genuinely "
                    "novel framework patterns.\n\n")
            f.write("| Attempted slug | Rows |\n")
            f.write("|---|---|\n")
            for slug, count in queued_for_s188:
                f.write(f"| `{slug}` | {count} |\n")
        print(f"\n  S188 queue log written: {log_path}")


if __name__ == "__main__":
    main()
