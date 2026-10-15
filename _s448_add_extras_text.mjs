// S448 — adds every edition except Josephus to the natural-voice recording set
// (tts/chapters_all.json), downloading the live text exactly as the app shows
// it, the way S444 did for the canon. Safe to run again: it only adds books not
// already in the set. Run on the Mac:
//   node ~/Desktop/App/_s448_add_extras_text.mjs
// Then (re)start the recorder; it skips chapters already recorded.
import fs from "node:fs";
import path from "node:path";
const B = "https://api.bible.remnantofpromise.org/v1";
const HERE = path.dirname(new URL(import.meta.url).pathname);
const ALL = path.join(HERE, "tts", "chapters_all.json");
const SKIP_EDITIONS = new Set(["josephus"]);

// Same parenthetical strip the app uses for speech (app/src/lib/stripParentheticals.ts).
const ts = fs.readFileSync(path.join(HERE, "app/src/lib/stripParentheticals.ts"), "utf8");
const list = [...ts.matchAll(/^\s+"(\([^"]+\))",$/gm)].map((m) => m[1]).sort((a, b) => b.length - a.length);
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const STRIP = new RegExp(`\\s?(?:${list.map(esc).join("|")})`, "g");
const speak = (s) => s.replace(STRIP, "");

const all = JSON.parse(fs.readFileSync(ALL, "utf8"));
const have = new Set(all.map((c) => c.book));
const books = (await (await fetch(`${B}/books`)).json())
  .filter((b) => b.edition_slug !== "canon" && !SKIP_EDITIONS.has(b.edition_slug));
let added = 0, addedBooks = [];
for (const b of books) {
  const key = `${b.edition_slug}/${b.slug}`;
  if (have.has(key)) continue;
  const cs = await (await fetch(`${B}/books/${b.slug}/chapters`)).json();
  const list = cs.chapters || cs;
  const title = (b.title || b.slug).replace(/\s*\([^)]*\)\s*$/, "").trim();
  let n = 0;
  for (const c of list) {
    const num = c.chapter_number ?? c.number;
    const d = await (await fetch(`${B}/books/${b.slug}/chapters/${num}`)).json();
    const verses = (d.verses || []).filter((v) => v.text && v.text.trim());
    if (!verses.length || num === 0) continue; // introductions carry no scripture text
    all.push({ book: key, title, chapter: num, verses: verses.map((v) => ({ n: v.verse_number, raw: v.text, text: speak(v.text) })) });
    n++; added++;
  }
  addedBooks.push(`${key} (${n})`);
  process.stdout.write(`${title} `);
}
if (added) {
  fs.copyFileSync(ALL, ALL + ".pre-s448");
  fs.writeFileSync(ALL, JSON.stringify(all));
}
console.log(`\nAdded ${added} chapters in ${addedBooks.length} books. Set now has ${all.length} chapters.`);
if (addedBooks.length) console.log(addedBooks.join("\n"));
