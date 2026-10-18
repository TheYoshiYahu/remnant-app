Load my voice skill and mount my Desktop. Read ~/Desktop/App/S446_SESSION_HANDOFF.md (the S455b, "Canon fix
(step C)" and S456 sections at the bottom), S451_APP_FEATURE_ROADMAP.md, and XREF_LIBRARY_COVERAGE_ROADMAP.md
(the 2026-10-18 S456 general map at the end).

Bible app order: bugs ✓ → content audit (Jasher ✓, Jubilees ✓, Apocrypha KJV ✓, charles-vol1 retired ✓,
canon KJV fixed ✓ S456) → cross-references ← NOW → features → store/billing → offline → voices LAST.
Google/library parked.

Check first: S456 should be pushed (git log shows 'S456: canon KJV fix — Psalm titles…'); if not, print the
commit + push line again and keep going. If I pasted _s456_check.py output anywhere, read it; otherwise
tell me to run `python3 ~/Desktop/App/_s456_check.py` and read the titles and the 14 epistle endings.

This session — cross-references, general to specific:
1. Live read-back first (one script for me to paste, like _s456_check.py): which cross-reference migrations
   are actually applied (schema_version history, thread/card counts per source book and per edition), so the
   June "pending apply" notes (S181/S194/S216 John canon) are settled by evidence, not by file listing.
2. Then the fidelity sweep, Enoch first: every card whose note quotes 1 Enoch — read the quoted words against
   the rebuilt Charles 1917 text (source-texts/enoch-charles-1917/, enoch-verse-status.json, enoch-citation-sweep.md:
   796 "different" + 87 reworded + 138 moved). Give me the general map of that sweep (how many stand, how many
   need the note rewritten, how many need re-anchoring) BEFORE any card is rewritten. Rewrites are in my voice,
   Come-and-See (quote in full, stand-alone italics), Rule 10 (ids kept), scratch-tested, one deploy script.
3. Then Jubilees (102 moved / 97 "no evidence" — jub-card-sort-report.md) and Apocrypha the same way.
4. Not this session unless time allows: the 8 canon-only S181/183/184/185/194 baseline files the guard still
   fails on (superseded by S212/S216/S219/S223/S224 — decide retire vs. keep), and the right-hand/face-east
   thematic extras.

Housekeeping, on my word only (ask one question each): the Finder duplicates "… 2.sql"/"… 2.json" beside
session420/424/427/428 and trial_reminders_add_sent_at; canon.modernized.json (June, stale).

Rules: terminal blocks for me to paste, never type into my apps; never Cmd+A or Backspace; one question at
a time; explain git plainly; save over originals, no v2 copies; verify by content, never by counts; wrap at
~25–30 turns.
