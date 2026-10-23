"""Write enoch-closeout-report.md from fix463a.json + fix463a_gloss.json (the S463a verification table)."""
import json, re
from pathlib import Path
HERE = Path(__file__).resolve().parent
A = json.load(open(HERE / 'fix463a.json')); G = json.load(open(HERE / 'fix463a_gloss.json'))
cards = G['cards']; ret = [c for c in cards if c['kind'] == 'retire']
moved = [c for c in cards if c['kind'] == 'MOVE' and c['old_addr'] != c['new_addr']]
same_after_trace = [c for c in cards if c['kind'] == 'MOVE' and c['old_addr'] == c['new_addr']]
rew = [c for c in cards if c['kind'] == 'REWRITE']; fits = [c for c in cards if c['kind'] == 'FITS']
n_rows = len(A['cards']) + len(cards) - len(ret); n_mem = len(A['members']) + len(G['members'])
retired_ids = {c['id'] for c in ret}
# a retirement whose twin is itself moved by this fix lands only because the twin moves
moved_ids = {c['id'] for c in cards if c['kind'] != 'retire' and c['old_addr'] != c['new_addr']}
def twin(c):
    m = re.search(r'card (\d+)', c['reason']); return int(m.group(1)) if m else None
def span(x):
    n = len(re.findall(r'\(1 Enoch \d+:\d+(?:[-–]\d+)?\)', x['new_note']))
    return x['addr'] + (' (span)' if '–' in x['new_note'].split('(1 Enoch')[1].split(')')[0] or '-' in x['new_note'].split('(1 Enoch')[1].split(')')[0] else '')
out = []
w = out.append
w(f"""# 1 Enoch close-out — S463a (2026-10-22) — verification table, read by content

Two jobs, one migration (`data-schema/migrations/session463a_enoch_closeout.sql`), scratch-tested twice against a Postgres seeded
from the Oct 19 read-back (`enoch-cards-live.json`, post-S459): run 1 = {len(A['cards']) + len(rew) + len(fits) + len(same_after_trace)} notes rewritten in place,
{len(moved)} moved + rewritten, {n_mem} member notes, {len(ret)} retired ({len(G['members_on_retired'])} member rows), 0 skipped, 0 absent; run 2 = 0 changed,
{n_rows} already landed. Post-run read-back by content: every card ({len(A['cards']) + len(cards) - len(ret)}) and member note ({n_mem}) as written, 0 duplicate pairs,
0 Enoch cards left with degraded markers, {2314 - len(ret)} Enoch cards after. Nothing deployed — the deploy is Yoshi's paste:

    bash ~/Desktop/App/_session463a_enoch_closeout_deploy.sh

Two independent cold reads of the fix were run before it was written to the Desktop (see "Verification" at the end): the first
found 41 cards pointed at the wrong verse and ~25 prose/address mismatches, the second found 5 more; all corrected and
re-tested. The counts above are from the final run.

## Job 1 — the {len(A['cards'])} STAND cards whose prose was degraded (markers: wisdom-stream, the framework reads, Red Line #, apparatus, substance, FRAMEWORK-MAJOR, locked)

Each card kept its verse. The note was rebuilt: the full live 1 Enoch verse (or the two verses the old note spanned) in
stand-alone italics with the citation in parentheses, then hand-written prose — the verse carries, the prose points. Every
canon italic in the prose was checked verbatim against `parsed/canon.json`; every Enoch italic against the live text, and the
migration RAISES if a live verse is not inside its note verbatim. {len(A['members'])} member notes on these cards were rewritten the same way
(`prose463.py` holds every one).

| card | source → 1 Enoch | verses quoted |
|---|---|---|""")
for x in A['cards']:
    cite = re.search(r'\(1 Enoch ([\d:–-]+)\)', x['new_note'])
    w(f"| {x['id']} | {x['src']} → {x['addr']} | {cite.group(1) if cite else x['addr']} |")
