"""S499c — the Canaanite-woman thread (id 30911) rewritten on Yoshi's reading of Matthew 15:21–28 (Nov 13): title + summary, four S1xx cards
(124214 124215 124216 124217) rebuilt Come-and-See with member notes, three S499 cards (2876 177460 3520) given the reason the bread was withheld.
Writes c15/fix.json after the same text checks the rebuild chain uses (prose_scan, quote_checks, both verses verbatim). Model: Claude Fable 5.1."""
import json, sys, re
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
D = load_live_book('matthew'); L = D['live']; C = {c['id']: c for c in D['cards']}
SLUG = 'matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17'
T = next(t for t in D['threads'] if t['slug'] == SLUG)
M = {m['xref_id']: m for m in D['members'] if m['slug'] == SLUG}
GM = {m['xref_id']: m for m in D['members']}
def q(b, c, v): return parsed_text('canon', b, c, v)

TITLE = "The lost sheep first — the woman of Canaan, the divorced house, and the children's bread (Deuteronomy 24; Hosea 2; Mark 7)"
SUMMARY = f"""It ain't new. A woman cries after him on the coast of Tyre and Sidon, and the disciples want her sent away. His answer is to them, and it tells them who she is:

*{q('matthew',15,24)}* (Matthew 15:24)

That was his whole errand. He had given the twelve the same boundary before he ever met her:

*{q('matthew',10,6)}* (Matthew 10:6)

And she is not a stranger to the house. Hear what she calls him:

*{q('matthew',15,22)}* (Matthew 15:22)

*Son of David* is the covenant word to David's house in the mouth of a woman on a Canaanite coast. She knew whose house the king came from, and she worshipped him. The sheep hear the voice because they are sheep, and Hosea had already named the place where such sheep would be found:

*{q('hosea',1,9)}* (Hosea 1:9)

*{q('hosea',1,10)}* (Hosea 1:10)

So why does he call her a dog, and why is the bread withheld? Because the house she belongs to was put away:

*{q('jeremiah',3,8)}* (Jeremiah 3:8)

And the Torah he gave does not let a husband take back the wife he has put away:

*{q('deuteronomy',24,4)}* (Deuteronomy 24:4)

A woman is bound to her husband as long as he lives, and only a death frees her to be married again:

*{q('romans',7,2)}* (Romans 7:2)

*{q('romans',7,4)}* (Romans 7:4)

He has not died yet. The divorced house cannot be seated at his table while he lives as that husband, so the bread is the children's, the undivorced house of Yahudah (Judah), and the scattered are what we became out there, dogs under the table. Mark keeps the word that carries the timing:

*{q('mark',7,27)}* (Mark 7:27)

First. Not never. She hears the order and does not argue it. She asks for what falls from the table now, and he calls that faith great. The redeeming of the house that was put away comes on the other side of his death, and Hosea says how it ends:

*{q('hosea',2,23)}* (Hosea 2:23)

The order of the sending shows the same two halves. Before the death, *go not into the way of the Gentiles*; after it:

*{q('matthew',28,19)}* (Matthew 28:19)

Not a new people added to the house, but the same house sought in every place it was scattered to, once the death that frees it had been died. Matthew 15 does not say the death is the reason; Deuteronomy, Romans and Mark's *first* say it, line upon line. The woman of Canaan is a woman from that land and a sheep of the house, revealed by her hearing, given the crumbs before her time and the table after it."""

