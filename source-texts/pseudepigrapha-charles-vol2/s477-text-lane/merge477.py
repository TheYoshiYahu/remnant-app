#!/usr/bin/env python3
"""S477 text lane — Charles's Books of Adam and Eve (book 784) and 4 Maccabees (book 789).

Track B (S410–S415) parsed the Wesley transcription of Charles 1913 vol. 2 with every print line kept as a verse, so
about half the verses of these two books end mid-clause. This script merges the broken verses back into whole
clauses, keeps the chapter numbering, renumbers the verses 1..n per chapter, and writes:
  * ../../parsed/pseudepigrapha-charles-vol2.json   (saved over the original; backup .pre-s477 taken first)
  * s477_map.json   — for each book: every new verse (ch, vn, text, the old verse numbers it was built from, the
                      old verse whose row keeps its id = the first part), and the old->new address map
  * s477_report.md  — the counts

Merge rule (decided S477, Oct 26): a verse boundary STANDS when the verse ends with . ! ? : or ; (closing quotes,
brackets and parentheses may follow). It also stands when the verse ends in a closing quote whose question mark the
OCR dropped and the next verse begins with a capital. Everything else is a line end, not a verse end: the next
verse is joined with a space, or directly when the line ended in a hyphenated word (ap-/peared -> appeared).
Vita Adae 49:2/49:3 (chapter 92) keeps its boundary although the OCR dropped the period after "the command of Elohim (God)".
Two sentences ran across a chapter boundary; those are moved to the chapter whose standard division carries them:
  Vita Adae 45/46 (chapters 88/89): "(Then) was the sun darkened and the moon" moves to 89:1.
  4 Maccabees 13/14: "brethren, who were on the rack, being tortured to death;" moves to the end of 13:27.
No word of the text is changed — only joins, the eight de-hyphenations, and the two chapter moves.
"""
import json, re, sys, shutil, copy
from pathlib import Path

HERE = Path(__file__).resolve().parent
PARSED = HERE.parent.parent / "parsed" / "pseudepigrapha-charles-vol2.json"
BOOKS = ("adam-eve", "4-maccabees")
CL = "'\"’”)\\]"
TERM = re.compile(r"[.!?:;][" + CL + "]*$")
QUOTE_END = re.compile(r"[A-Za-z][’'\"”]$")

CROSS = {  # (book, chapter): text to cut from the END of this chapter and prepend to the next chapter's first verse
    ("adam-eve", 88): "(Then) was the sun darkened and the moon",
    # (book, chapter): text to cut from the START of this chapter and append to the previous chapter's last verse
}
CROSS_HEAD = {("4-maccabees", 14): "brethren, who were on the rack, being tortured to death;"}
KEEP = {("adam-eve", 92, 2)}  # Vita Adae 49:2 -> 49:3: the OCR dropped the period after "the command of Elohim (God)"; the boundary stands

def boundary_stands(t, nxt):
    t = t.rstrip()
    if TERM.search(t): return True
    if QUOTE_END.search(t) and nxt[:1].isupper(): return True
    return False

def join(a, b):
    a = a.rstrip(); b = b.lstrip()
    if a.endswith("-") and not a.endswith(" -"): return a[:-1] + b
    return a + " " + b