w(f"""
## Job 2 — the glosses on verses the S449 rebuild changed ({len(cards) + len(G['questions'])} cards read; the handoff's "641")

Method, general to specific. First the map: for every card whose Enoch verse the rebuild changed (`different` / `reworded` /
`new` in `enoch-verse-status.json`), the OLD text at the card's address (`parsed/enoch.json.pre-s449`) was located in the live
Charles 1917 text. In most cases the old text was a real Charles verse sitting under the wrong number — so the gloss, written
against that text, still fits, and the card is re-pointed to the verse the words actually live on. But not always: some glosses
had been written against the *right* verse already sitting at that number (the authoring text, not the corrupt text), and those
stay where they are — this is what the cold reads caught. Where the old text was invented (no live match), or the gloss cited
words the live verse no longer carries, the gloss was read by hand against the live verse and re-worded, moved to the verse that
carries its thought, or put to Yoshi. Every 1 Enoch address cited inside a note was checked to exist in the live book.

Counts: {len(moved)} re-pointed (ids kept — the card's 1 Enoch end moves whether it is source or target; {len(same_after_trace)} more lands on the
same number after the old text was traced), {len(rew)} re-worded in place, {len(fits)} left standing with a stale verse number or quote patched
(any gloss untouched by this fix still describes its live verse), {len(ret)} retired (once re-pointed, a card already carried the
same pairing on the true verse — see the list), {len(G['questions'])} questions for Yoshi. {len(G['members'])} member notes ride along (same text as their card).

### Retired — duplicates after re-pointing (strike any you want kept; the migration lists them by id)

Every retirement has a surviving twin on the identical pairing: {sum(1 for c in ret if twin(c) not in moved_ids)} twins already stand on the true verse in the live
read-back and are not moved by this fix; {sum(1 for c in ret if twin(c) in moved_ids)} twins are cards this fix moves there (marked *twin moves*) — those
retirements stand only because the twin's move lands, which the migration does first (the DELETE runs before the loop, and
the twin's move is guarded by the same dup check, so a twin that failed to land would leave the pairing empty: read the
summary line for "skipped 0").

| card | pairing | was at | would have landed on | survives as |
|---|---|---|---|---|""")
for c in ret:
    t = twin(c); mv = ' *twin moves*' if t in moved_ids else ''
    other = c['tgt'] if c['src'].startswith('1-enoch') else c['src']
    w(f"| {c['id']} | {other} | {c['old_addr']} | {c['new_addr']} | card {t} at 1 Enoch {c['new_addr']}{mv} |")
w("""
### Questions for Yoshi (left unchanged in the migration)
""")
for q in G['questions']:
    w(f"- **{q['id']}** ({q['src']} → {q['tgt']}, at {q['addr']}): {q['why']}\n  - note: {q['note'][:300]}{'…' if len(q['note'])>300 else ''}\n")
w("""### Every moved / re-worded / patched card

| card | side | source ↔ target | old addr → new addr | action |
|---|---|---|---|---|""")
for c in cards:
    if c['kind'] == 'retire': continue
    act = {'MOVE': 'moved' if c['old_addr'] != c['new_addr'] else 'same number after trace, note patched', 'REWRITE': 're-worded in place', 'FITS': 'stands; address/quote patched'}[c['kind']]
    w(f"| {c['id']} | Enoch is {'source' if c['side']=='S' else 'target'} | {c['src']} ↔ {c['tgt']} | {c['old_addr']} → {c['new_addr']} | {act} |")
w("""
## Verification — two cold reads before anything left the scratchpad

Pass 1 (independent agent, no sight of the build): walked every auto re-pointing and found 41 cards whose gloss described the
live verse *at the old number* (the gloss had been authored against the correct verse, not the corrupt text) — those now stay
put; ~25 prose wordings that no longer matched the live verse; stale addresses inside notes (24:9–12, 44:4, 94:18, 102:12,
38:12, 18:18, 97:24, 96:13, 30:9); and over-restored canon italics in four lead quotes (21285, 21286, 25491, 22542 — restored to
the canon's own rendering: "Adonai (Lord), Adonai (Lord)", "die in Yahusha (Lord)", "El Elyon (most High)"). All corrected.

Pass 2 (second independent agent, on the corrected set): content-word overlap of every moved gloss against the live verse at
the old and the new address, then a hand read of every card where the old verse scored as high. Found and corrected:
- 23897 (Exodus 1:13): "given over to the wolves" is live 89:13, not 89:12 → re-pointed to 89:13.
- 23829 (Psalm 11:4): "the enthroned One ... the God Enoch blesses" is only true of live 84:3 (Enoch's own prayer) → stays at 84:3.
- 19988 (Daniel 7:14): cited range ran past the end of ch. 46 → "46:4-6". 23923 (John 10:16): ran past ch. 90 → "90:37-38".
- 25372 (Proverbs 22:23): "every woe ... in 96:1-4" — the live woes run 96:4-8 → patched. 16043 (Jubilees 7:24): "7:3-4" → "7:4-5".
Pass 2 also confirmed every retirement's twin, every FITS patch, and that the SQL carries exactly the JSON rows and nothing else.
Then the migration was rebuilt and re-run twice on a fresh scratch seed (counts at the top).

## Pre-existing, not touched
- Lead quotes on the Jubilees side of a few glosses span two verses or sit in the modernized register the dump's verse text does
  not match: 21302, 22582, 22602, 21357, 22530, and 16776 (a Jubilees 4:25 card quoting 4:26). Not changed by this pass and not
  verified by the migration; a later canon-quote sweep (roadmap S463b–) can read them.
- The thread summaries (S460) were not touched.
- 23817 carries the word "substance" — that is KJV Genesis 7:23 text, not a degraded marker; left as written.
""")
(HERE / 'enoch-closeout-report.md').write_text('\n'.join(out))
print('report lines', len(out), 'retired', len(ret), 'twin-moves', sum(1 for c in ret if twin(c) in moved_ids), 'rows', n_rows, 'mem', n_mem)
