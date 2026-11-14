"""S496 — read496_m1l1.py: the Fable read of the Sonnet drafts for Mark 1–15 (batch m1) and Luke 1–21 (batch l1), S502. Every card was read against
both verses and the voice standard; the corrections below are applied to out/<book>_<N>_draft.json and written to out/<book>_<N>_fixed.json (the
drafts stay as drafted). Newlines inside prose are flattened to one line, as in b1–b5. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, re, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
E = {
 ('mark', 5): {
  # "the title is Abram's own" — El Elyon is the title Abram heard at Salem, not his own
  5050: dict(prose="The spirit calls him Son of the Most High, and the title goes back to Abram's day. Melek Tsadiq (Melchizedek) met him as *the priest of the El Elyon (most high God)*, so the one the legion begs by is the Elohim (God) of Abraham, and the man in the tombs is standing in front of his Son."),
 },
 ('mark', 6): {
  # "in its own words" — the brief's instruction to the drafter leaking into the reader's prose
  5068: dict(prose="Twelve men are called and sent out, and the city in Revelation has *twelve gates* with the names of *the twelve tribes of the children of Yashar'el (Israel)* written on them. The gates carry the tribes, and the number Mark opens with is the number of the tribes."),
 },
 ('mark', 7): {
  # "she looks like one of those sheep" — Matthew's sentence says who she is; the brief's reading is firm, not a hedge
  5116: dict(prose="Mark does not repeat the sentence Matthew keeps, but it explains the woman he is about to meet. Yahusha (Jesus) tells the disciples he is sent *unto the lost sheep of the house of Yashar'el (Israel)*, and Mark says of her only that *The woman was a Greek, a Syrophenician by nation* (Mark 7:26). Read side by side, Matthew's sentence tells who she is: one of those lost sheep, a daughter of the scattered house living as a Greek among the nations."),
 },
 ('mark', 12): {
  # a callback to Mark 12:33 in straight quotes — made an italic quotation with its citation
  5253: dict(prose="Samuel asked whether Yahuah (the LORD) delights in offerings as much as in being obeyed, and answered, *to obey is better than sacrifice*. The scribe's *is more than all whole burnt offerings and sacrifices* (Mark 12:33) is that same ranking, with the obeying of the voice put first."),
 },
 ('mark', 13): {
  5286: dict(prose="John sees the same coming: *he cometh with clouds*, and *every eye shall see him*, even *they also which pierced him*. Where Mark says they shall see, Revelation says who is among the seers and that *all kindreds of the earth shall wail* because of him."),
 },
 ('luke', 7): {
  # the centurion is seed revealed; the card said only that his faith was weighed against the house
  7006: dict(prose="The words are the same in both gospels. Luke adds who stood around the soldier: the elders of the Yahudim (Jews) went first, saying *he loveth our nation, and he hath built us a synagogue* (Luke 7:5), and he sent friends to say *I am not worthy* (Luke 7:6). He knew what a word can do, and Yahusha (Jesus) says of this soldier what he had not found in the house at home, *no, not in Yashar'el (Israel)*: a sheep who heard, out where the house was scattered."),
 },
 ('luke', 11): {
  7041: dict(member_sentence="Matthew gives the same answer, naming as his brother and sister and mother whoever does the will of his Father in heaven."),
 },
 ('luke', 15): {
  # "Read line on line" / "so this is a reading" — the brief's words to the drafter; the reading itself stays, said plainly
  7061: dict(prose="The son in the far country says *I will arise and go to my father*, and Ezekiel's verse says what such a turning is worth: the wicked man who turns from all his sins and keeps the statutes *shall surely live*. The father says *this my son was dead, and is alive again* (Luke 15:24). Luke does not name the houses, but set beside the prophets the son who went into a far country and came home is the divorced house of Yashar'el (Israel) coming back from the nations."),
 },
}
# new-thread summaries: the same leaked phrases
NT = {
 ('mark', 13, 'mark-13-signs-and-wonders-do-not-vouch-for-the-prophet'): ("Each of the three says it in its own words, and together they agree with what Yahusha (Jesus) says in Mark:", "Moses, John and Paul agree with what Yahusha (Jesus) says in Mark:"),
 ('luke', 1, 'luke-1-the-throne-of-his-father-david-and-the-kingdom-without-end'): ("Daniel was shown a kingdom given in his own vision, and he says it in his own words:", "Daniel was shown the same kingdom given, in a vision of his own:"),
}
tot = 0
for batch in ('m1', 'l1'):
    book, chapters = BATCHES[batch]
    for ch in chapters:
        p = W6 / 'out' / f'{book}_{ch}_draft.json'
        if not p.exists(): continue
        d = json.load(open(p)); n = 0
        for c in d['cards']:
            for k, v in (E.get((book, ch), {}).get(c['id']) or {}).items(): c[k] = v; n += 1
            c['prose'] = re.sub(r"\s*\n+\s*", " ", c['prose']).strip()
        assert set(E.get((book, ch), {})) <= {c['id'] for c in d['cards']}, (book, ch)
        for t in d.get('new_threads') or []:
            old, new = NT.get((book, ch, t['slug']), (None, None))
            if old: assert old in t['summary_md'], t['slug']; t['summary_md'] = t['summary_md'].replace(old, new); n += 1
        d['read'] = f"Read on Claude Fable 5.1 (claude-fable-5-1), 2026-11-14 (S502): every card read against both verses and the voice standard; {n} correction(s) applied in read496_m1l1.py; drafted on {d['model']}."
        json.dump(d, open(W6 / 'out' / f'{book}_{ch}_fixed.json', 'w'), ensure_ascii=False, indent=1)
        if n: print(book, ch, 'corrections', n)
        tot += n
print('total corrections', tot)
