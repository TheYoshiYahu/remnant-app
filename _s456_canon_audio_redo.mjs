// S456 — prepares the canon re-record for Michael after the S455b canon fix. QUEUED, not run (voices lane, LAST).
// 15 chapters: Psalm 119 (21 stanza letters stripped from vv.8,16,...,168) + the 14 epistle-ending chapters whose last
// verse carried a 1611 subscription (Rom 16, 1 Cor 16, 2 Cor 13, Gal 6, Eph 6, Php 4, Col 4, 1 Th 5, 2 Th 3, 1 Tim 6,
// 2 Tim 4, Tit 3, Phm 1, Heb 13). Romans 15:30 changed only inside a parenthetical, which the speech strip removes — no redo.
// The canon entries in tts/chapters_all.json are the MODERNIZED register (the live text), so this script edits them
// surgically with the same two rules the migration used — it does NOT copy text from parsed/canon.json (KJV register).
// Run ONLY when no recording job is running, and only when the voices lane is reached:
//   node ~/Desktop/App/_s456_canon_audio_redo.mjs
// 1. Edits those 15 chapters in tts/chapters_all.json in place (backup .pre-s456).
// 2. Moves audio/am_michael/<book>/<n>.{mp3,json} -> audio/_redo/am_michael/canon-s456/<book>/
// 3. Drops those lines from audio/.uploaded.txt so the new files overwrite the old ones in R2 (backup .pre-s456).
// Then:  bash ~/Desktop/App/tts/record_bible.sh am_michael
//        node ~/Desktop/App/_s444_upload_audio.mjs
import fs from "node:fs";
import path from "node:path";
import { execSync } from "node:child_process";
const HERE = path.dirname(new URL(import.meta.url).pathname);
let running = "";
try { running = execSync("pgrep -fl gen_bible.py || true").toString().trim(); } catch {}
if (running) { console.error("A recording job is still running:\n" + running + "\nLet it finish (or stop it yourself), then run this again."); process.exit(1); }

const SUBS = { romans: 16, "1-corinthians": 16, "2-corinthians": 13, galatians: 6, ephesians: 6, philippians: 4, colossians: 4,
  "1-thessalonians": 5, "2-thessalonians": 3, "1-timothy": 6, "2-timothy": 4, titus: 3, philemon: 1, hebrews: 13 };
const ALL = path.join(HERE, "tts", "chapters_all.json");
const all = JSON.parse(fs.readFileSync(ALL, "utf8"));
const TAIL = /\s*[א-ת]\s+[A-Z]+\.$/;
const files = []; let edited = 0;
const fix = (v, f) => { const raw = f(v.raw), text = f(v.text); if (raw === v.raw && text === v.text) return false; v.raw = raw; v.text = text; return true; };

// Psalm 119
const ps = all.find((x) => x.book === "psalms" && x.chapter === 119);
if (!ps) { console.error("psalms 119 not in chapters_all.json — stopping, nothing written"); process.exit(1); }
let stripped = 0;
for (const v of ps.verses) {
  if (v.n % 8 === 0 && v.n < 176) { if (!TAIL.test(v.raw)) { console.error(`Psalm 119:${v.n} has no stanza letter — stopping, nothing written: ${v.raw.slice(-40)}`); process.exit(1); } fix(v, (s) => s.replace(TAIL, "").trimEnd()); stripped++; }
  else if (TAIL.test(v.raw)) { console.error(`Psalm 119:${v.n} unexpectedly ends with a letter — stopping`); process.exit(1); }
}
if (stripped !== 21) { console.error(`stripped ${stripped}, expected 21 — stopping`); process.exit(1); }
edited++; files.push(["psalms", 119]);

// the 14 subscriptions: keep up to and including the one "Amen."
for (const [slug, n] of Object.entries(SUBS)) {
  const c = all.find((x) => x.book === slug && x.chapter === n);
  if (!c) { console.error(`${slug} ${n} not in chapters_all.json — stopping, nothing written`); process.exit(1); }
  const v = c.verses[c.verses.length - 1];
  const cut = (s) => { const p = s.indexOf("Amen."); if (p < 0) throw new Error(`${slug} ${n}:${v.n} has no "Amen."`); return s.slice(0, p + 5); };
  if (!/Amen\.\s+\S/.test(v.raw)) { console.error(`${slug} ${n}:${v.n} carries nothing after "Amen." — already clean? stopping, nothing written: ${v.raw.slice(-60)}`); process.exit(1); }
  fix(v, cut); edited++; files.push([slug, n]);
}
if (!fs.existsSync(ALL + ".pre-s456")) fs.copyFileSync(ALL, ALL + ".pre-s456");
fs.writeFileSync(ALL, JSON.stringify(all));
console.log(`chapters_all.json: edited ${edited} canon chapters in place (Psalm 119: 21 letters stripped; 14 subscriptions cut). Set still has ${all.length} chapters.`);

let moved = 0;
for (const [slug, n] of files) {
  const src = path.join(HERE, "audio/am_michael", slug);
  const dst = path.join(HERE, "audio/_redo/am_michael/canon-s456", slug);
  fs.mkdirSync(dst, { recursive: true });
  for (const ext of ["mp3", "json"]) {
    const f = path.join(src, `${n}.${ext}`);
    if (fs.existsSync(f)) { fs.renameSync(f, path.join(dst, `${n}.${ext}`)); moved++; }
  }
}
console.log(`moved ${moved} old files -> audio/_redo/am_michael/canon-s456/`);

const UP = path.join(HERE, "audio/.uploaded.txt");
if (fs.existsSync(UP)) {
  const lines = fs.readFileSync(UP, "utf8").split("\n");
  const drop = new Set(files.flatMap(([slug, n]) => [`am_michael/${slug}/${n}.mp3`, `am_michael/${slug}/${n}.json`]));
  const keep = lines.filter((l) => !drop.has(l.split("|")[0]));
  if (!fs.existsSync(UP + ".pre-s456")) fs.copyFileSync(UP, UP + ".pre-s456");
  fs.writeFileSync(UP, keep.join("\n"));
  console.log(`.uploaded.txt: dropped ${lines.length - keep.length} old canon lines`);
}
console.log("\nNow record, then upload:\n  bash ~/Desktop/App/tts/record_bible.sh am_michael\n  node ~/Desktop/App/_s444_upload_audio.mjs");
