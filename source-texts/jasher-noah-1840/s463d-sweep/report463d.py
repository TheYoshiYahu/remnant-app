"""S463d — write jasher-sweep-report.md from the JSONs (regrade, fix set, cold reads, voice findings, scratch read-back). Numbers come from the files, not from memory."""
import json, re, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
R = json.load(open(HERE/'regrade.json')); RM = json.load(open(HERE/'regrade_members.json')); RT = json.load(open(HERE/'regrade_threads.json'))
cards = {int(k): v for k, v in json.load(open(HERE/'fix'/'fix_cards.json')).items()}
members = json.load(open(HERE/'fix'/'fix_members.json')); summaries = json.load(open(HERE/'fix'/'fix_summaries.json'))
g = json.load(open(HERE/'out'/'gloss450.json')); st = json.load(open(HERE/'out'/'stale.json'))
cold = [json.load(open(HERE/'out'/f)) for f in ('cold1.json', 'cold2.json')]
voice = sum((json.load(open(HERE/'out'/f)) for f in ('voice_00_findings.json', 'voice_01_findings.json', 'voice_summaries_findings.json')), [])
anch = [o for o in R if o['verdict'] != 'MENTION_ONLY']
qv = collections.Counter(q['verdict'] for o in anch for q in o.get('quotes', []))
mm = [m for m in RM if m.get('verdict') not in (None, 'MENTION_ONLY')]
mq = collections.Counter(q['verdict'] for m in mm for q in m.get('quotes', []))
an = [t for t in RT if t['anchored']]
K = collections.Counter(v['kind'] for v in cards.values())
cv = collections.Counter(v['verdict'] for c in cold for i in c for v in i['verdicts'])
lines = [f"""# S463d — Book of Jasher card sweep (Oct 23, 2026)

Chain: dump (Yoshi's paste) → regrade every quotation by content → map → build one Rule 10 migration → three reads → scratch ×2 → read-back → deploy.

## Dump
3,910 live Jasher verses in 91 chapters (7:51, 9:39, 20:30 — the S450 split is live). {len(R):,} cards came back; **{len(anch):,} are anchored in Jasher** ({sum(1 for o in anch if o['side']=='S'):,} Jasher→other, {sum(1 for o in anch if o['side']=='T')} other→Jasher). The other {len(R)-len(anch):,} were the dump's `yashar` filter matching *Yashar'el* — only one really names Jasher (158845, Joshua 10:13, canon↔canon) and it is out of scope. Other ends: {dict(collections.Counter(o['other_ed'] for o in anch))}.

## Map (plain numbers)
- Jasher quotations, every quotation in every note graded: {sum(qv.values())} — {qv.get('STAND',0)} STAND, {qv.get('REWORDED',0)} REWORDED, {qv.get('RE_ANCHOR',0)} RE_ANCHOR, {qv.get('NOT_FOUND',0)} NOT_FOUND. {sum(1 for o in anch if o['verdict']=='NO_JASHER_QUOTE'):,} cards quote only the other end (canon-first glosses; left as they are, as S463c left its 2,746). Their canon lead quotes: 1,428/1,429 verbatim canon.json; 30027 (Matthew 4:10) carried the old compound rendering.
- Degraded prose, judged in the prose only: {sum(1 for o in anch if o['degraded'])} marker notes + {sum(1 for o in anch if o['hyphen_chain'] and not o['degraded'])} hyphen-chain-only = **{sum(1 for o in anch if o['degraded'] or o['hyphen_chain'])} cards rebuilt**. Slug citations 0. Hebrew book names 0.
- Glosses on S450-changed verses: {len(g)} read by content — {sum(1 for x in g if x['verdict']=='STAY')} stay, {sum(1 for x in g if x['verdict']=='MOVE')} move, {sum(1 for x in g if x.get('new_note'))} quotation patches (49945, 54994). The 20 S450 moves all sit on the verse their note names.
- Notes naming a Jasher verse off the card's address: {len(st)} read — {sum(1 for x in st if x['verdict']=='STAY')} stay (the prose names a range the card sits inside), {sum(1 for x in st if x['verdict']=='MOVE')} moved (31322 → 34:55).
- Member notes on Jasher cards: {len(mm):,} — quotations {mq.get('STAND',0)} STAND / {mq.get('REWORDED',0)} REWORDED / {mq.get('OFF',0)} OFF; {sum(1 for m in mm if m['degraded'] or m['hyphen_chain'])} flagged for markers/chains.
- Thread summaries anchored in Jasher: {len(an)} — {sum(len(t['off']) for t in an)} quotations off in {sum(1 for t in an if t['off'])} (four still quoting the old 7:18 blob, one at 9:7, two "the El Shaddai", "from from there", "THE END"…); {sum(1 for t in an if (t['degraded'] and t['id'] not in (6295,8940)) or t['hyphen_chain'])} with markers/chains (34 "the Jubilees apparatus", "the framework demands", "word for word in substance", hyphen-chains); 6295 and 8940 say *substance* meaning goods and were left.

## Build — `data-schema/migrations/session463d_jasher_sweep.sql`
- {K['PROSE']} notes rebuilt Come-and-See (full live Jasher verse in italics, cited; the other verse from canon.json or the live extra; prose), {K.get('PROSE_MOVE',0)} re-pointed.
- {K.get('REQUOTE',0)} re-quoted with prose kept: 4265 (whole of 45:32), 30027 (canon.json "Yahuah Elohayka"), 20237 (cited 13:22–23 — the quotation begins in 13:22; caught by the scratch read-back).
- {K.get('GLOSS_PATCH',0)} quotation patches on S450-changed verses: 49945 "take from there", 54994 "El Shaddai (the Almighty God)".
- {K.get('STALE_MOVE',0)} move: 31322 Jasher 34:60 → 34:55 (Deuteronomy 11:25 — the verse that names the Canaanite kings).
- {len(members)} member notes ({sum(1 for m in members if m['kind']=='PROSE')} on rebuilt cards, {sum(1 for m in members if m['kind']!='PROSE')} re-quoted on their own); {len(summaries)} summaries (jargon out; {sum(1 for t in an if t['off'])+1} with quotations re-cited to the verse the words now sit in, incl. 6797 12:25→12:24 and 8958's em-dash aside clarified).
- Guards: skip with NOTICE if a card is not at its read-back address or a card already sits on the destination; RAISE if the live verse differs from the read-back or a rebuilt note does not quote it verbatim. Idempotent.

## Reads
- Every gloss on a changed verse read by content (one reader, 36 + 13); every address decision read cold by two agents that never saw the build: {cv.get('AGREE',0)} AGREE / {cv.get('DISAGREE',0)} DISAGREE / {cv.get('UNSURE',0)} UNSURE across {len(cold[0])} decisions (1 card move, 26 summary re-citations).
- Every rebuilt note, member note and summary read cold against the voice skill by three readers: {len(voice)} findings, all applied — """ + '; '.join(f"{f.get('id') or f.get('thread_id')} ({f['problem'][:70].strip()}…)" for f in voice) + f""".

## Scratch (seeded from the Oct 23 read-back with full live text and ids)
Run 1 = 58 in place, 1 moved, 58 member notes, 65 summaries, 0 skipped, 0 absent. Run 2 = 0 changed, 59 landed. Post-run read-back: cards 59/59, member notes 58/58, summaries 65/65, **1,628 Jasher quotations verbatim at their cited verse (every quotation in every note), 0 degraded markers, 0 hyphen-chains, 0 slug citations, 0 duplicate pairs; 53/53 rebuilt notes carry the whole live verse.** Guards tested: live text changed → RAISE + ROLLBACK; card moved since read-back → skipped with NOTICE.

## For Yoshi (not blocking)
- Live Jasher misprints (text lane, not this sweep): 51:50 "Abraham, Isaac, **end** Jacob"; 90:23 "Elazer" for Eleazar; Jubilees 6:5 live text opens with a stray `"`.
- Agent flags worth your eye: 29191 (thread `jasher-6-altar-covenant-bow` — Jasher 6:41 has no altar; the note now says what the verse says); 38883 (Exodus 12:38 is the closer canon line to Jasher 81:2 than 12:36 — card kept on 12:36); 28104 (Jubilees and Jasher date the war with Esau differently — the note no longer says one "stands behind" the other); 31317 (34:69 ↔ Genesis 48:22 could live on 34:60 — a thread choice); 30591 and 39005 (a tighter verse exists inside the range the note names: 29:14, 87:1 — neither is wrong where it sits).
- Many older summaries use bare sacred names in their own prose ("Yahuah meets Abram") — outside this sweep's scope (changed as little as possible); a separate pass if wanted.
- 1,624 Jasher glosses remain canon-first (not Come-and-See) — not broken; later pass if wanted, same as the Apocrypha's 2,746.
"""]
(HERE/'jasher-sweep-report.md').write_text(''.join(lines)); print('written', HERE/'jasher-sweep-report.md')