CARDS = {
 124214: dict(prose="Isaiah's order is the order of this coast. The outcasts of Yashar'el (Israel) are gathered, and *others* are gathered to him *beside those that are gathered unto him*: the house already home, and the scattered house still to be brought. When he says he is sent only to the lost sheep, that second gathering is what he is naming, and the woman is of it.",
              phrase="WHOLE", sentence="The outcasts of Yashar'el (Israel) gathered, and others gathered to him beside them, the two houses in Isaiah's order."),
 124215: dict(prose="Isaiah's *sons of the stranger* are the ones who say Yahuah (the LORD) *hath utterly separated me from his people* (Isaiah 56:3), the house made strangers by the putting away. The woman at the table's edge is one of them, taking hold of the covenant from outside the room, keeping the order and asking for the crumbs. Isaiah says such are brought to his holy mountain.",
              phrase="the sons of the stranger, that join themselves to Yahuah (LORD)", sentence="The sons of the stranger who join themselves to Yahuah (the LORD), the house made strangers by exile and brought home to his mountain."),
 124216: dict(prose="This is the psalm of the cross, *why hast thou forsaken me* (Psalm 22:1), and the turning of *all the ends of the world* comes in it after the suffering, not before. They *remember*, which is what a people does who once knew him. What she asked for on this coast before his death, the psalm sets on the far side of it.",
              phrase="All the ends of the world shall remember and turn unto Yahuah (LORD)", sentence="The ends of the world remember and turn, in the psalm of the cross, after the suffering and not before."),
 124217: dict(prose="The word of Yahuah (the LORD) sent Elijah to a widow of Zidon, on this same coast, and she was already commanded to sustain him before he arrived. The word reached her first. Yahusha (Jesus) walks onto the same coast and a woman there already knows him for *thou Son of David* (Matthew 15:22). Twice the sheep on this coast heard before the shepherd came.",
              phrase="WHOLE", sentence="A widow of Zidon commanded to sustain Elijah before he came, the sheep on this coast hearing first."),
 2876:   dict(prose="Before his death he says he is sent only to *the lost sheep of the house of Yashar'el (Israel)*, and the twelve were told *go not into the way of the Gentiles* (Matthew 10:5). After it they are sent to *all nations*. The children first, then the dogs; the sending widens in place and not in people, because the sheep were scattered into every nation and the death that frees the divorced house has now been died.",
              phrase="Go ye therefore, and teach all nations", sentence="After the death and rising the sending goes to all nations, where the scattered sheep are, the second half of the order he kept on this coast."),
 177460: dict(prose="The sheep of the house of Yashar'el (Israel) are scattered, and the woman of Canaan is one of them, called by the name of the coast she was scattered to, *not my people* (Hosea 1:9) until the hearing shows what she is. What Paul calls *the fulness of the Gentiles* is those same sheep found in every place they were driven and gathered home after the death that frees them, not strangers added to the house.",
              phrase="until the fulness of the Gentiles be come in", sentence="The fulness of the Gentiles is the scattered house gathered home, the sheep he was sent to found where they were driven."),
 3520:   dict(prose="She answers with *Truth*, taking the order of the house as it is, the children first and the crumbs for the dogs, and still asks for what falls from the table. The centurion did the same, *I am not worthy that thou shouldest come under my roof* (Matthew 8:8), and he marvelled at both. Neither argues the order, because it was not yet their time, and both ask from inside it.",
              phrase="I have not found so great faith, no, not in Yashar'el (Israel)", sentence="The centurion's lowly asking and the faith Yahusha (Jesus) marvelled at, the same faith the woman shows under the order of the table."),
}
rep = []
def fail(w, m): rep.append(('FAIL', w, m))
def warn(w, m): rep.append(('WARN', w, m))
for x in prose_scan(TITLE): fail('title', x)
for x in prose_scan(SUMMARY): fail('summary', x)
quote_checks(SUMMARY, 'summary', fail, warn)
if words(SUMMARY) < 120: fail('summary', 'short')
out = []
for cid, d in CARDS.items():
    c = C[cid]; w = f"card {cid}"
    assert c['s_book'] == 'matthew'
    tgt = q(c['t_book'], c['t_ch'], c['t_vn']); src = L[f"canon|matthew|{c['s_ch']}:{c['s_vn']}"]; name = TITLES[c['t_book']]
    assert src == c['s_text'] and tgt
    pr = d['prose'].strip()
    if not 12 <= words(pr) <= 90: fail(w, f"prose {words(pr)} words")
    for x in prose_scan(pr): fail(w, x)
    if has_phrase_of(strip_italics(pr), tgt, 9) or has_phrase_of(strip_italics(pr), src, 9): fail(w, 'repeats a verse')
    pool = norm(tgt) + ' | ' + norm(src) + ' | ' + norm(q('matthew', c['s_ch'], c['s_vn']))
    cited = {m.group(1) for m in TRAIL_RE.finditer(pr)} | {m.group(5) for m in LEAD_RE.finditer(pr)}
    for qq in re.findall(r"\*([^*]+)\*", pr):
        if qq in cited: continue
        if not all(pc in pool for pc in pieces(qq)): fail(w, f"italic not from either verse: '{qq}'")
    quote_checks(pr, w, fail, warn)
    ph = d['phrase']; sent = d['sentence']
    if ph != 'WHOLE' and (norm(ph) not in norm(tgt) or ph not in tgt): fail(w, 'member phrase not verbatim')
    for x in prose_scan(sent): fail(w + ' sentence', x)
    quote_checks(sent, w + ' sentence', fail, warn)
    note = compose_note(name, c['t_ch'], c['t_vn'], tgt, src, c['s_ch'], c['s_vn'], pr)
    mnote = compose_member(name, c['t_ch'], c['t_vn'], tgt, ph, sent)
    m = GM.get(cid); 
    if not m: fail(w, 'not in any thread')
    out.append(dict(id=cid, src_ch=c['s_ch'], src_vn=c['s_vn'], src_text=src, tgt_book=c['t_book'], tgt_ch=c['t_ch'], tgt_vn=c['t_vn'], tgt_text=tgt,
                    old_note=c['note'], note=note, thread_id=m['thread_id'], thread_slug=m['slug'], old_member_note=m['member_note'], member_note=mnote))
fails = [r for r in rep if r[0] == 'FAIL']
for r in rep: print(*r)
print('result', 'PASS' if not fails else 'FAIL', len(fails), 'fails', len(rep) - len(fails), 'warns')
if not fails:
    json.dump(dict(thread=dict(id=T['id'], slug=SLUG, old_title=T['title'], title=TITLE, old_summary=T['summary_md'], summary=SUMMARY), cards=out),
              open(W6 / 'c15' / 'fix.json', 'w'), ensure_ascii=False, indent=1)
    print('wrote c15/fix.json', len(out), 'cards')
sys.exit(1 if fails else 0)
