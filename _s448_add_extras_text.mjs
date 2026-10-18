// S448 — adds every edition except Josephus to the natural-voice recording set
// (tts/chapters_all.json). Reads the same parsed JSON files the live database
// is seeded from (source-texts/parsed; verified verse-for-verse identical to the
// live text for Enoch, Jubilees and Jasher), so no sign-in or network is needed.
// Safe to run again: it only adds books not already in the set.
//   node ~/Desktop/App/_s448_add_extras_text.mjs
import fs from "node:fs";
import path from "node:path";
const HERE = path.dirname(new URL(import.meta.url).pathname);
const ALL = path.join(HERE, "tts", "chapters_all.json");
// edition slug (as the app and R2 paths use it) → parsed file; from api/seed.py.
const EDITIONS = {
  "apocrypha": "apocrypha.json",
  "pseudepigrapha": "pseudepigrapha-charles-vol2.json",
  "apocrypha-charles-vol1": "apocrypha-charles-vol1.json",
  "mrjames-apocryphal-nt": "mrjames-apocryphal-nt.json",
  "lightfoot-apostolic-fathers": "lightfoot-apostolic-fathers.json",
  "ascension-isaiah": "ascension-isaiah.json",
  "adam-eve-conflict": "adam-eve-conflict.json",
  "apocalypse-of-abraham": "apocalypse-of-abraham.json",
  "sonnini-acts-29": "sonnini-acts-29.json",
  // josephus: not recorded (Yoshi, S448).
};
// Same parenthetical strip the app uses for speech (app/src/lib/stripParentheticals.ts).
const ts = fs.readFileSync(path.join(HERE, "app/src/lib/stripParentheticals.ts"), "utf8");
const list = [...ts.matchAll(/^\s+"(\([^"]+\))",$/gm)].map((m) => m[1]).sort((a, b) => b.length - a.length);
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const STRIP = new RegExp(`\\s?(?:${list.map(esc).join("|")})`, "g");
const speak = (s) => s.replace(STRIP, "");

const all = JSON.parse(fs.readFileSync(ALL, "utf8"));
const have = new Set(all.map((c) => c.book));
let added = 0; const addedBooks = [];
for (const [edition, file] of Object.entries(EDITIONS)) {
  const d = JSON.parse(fs.readFileSync(path.join(HERE, "source-texts/parsed", file), "utf8"));
  for (const b of d.books) {
    const key = `${edition}/${String(b.book_id).trim().toLowerCase()}`;
    if (have.has(key)) continue;
    const title = String(b.book_title || b.book_id).replace(/\s*\([^)]*\)\s*$/, "").trim();
    let n = 0;
    for (const c of b.chapters) {
      if (c.number === 0) continue; // introductions carry commentary, not scripture
      const verses = (c.verses || []).filter((v) => v.text && v.text.trim());
      if (!verses.length) continue;
      all.push({ book: key, title, chapter: c.number, verses: verses.map((v) => ({ n: v.number, raw: v.text, text: speak(v.text) })) });
      n++; added++;
    }
    addedBooks.push(`${key} (${n})`);
  }
}
if (added) {
  if (!fs.existsSync(ALL + ".pre-s448")) fs.copyFileSync(ALL, ALL + ".pre-s448");
  fs.writeFileSync(ALL, JSON.stringify(all));
}
console.log(`Added ${added} chapters in ${addedBooks.length} books. Set now has ${all.length} chapters.`);
if (addedBooks.length) console.log(addedBooks.join("\n"));
