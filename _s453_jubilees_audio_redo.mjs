// S453 — prepares the Jubilees re-record for Michael after the S453 split-verse fix.
// Every one of the 50 chapters changed (each had verses run together), so all 50 are redone.
// Run ONLY when no recording job is running, and only when the voices lane is reached:
//   node ~/Desktop/App/_s453_jubilees_audio_redo.mjs
// 1. Replaces the 50 jubilees/jubilees chapters in tts/chapters_all.json with the fixed text
//    from source-texts/parsed/jubilees.json (same parenthetical strip the app uses). Backup: .pre-s453
// 2. Moves audio/am_michael/jubilees/jubilees/<n>.{mp3,json} -> audio/_redo/am_michael/jubilees-s453/
// 3. Drops those lines from audio/.uploaded.txt so the new files overwrite the old ones in R2. Backup: .pre-s453
// Then:  bash ~/Desktop/App/tts/record_bible.sh am_michael
//        node ~/Desktop/App/_s444_upload_audio.mjs
import fs from "node:fs";
import path from "node:path";
import { execSync } from "node:child_process";
const HERE = path.dirname(new URL(import.meta.url).pathname);
let running = "";
try { running = execSync("pgrep -fl gen_bible.py || true").toString().trim(); } catch {}
if (running) { console.error("A recording job is still running:\n" + running + "\nLet it finish (or stop it yourself), then run this again."); process.exit(1); }

const ALL = path.join(HERE, "tts", "chapters_all.json");
const ts = fs.readFileSync(path.join(HERE, "app/src/lib/stripParentheticals.ts"), "utf8");
const list = [...ts.matchAll(/^\s+"(\([^"]+\))",$/gm)].map((m) => m[1]).sort((a, b) => b.length - a.length);
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const STRIP = new RegExp(`\\s?(?:${list.map(esc).join("|")})`, "g");
const speak = (s) => s.replace(STRIP, "");

const all = JSON.parse(fs.readFileSync(ALL, "utf8"));
const d = JSON.parse(fs.readFileSync(path.join(HERE, "source-texts/parsed/jubilees.json"), "utf8"));
const b = d.books[0];
const key = "jubilees/jubilees";
const title = String(b.book_title || b.book_id).replace(/\s*\([^)]*\)\s*$/, "").trim();
const total = b.chapters.reduce((n, c) => n + c.verses.length, 0);
if (b.chapters.length !== 50 || total !== 1307) { console.error(`parsed/jubilees.json is ${b.chapters.length} chapters / ${total} verses — expected 50 / 1307. Run _session453_jubilees_deploy.sh first.`); process.exit(1); }
const chapters = b.chapters.map((c) => c.number);
let swapped = 0, vBefore = 0, vAfter = 0;
for (const c of b.chapters) {
  const verses = (c.verses || []).filter((v) => v.text && v.text.trim());
  const fresh = { book: key, title, chapter: c.number, verses: verses.map((v) => ({ n: v.number, raw: v.text, text: speak(v.text) })) };
  const at = all.findIndex((x) => x.book === key && x.chapter === c.number);
  if (at < 0) { console.error(`chapter ${c.number} not in chapters_all.json — stopping, nothing written`); process.exit(1); }
  vBefore += all[at].verses.length; vAfter += fresh.verses.length;
  all[at] = fresh; swapped++;
}
if (!fs.existsSync(ALL + ".pre-s453")) fs.copyFileSync(ALL, ALL + ".pre-s453");
fs.writeFileSync(ALL, JSON.stringify(all));
console.log(`chapters_all.json: swapped ${swapped} Jubilees chapters (${vBefore} -> ${vAfter} verses). Set still has ${all.length} chapters.`);

const src = path.join(HERE, "audio/am_michael/jubilees/jubilees");
const dst = path.join(HERE, "audio/_redo/am_michael/jubilees-s453");
fs.mkdirSync(dst, { recursive: true });
let moved = 0;
for (const n of chapters) for (const ext of ["mp3", "json"]) {
  const f = path.join(src, `${n}.${ext}`);
  if (fs.existsSync(f)) { fs.renameSync(f, path.join(dst, `${n}.${ext}`)); moved++; }
}
console.log(`moved ${moved} old files -> audio/_redo/am_michael/jubilees-s453`);

const UP = path.join(HERE, "audio/.uploaded.txt");
if (fs.existsSync(UP)) {
  const lines = fs.readFileSync(UP, "utf8").split("\n");
  const drop = new Set(chapters.flatMap((n) => [`am_michael/jubilees/jubilees/${n}.mp3`, `am_michael/jubilees/jubilees/${n}.json`]));
  const keep = lines.filter((l) => !drop.has(l.split("|")[0]));
  if (!fs.existsSync(UP + ".pre-s453")) fs.copyFileSync(UP, UP + ".pre-s453");
  fs.writeFileSync(UP, keep.join("\n"));
  console.log(`.uploaded.txt: dropped ${lines.length - keep.length} old Jubilees lines`);
}
console.log("\nNow record, then upload:\n  bash ~/Desktop/App/tts/record_bible.sh am_michael\n  node ~/Desktop/App/_s444_upload_audio.mjs");
