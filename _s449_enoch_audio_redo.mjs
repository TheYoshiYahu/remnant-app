// S449 — prepares the 1 Enoch re-record for Michael after the text rebuild.
// Run ONLY when no recording job is running (it checks):
//   node ~/Desktop/App/_s449_enoch_audio_redo.mjs
// 1. Replaces the 108 enoch/1-enoch chapters in tts/chapters_all.json with the
//    rebuilt text from source-texts/parsed/enoch.json (same parenthetical strip
//    the app uses for speech). Backup: tts/chapters_all.json.pre-s449
// 2. Moves audio/am_michael/enoch/1-enoch -> audio/_redo/am_michael/1-enoch-s449
//    (the old recordings, built on the corrupt text)
// 3. Drops the old am_michael/enoch/1-enoch lines from audio/.uploaded.txt so the
//    new files are re-sent and overwrite the old ones in R2. Backup: .uploaded.txt.pre-s449
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
const d = JSON.parse(fs.readFileSync(path.join(HERE, "source-texts/parsed/enoch.json"), "utf8"));
const b = d.books[0];
const key = `enoch/${String(b.book_id).trim().toLowerCase()}`;
const before = all.filter((c) => c.book === key);
const kept = all.filter((c) => c.book !== key);
const title = String(b.book_title || b.book_id).replace(/\s*\([^)]*\)\s*$/, "").trim();
const fresh = [];
for (const c of b.chapters) {
  const verses = (c.verses || []).filter((v) => v.text && v.text.trim());
  if (!verses.length || c.number === 0) continue;
  fresh.push({ book: key, title, chapter: c.number, verses: verses.map((v) => ({ n: v.number, raw: v.text, text: speak(v.text) })) });
}
// keep the original position of the Enoch block in the set
const at = all.findIndex((c) => c.book === key);
const out = at < 0 ? kept.concat(fresh) : kept.slice(0, at).concat(fresh, kept.slice(at));
if (!fs.existsSync(ALL + ".pre-s449")) fs.copyFileSync(ALL, ALL + ".pre-s449");
fs.writeFileSync(ALL, JSON.stringify(out));
const nv = (a) => a.reduce((s, c) => s + c.verses.length, 0);
console.log(`chapters_all.json: ${key} ${before.length} chapters / ${nv(before)} verses  ->  ${fresh.length} chapters / ${nv(fresh)} verses. Set has ${out.length} chapters.`);

const src = path.join(HERE, "audio/am_michael/enoch/1-enoch");
const dst = path.join(HERE, "audio/_redo/am_michael/1-enoch-s449");
if (fs.existsSync(src)) {
  fs.mkdirSync(path.dirname(dst), { recursive: true });
  fs.renameSync(src, dst);
  console.log(`moved ${fs.readdirSync(dst).length} old files -> audio/_redo/am_michael/1-enoch-s449`);
} else console.log("audio/am_michael/enoch/1-enoch already absent (nothing moved)");

const UP = path.join(HERE, "audio/.uploaded.txt");
if (fs.existsSync(UP)) {
  const lines = fs.readFileSync(UP, "utf8").split("\n");
  const keep = lines.filter((l) => !l.startsWith("am_michael/enoch/1-enoch/"));
  if (!fs.existsSync(UP + ".pre-s449")) fs.copyFileSync(UP, UP + ".pre-s449");
  fs.writeFileSync(UP, keep.join("\n"));
  console.log(`.uploaded.txt: dropped ${lines.length - keep.length} old Enoch lines`);
}
console.log("\nNow record, then upload:\n  bash ~/Desktop/App/tts/record_bible.sh am_michael\n  node ~/Desktop/App/_s444_upload_audio.mjs");
