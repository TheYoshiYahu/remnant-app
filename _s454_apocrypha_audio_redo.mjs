// S454 — prepares the Apocrypha re-record for Michael after the S454 audit fix.
// Only the 5 chapters whose text changed are redone: the-rest-of-esther 10, 11, 13; 2-esdras 14; 1-maccabees 5.
// Run ONLY when no recording job is running, and only when the voices lane is reached:
//   node ~/Desktop/App/_s454_apocrypha_audio_redo.mjs
// 1. Replaces those 5 apocrypha/* chapters in tts/chapters_all.json with the fixed text
//    from source-texts/parsed/apocrypha.json (same parenthetical strip the app uses). Backup: .pre-s454
// 2. Moves audio/am_michael/apocrypha/<book>/<n>.{mp3,json} -> audio/_redo/am_michael/apocrypha-s454/<book>/
// 3. Drops those lines from audio/.uploaded.txt so the new files overwrite the old ones in R2. Backup: .pre-s454
// Then:  bash ~/Desktop/App/tts/record_bible.sh am_michael
//        node ~/Desktop/App/_s444_upload_audio.mjs
import fs from "node:fs";
import path from "node:path";
import { execSync } from "node:child_process";
const HERE = path.dirname(new URL(import.meta.url).pathname);
let running = "";
try { running = execSync("pgrep -fl gen_bible.py || true").toString().trim(); } catch {}
if (running) { console.error("A recording job is still running:\n" + running + "\nLet it finish (or stop it yourself), then run this again."); process.exit(1); }

const REDO = { "the-rest-of-esther": [10, 11, 13], "2-esdras": [14], "1-maccabees": [5] };
const ALL = path.join(HERE, "tts", "chapters_all.json");
const ts = fs.readFileSync(path.join(HERE, "app/src/lib/stripParentheticals.ts"), "utf8");
const list = [...ts.matchAll(/^\s+"(\([^"]+\))",$/gm)].map((m) => m[1]).sort((a, b) => b.length - a.length);
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const STRIP = new RegExp(`\\s?(?:${list.map(esc).join("|")})`, "g");
const speak = (s) => s.replace(STRIP, "");

const all = JSON.parse(fs.readFileSync(ALL, "utf8"));
const d = JSON.parse(fs.readFileSync(path.join(HERE, "source-texts/parsed/apocrypha.json"), "utf8"));
const total = d.books.reduce((n, b) => n + b.chapters.reduce((m, c) => m + c.verses.length, 0), 0);
if (total !== 5720) { console.error(`parsed/apocrypha.json has ${total} verses — expected 5720. Run _session454_apocrypha_deploy.sh first.`); process.exit(1); }
let swapped = 0, vBefore = 0, vAfter = 0; const files = [];
for (const [slug, nums] of Object.entries(REDO)) {
  const b = d.books.find((x) => x.book_id === slug);
  const key = `apocrypha/${slug}`;
  const title = String(b.book_title || b.book_id).replace(/\s*\([^)]*\)\s*$/, "").trim();
  for (const n of nums) {
    const c = b.chapters.find((x) => x.number === n);
    const verses = (c.verses || []).filter((v) => v.text && v.text.trim());
    const fresh = { book: key, title, chapter: n, verses: verses.map((v) => ({ n: v.number, raw: v.text, text: speak(v.text) })) };
    const at = all.findIndex((x) => x.book === key && x.chapter === n);
    if (at < 0) { console.error(`${key} ${n} not in chapters_all.json — stopping, nothing written`); process.exit(1); }
    vBefore += all[at].verses.length; vAfter += fresh.verses.length;
    all[at] = fresh; swapped++;
    files.push([slug, n]);
  }
}
if (!fs.existsSync(ALL + ".pre-s454")) fs.copyFileSync(ALL, ALL + ".pre-s454");
fs.writeFileSync(ALL, JSON.stringify(all));
console.log(`chapters_all.json: swapped ${swapped} Apocrypha chapters (${vBefore} -> ${vAfter} verses). Set still has ${all.length} chapters.`);

let moved = 0;
for (const [slug, n] of files) {
  const src = path.join(HERE, "audio/am_michael/apocrypha", slug);
  const dst = path.join(HERE, "audio/_redo/am_michael/apocrypha-s454", slug);
  fs.mkdirSync(dst, { recursive: true });
  for (const ext of ["mp3", "json"]) {
    const f = path.join(src, `${n}.${ext}`);
    if (fs.existsSync(f)) { fs.renameSync(f, path.join(dst, `${n}.${ext}`)); moved++; }
  }
}
console.log(`moved ${moved} old files -> audio/_redo/am_michael/apocrypha-s454/`);

const UP = path.join(HERE, "audio/.uploaded.txt");
if (fs.existsSync(UP)) {
  const lines = fs.readFileSync(UP, "utf8").split("\n");
  const drop = new Set(files.flatMap(([slug, n]) => [`am_michael/apocrypha/${slug}/${n}.mp3`, `am_michael/apocrypha/${slug}/${n}.json`]));
  const keep = lines.filter((l) => !drop.has(l.split("|")[0]));
  if (!fs.existsSync(UP + ".pre-s454")) fs.copyFileSync(UP, UP + ".pre-s454");
  fs.writeFileSync(UP, keep.join("\n"));
  console.log(`.uploaded.txt: dropped ${lines.length - keep.length} old Apocrypha lines`);
}
console.log("\nNow record, then upload:\n  bash ~/Desktop/App/tts/record_bible.sh am_michael\n  node ~/Desktop/App/_s444_upload_audio.mjs");
