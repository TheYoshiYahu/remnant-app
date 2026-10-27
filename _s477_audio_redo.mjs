// S477 — VOICES LANE (run LAST, after every text change): prepares the full re-record of Charles's Books of Adam and Eve (pseudepigrapha/adam-eve,
// 94 chapters) and 4 Maccabees (pseudepigrapha/4-maccabees, 18 chapters) for every voice that has them. The old recordings were synthesized
// line by line (Track B's verse = print line), so they pause mid-clause; the merged text reads as whole clauses.
// Same pattern as _s454_apocrypha_audio_redo.mjs:
// 1. Replaces both books' chapters in tts/chapters_all.json with the merged text from source-texts/parsed/pseudepigrapha-charles-vol2.json
//    (same parenthetical strip the app uses). Backup: tts/chapters_all.json.pre-s477
// 2. Moves audio/<voice>/pseudepigrapha/<book>/<n>.{mp3,json} -> audio/_redo/<voice>/pseudepigrapha-s477/<book>/
// 3. Drops those lines from audio/.uploaded.txt so the new files overwrite the old ones in R2. Backup: audio/.uploaded.txt.pre-s477
// Then:  bash ~/Desktop/App/tts/record_bible.sh am_michael   (and af_heart)
//        node ~/Desktop/App/_s444_upload_audio.mjs
// Run ONLY when no recording job is running:   node ~/Desktop/App/_s477_audio_redo.mjs
import fs from "node:fs"; import path from "node:path"; import { execSync } from "node:child_process";
const HERE = path.dirname(new URL(import.meta.url).pathname);
let running = ""; try { running = execSync("pgrep -fl gen_bible.py || true").toString().trim(); } catch {}
if (running) { console.error("A recording job is still running:\n" + running + "\nLet it finish (or stop it yourself), then run this again."); process.exit(1); }
const ALL = path.join(HERE, "tts", "chapters_all.json");
const ts = fs.readFileSync(path.join(HERE, "app/src/lib/stripParentheticals.ts"), "utf8");
const list = [...ts.matchAll(/^\s+"(\([^"]+\))",$/gm)].map((m) => m[1]).sort((a, b) => b.length - a.length);
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const STRIP = new RegExp(`\\s?(?:${list.map(esc).join("|")})`, "g"); const speak = (s) => s.replace(STRIP, "");
const all = JSON.parse(fs.readFileSync(ALL, "utf8"));
const d = JSON.parse(fs.readFileSync(path.join(HERE, "source-texts/parsed/pseudepigrapha-charles-vol2.json"), "utf8"));
const EXPECT = { "adam-eve": 141, "4-maccabees": 247 };
let swapped = 0, vBefore = 0, vAfter = 0; const files = [];
for (const slug of Object.keys(EXPECT)) {
  const b = d.books.find((x) => x.book_id === slug); const n = b.chapters.reduce((m, c) => m + c.verses.length, 0);
  if (n !== EXPECT[slug]) { console.error(`parsed ${slug} has ${n} verses — expected ${EXPECT[slug]} (the merged text). Nothing written.`); process.exit(1); }
  const key = `pseudepigrapha/${slug}`; const title = String(b.book_title || b.book_id).replace(/\s*\([^)]*\)\s*$/, "").trim();
  for (const c of b.chapters) {
    const fresh = { book: key, title, chapter: c.number, verses: c.verses.filter((v) => v.text && v.text.trim()).map((v) => ({ n: v.number, raw: v.text, text: speak(v.text) })) };
    const at = all.findIndex((x) => x.book === key && x.chapter === c.number);
    if (at < 0) { console.error(`${key} ${c.number} not in chapters_all.json — stopping, nothing written`); process.exit(1); }
    vBefore += all[at].verses.length; vAfter += fresh.verses.length; all[at] = fresh; swapped++; files.push([slug, c.number]);
  }
}
if (!fs.existsSync(ALL + ".pre-s477")) fs.copyFileSync(ALL, ALL + ".pre-s477");
fs.writeFileSync(ALL, JSON.stringify(all));
console.log(`chapters_all.json: swapped ${swapped} chapters (${vBefore} -> ${vAfter} verses). Set still has ${all.length} chapters.`);
const UP = path.join(HERE, "audio/.uploaded.txt"); let uploaded = fs.existsSync(UP) ? fs.readFileSync(UP, "utf8").split("\n") : []; const upBefore = uploaded.length;
let moved = 0;
for (const voice of fs.readdirSync(path.join(HERE, "audio")).filter((v) => /^[a-z]{2}_[a-z]+$/.test(v))) {
  for (const [slug, n] of files) {
    const src = path.join(HERE, "audio", voice, "pseudepigrapha", slug); const dst = path.join(HERE, "audio/_redo", voice, "pseudepigrapha-s477", slug);
    for (const ext of ["mp3", "json"]) {
      const f = path.join(src, `${n}.${ext}`);
      if (fs.existsSync(f)) { fs.mkdirSync(dst, { recursive: true }); fs.renameSync(f, path.join(dst, `${n}.${ext}`)); moved++; }
    }
    uploaded = uploaded.filter((l) => !l.startsWith(`${voice}/pseudepigrapha/${slug}/${n}.`));
  }
}
if (!fs.existsSync(UP + ".pre-s477")) fs.copyFileSync(UP, UP + ".pre-s477");
fs.writeFileSync(UP, uploaded.join("\n"));
console.log(`moved ${moved} old recording files to audio/_redo/<voice>/pseudepigrapha-s477/; dropped ${upBefore - uploaded.length} lines from audio/.uploaded.txt.`);
console.log("Now record:  bash ~/Desktop/App/tts/record_bible.sh am_michael   then af_heart   then:  node ~/Desktop/App/_s444_upload_audio.mjs");
