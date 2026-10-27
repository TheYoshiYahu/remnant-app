// S477b — Enoch is read the English way (EE-nok) from now on (tts/names_ipa.py changed Oct 26). Every recorded chapter whose text
// says "Enoch" is re-recorded, for every voice that has it. Same pattern as _s454_apocrypha_audio_redo.mjs:
// moves audio/<voice>/<edition>/<book>/<n>.{mp3,json} -> audio/_redo/<voice>/enoch-name-s477b/<edition>/<book>/ and drops those
// lines from audio/.uploaded.txt (backup .pre-s477b) so the new files overwrite the old ones in R2. record_bible.sh then re-records
// them because they are missing. Run ONLY when no recording job is running:   node ~/Desktop/App/_s477b_enoch_audio_redo.mjs
// Then:  bash ~/Desktop/App/tts/record_bible.sh af_heart af_sky   (and am_michael when its turn comes)   then  node ~/Desktop/App/_s444_upload_audio.mjs
import fs from "node:fs"; import path from "node:path"; import { execSync } from "node:child_process";
const HERE = path.dirname(new URL(import.meta.url).pathname);
let running = ""; try { running = execSync("pgrep -fl gen_bible.py || true").toString().trim(); } catch {}
if (running) { console.error("A recording job is still running:\n" + running + "\nLet it finish (or stop it yourself), then run this again."); process.exit(1); }
const all = JSON.parse(fs.readFileSync(path.join(HERE, "tts/chapters_all.json"), "utf8"));
const targets = all.filter((c) => c.verses.some((v) => /\bEnoch\b/.test(v.text))).map((c) => [c.book, c.chapter]);
const UP = path.join(HERE, "audio/.uploaded.txt"); let uploaded = fs.existsSync(UP) ? fs.readFileSync(UP, "utf8").split("\n") : []; const upBefore = uploaded.length;
let moved = 0; const perVoice = {};
for (const voice of fs.readdirSync(path.join(HERE, "audio")).filter((v) => /^[a-z]{2}_[a-z]+$/.test(v))) {
  for (const [book, n] of targets) {
    const src = path.join(HERE, "audio", voice, book); const dst = path.join(HERE, "audio/_redo", voice, "enoch-name-s477b", book);
    for (const ext of ["mp3", "json"]) {
      const f = path.join(src, `${n}.${ext}`);
      if (fs.existsSync(f)) { fs.mkdirSync(dst, { recursive: true }); fs.renameSync(f, path.join(dst, `${n}.${ext}`)); moved++; perVoice[voice] = (perVoice[voice] || 0) + (ext === "mp3" ? 1 : 0); }
    }
    uploaded = uploaded.filter((l) => !l.startsWith(`${voice}/${book}/${n}.`));
  }
}
if (!fs.existsSync(UP + ".pre-s477b")) fs.copyFileSync(UP, UP + ".pre-s477b");
fs.writeFileSync(UP, uploaded.join("\n"));
console.log(`${targets.length} chapters say Enoch. Moved ${moved} files to audio/_redo/<voice>/enoch-name-s477b/ — chapters per voice:`, perVoice, `; dropped ${upBefore - uploaded.length} lines from audio/.uploaded.txt.`);
console.log("Now:  bash ~/Desktop/App/tts/record_bible.sh af_heart af_sky   then  node ~/Desktop/App/_s444_upload_audio.mjs");
