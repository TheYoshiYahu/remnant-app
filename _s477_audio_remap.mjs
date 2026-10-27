// S477 — after the text-lane deploy: remap the verse-timing .json files of the EXISTING recordings of Charles's Books of Adam and Eve
// (pseudepigrapha/adam-eve) and 4 Maccabees (pseudepigrapha/4-maccabees) to the merged verse numbering, so the audio keeps working
// (verse highlighting lands on the right verse) until the books are re-recorded on the voices lane (_s477_audio_redo.mjs).
// Each merged verse starts where its first old line started. The old timings are kept in audio/_redo/s477-timings.pre-s477.json.
// The remapped .json files are dropped from audio/.uploaded.txt so the next upload (node _s444_upload_audio.mjs) overwrites them in R2.
// Run:  node ~/Desktop/App/_s477_audio_remap.mjs     (safe to re-run: a file already remapped is skipped)
import fs from "node:fs"; import path from "node:path";
const HERE = path.dirname(new URL(import.meta.url).pathname);
const M = JSON.parse(fs.readFileSync(path.join(HERE, "source-texts/pseudepigrapha-charles-vol2/s477-text-lane/s477_map.json"), "utf8"));
const UP = path.join(HERE, "audio/.uploaded.txt"); let uploaded = fs.existsSync(UP) ? fs.readFileSync(UP, "utf8").split("\n") : [];
const bak = path.join(HERE, "audio/_redo/s477-timings.pre-s477.json"); const keep = fs.existsSync(bak) ? JSON.parse(fs.readFileSync(bak, "utf8")) : {};
let done = 0, skipped = 0, dropped = 0;
for (const voice of fs.readdirSync(path.join(HERE, "audio")).filter((v) => /^[a-z]{2}_[a-z]+$/.test(v))) {
  for (const book of ["adam-eve", "4-maccabees"]) {
    const dir = path.join(HERE, "audio", voice, "pseudepigrapha", book);
    if (!fs.existsSync(dir)) continue;
    for (const f of fs.readdirSync(dir).filter((f) => f.endsWith(".json"))) {
      const p = path.join(dir, f); const j = JSON.parse(fs.readFileSync(p, "utf8"));
      if (j.s477 === "remapped") { skipped++; continue; }
      const ch = Number(f.replace(".json", "")); const want = M[book].new_verses.filter((v) => v.ch === ch);
      const oldStart = new Map(j.verses.map(([n, t]) => [n, t]));
      const verses = want.map((v) => [v.vn, oldStart.get(v.head_old_vn) ?? oldStart.get(Math.min(...v.parts.filter(Number.isInteger))) ?? 0]);
      keep[`${voice}/pseudepigrapha/${book}/${ch}`] = j.verses;
      fs.writeFileSync(p, JSON.stringify({ ...j, verses, s477: "remapped" }));
      const key = `${voice}/pseudepigrapha/${book}/${ch}.json`; const before = uploaded.length;
      uploaded = uploaded.filter((l) => !l.startsWith(key + "|")); dropped += before - uploaded.length; done++;
    }
  }
}
fs.mkdirSync(path.dirname(bak), { recursive: true }); fs.writeFileSync(bak, JSON.stringify(keep));
fs.writeFileSync(UP, uploaded.join("\n"));
console.log(`timing files remapped: ${done} (already remapped: ${skipped}); dropped ${dropped} lines from audio/.uploaded.txt so they re-upload. Old timings kept in ${path.relative(HERE, bak)}.`);
console.log("Next: node ~/Desktop/App/_s444_upload_audio.mjs   (uploads the remapped .json files)");
