// S444 — uploads new recordings from ~/Desktop/App/audio to the Cloudflare
// R2 bucket "rop-audio". Safe to run any time: files already sent are skipped.
//   node ~/Desktop/App/_s444_upload_audio.mjs
// The first run opens a Cloudflare page in your browser: click "Allow".
import fs from "node:fs";
import path from "node:path";
import { execFileSync, spawn } from "node:child_process";
const ROOT = path.join(path.dirname(new URL(import.meta.url).pathname), "audio");
const DONE = path.join(ROOT, ".uploaded.txt");
const done = new Set(fs.existsSync(DONE) ? fs.readFileSync(DONE, "utf8").split("\n").filter(Boolean) : []);
const files = [];
(function walk(d) {
  for (const e of fs.readdirSync(d, { withFileTypes: true })) {
    if (e.name.startsWith(".") || e.name.startsWith("_")) continue;
    const p = path.join(d, e.name);
    if (e.isDirectory()) walk(p);
    else if (/\.(mp3|json)$/.test(e.name)) {
      const key = path.relative(ROOT, p).split(path.sep).join("/");
      const stamp = `${key}|${fs.statSync(p).size}`;
      if (!done.has(stamp)) files.push({ p, key, stamp });
    }
  }
})(ROOT);
console.log(`${files.length} new files to upload.`);
if (!files.length) process.exit(0);
try { execFileSync("npx", ["--yes", "wrangler", "whoami"], { stdio: "ignore" }); } catch {}
let loggedIn = false;
try { loggedIn = /You are logged in/i.test(execFileSync("npx", ["--yes", "wrangler", "whoami"]).toString()); } catch {}
if (!loggedIn) execFileSync("npx", ["--yes", "wrangler", "login"], { stdio: "inherit" });
let i = 0, ok = 0, fail = 0;
function put(f) {
  return new Promise((res) => {
    const type = f.key.endsWith(".mp3") ? "audio/mpeg" : "application/json";
    const cp = spawn("npx", ["--yes", "wrangler", "r2", "object", "put", `rop-audio/${f.key}`,
      "--file", f.p, "--remote", "--content-type", type,
      "--cache-control", "public, max-age=31536000, immutable"], { stdio: "ignore" });
    cp.on("close", (code) => {
      if (code === 0) { ok++; fs.appendFileSync(DONE, f.stamp + "\n"); } else fail++;
      process.stdout.write(`\r${ok} uploaded, ${fail} failed, of ${files.length}   `);
      res();
    });
  });
}
async function worker() { while (i < files.length) await put(files[i++]); }
await Promise.all([worker(), worker(), worker(), worker()]);
console.log(`\nDone. ${ok} uploaded${fail ? `, ${fail} failed (run again to retry)` : ""}.`);
