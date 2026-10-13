// S444 — downloads the live Bible text (exactly what the app shows) so the
// natural-voice recordings read the same words. Run on the Mac:
//   node ~/Desktop/App/_s444_fetch_live_text.mjs
// Writes ~/Desktop/App/audio-text/canon_live.json
import fs from "node:fs";
import path from "node:path";
const B = "https://api.bible.remnantofpromise.org/v1";
const out = path.join(path.dirname(new URL(import.meta.url).pathname), "audio-text");
fs.mkdirSync(out, { recursive: true });
const books = (await (await fetch(`${B}/books`)).json()).filter((b) => b.edition_slug === "canon");
const chapters = [];
for (const b of books) {
  const cs = await (await fetch(`${B}/books/${b.slug}/chapters`)).json();
  const list = cs.chapters || cs;
  for (const c of list) {
    const n = c.chapter_number ?? c.number;
    const d = await (await fetch(`${B}/books/${b.slug}/chapters/${n}`)).json();
    chapters.push({ book: b.slug, title: b.title, chapter: n, verses: d.verses.map((v) => ({ n: v.verse_number, raw: v.text })) });
  }
  process.stdout.write(`${b.title} `);
}
fs.writeFileSync(path.join(out, "canon_live.json"), JSON.stringify(chapters));
console.log(`\nDone: ${chapters.length} chapters saved to ${out}/canon_live.json`);