def merge_book(book):
    out_chapters = []; old2new = {}; n_old = 0; n_joins = 0; n_dehyph = 0
    chs = copy.deepcopy(book["chapters"])
    for ci, ch in enumerate(chs):
        verses = [dict(v) for v in ch["verses"]]
        n_old += len(verses)
        key = (book["book_id"], ch["number"])
        # cross-chapter moves
        if key in CROSS:
            cut = CROSS[key]; last = verses[-1]["text"].rstrip()
            assert last.endswith(cut), (key, last[-80:])
            verses[-1]["text"] = last[: -len(cut)].rstrip()
            nxt = chs[ci + 1]["verses"][0]
            nxt["text"] = cut + " " + nxt["text"].lstrip()
        if key in CROSS_HEAD:
            cut = CROSS_HEAD[key]; first = verses[0]["text"].lstrip()
            assert first.startswith(cut), (key, first[:80])
            verses[0]["text"] = first[len(cut):].lstrip()
            prev_last = out_chapters[-1]["verses"][-1]
            prev_last["text"] = prev_last["text"].rstrip() + " " + cut
            prev_last["parts"].append(("moved-from", ch["number"], ch["verses"][0]["number"]))
        new = []
        cur = None
        for i, v in enumerate(verses):
            if cur is None:
                cur = {"text": v["text"].strip(), "parts": [v["number"]], "head_old_vn": v["number"]}
            else:
                if cur["text"].rstrip().endswith("-"): n_dehyph += 1
                cur["text"] = join(cur["text"], v["text"]); cur["parts"].append(v["number"]); n_joins += 1
            nxt = verses[i + 1]["text"] if i + 1 < len(verses) else None
            if nxt is None or boundary_stands(cur["text"], nxt) or (book["book_id"], ch["number"], v["number"]) in KEEP:
                new.append(cur); cur = None
        for k, nv in enumerate(new, 1):
            nv["number"] = k
            for p in nv["parts"]:
                if isinstance(p, int): old2new[f"{ch['number']}:{p}"] = f"{ch['number']}:{k}"
        out_chapters.append({"number": ch["number"], "title": ch["title"], "verses": new, "commentary": ch.get("commentary", "")})
    return out_chapters, old2new, n_old, n_joins, n_dehyph

def main():
    data = json.load(open(PARSED))
    bak = PARSED.with_suffix(".json.pre-s477")
    if not bak.exists(): shutil.copy(PARSED, bak)
    base = json.load(open(bak))  # always merge from the pre-S477 text so the script is idempotent
    mapping = {}; report = ["# S477 text lane — merge report\n"]
    for b in base["books"]:
        if b["book_id"] not in BOOKS: continue
        chapters, old2new, n_old, n_joins, n_dehyph = merge_book(b)
        n_new = sum(len(c["verses"]) for c in chapters)
        still_broken = sum(1 for c in chapters for i, v in enumerate(c["verses"][:-1]) if not boundary_stands(v["text"], c["verses"][i+1]["text"]))
        lower_starts = [(c["number"], v["number"]) for c in chapters for v in c["verses"] if v["text"][:1].islower()]
        # words check: every old word survives in order
        old_words = [w for c in b["chapters"] for v in c["verses"] for w in v["text"].split()]
        new_words = [w for c in chapters for v in c["verses"] for w in v["text"].split()]
        # de-hyphenation and the two moves change word counts; compare letters only
        old_letters = re.sub(r"[\s-]", "", " ".join(old_words)); new_letters = re.sub(r"[\s-]", "", " ".join(new_words))
        assert old_letters == new_letters, "text changed beyond joins"
        mapping[b["book_id"]] = {"old_to_new": old2new, "new_verses": [
            {"ch": c["number"], "vn": v["number"], "text": v["text"], "parts": v["parts"], "head_old_vn": v["head_old_vn"]}
            for c in chapters for v in c["verses"]]}
        report.append(f"## {b['book_title']} ({b['book_id']})\n- chapters {len(chapters)} (unchanged)\n- verses {n_old} -> {n_new}; joins {n_joins}; de-hyphenations {n_dehyph}\n- verse ends still not clause ends: {still_broken}\n- new verses starting lowercase: {len(lower_starts)} {lower_starts}\n- every letter of the old text present in the new text, in order: yes\n")
        # write into data
        tgt = [x for x in data["books"] if x["book_id"] == b["book_id"]][0]
        tgt["chapters"] = [{"number": c["number"], "title": c["title"], "verses": [{"number": v["number"], "text": v["text"]} for v in c["verses"]], "commentary": c["commentary"]} for c in chapters]
    json.dump(data, open(PARSED, "w"), ensure_ascii=False, indent=1)
    json.dump(mapping, open(HERE / "s477_map.json", "w"), ensure_ascii=False, indent=1)
    open(HERE / "s477_report.md", "w").write("\n".join(report))
    print("\n".join(report))

if __name__ == "__main__":
    main()
