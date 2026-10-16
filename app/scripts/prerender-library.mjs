#!/usr/bin/env node
/**
 * S452 — Pre-render the library as real HTML pages so Google can read it.
 *
 * Runs at the end of `npm run build` (package.json) on Render, after Vite
 * has written app/dist. It asks the live API for every book through the
 * anonymous S452 export endpoint (/v1/public/library/{edition}/{slug}) and
 * writes:
 *
 *   dist/library/index.html                      — every book, by category
 *   dist/library/<book-slug>/index.html          — the book's chapters
 *   dist/library/<book-slug>/<n>/index.html      — one chapter
 *   dist/sitemap.xml                             — every page above
 *
 * What a page carries is decided by the SERVER, never here: a free canon
 * chapter arrives whole; a partner-library chapter arrives as its first
 * paragraph only (`teaser: true`) and the page says so and invites the
 * reader on. The verse text is written exactly as stored — the sacred-name
 * parentheticals are already in it. Every page ends with the 5-verse
 * Michael taste (same R2 files and verse timings the app uses) and the
 * 7-day-trial link; these pages are web only.
 *
 * Any fetch failure throws, so a broken build never replaces the last good
 * deploy with a half-written library. (Render keeps the previous deploy
 * when the build command exits non-zero.)
 *
 * Verify by content after a deploy: open a canon chapter and a teaser
 * chapter and read the verses against the app.
 */

import { mkdir, writeFile } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const HERE = path.dirname(fileURLToPath(import.meta.url));
const DIST = path.resolve(HERE, "..", "dist");
const API = (process.env.VITE_API_BASE ?? "https://api.bible.remnantofpromise.org/v1").replace(/\/$/, "");
const SITE = "https://bible.remnantofpromise.org";
const AUDIO_BASE =
  process.env.VITE_AUDIO_BASE ?? "https://pub-ea998a76536a4b99b520a192edaa8dc2.r2.dev";
const VOICE = "am_michael"; // the default natural voice in the app
const SAMPLE_VERSES = 5; // mirrors app/src/lib/recordedAudio.ts
const CONCURRENCY = 6;

// Same display filters as the reader (app/src/App.tsx): the Charles-vol1
// apocrypha duplicates and Barnabas are not shown, so they are not published.
function isSuppressed(b) {
  if (b.edition_slug === "apocrypha-charles-vol1" && b.slug !== "3-maccabees") return true;
  if (b.edition_slug === "lightfoot-apostolic-fathers" && b.slug === "barnabas") return true;
  return false;
}

const CATEGORY_LABEL = {
  canon: "The Canon",
  apocrypha: "The Apocrypha",
  pseudepigrapha: "The Pseudepigrapha",
  apostolic_fathers: "The Apostolic Fathers",
  apocryphal_gospels: "Apocryphal Gospels",
  historical_witness: "Historical Witness",
  disputed_witness: "Disputed Witness",
};

function esc(s) {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

/** "Book of Enoch" → "Enoch"; "The Book of Jasher" → "Jasher". */
function displayName(b) {
  const t = b.short_title || b.title || b.slug;
  return t.replace(/^(the\s+)?book\s+of\s+/i, "").trim();
}

function audioKey(b) {
  return b.edition_slug === "canon" ? b.slug : `${b.edition_slug}/${b.slug}`;
}

// Render deploys the API (Docker) and this static site from the same push
// at the same time, so the site build can start before the new API is live.
// A 404 from the export endpoint is therefore retried patiently (up to
// ~12 minutes, 30 s apart) before the build gives up and keeps the old site.
async function getJSON(url) {
  const patient = url.includes("/public/library/");
  const attempts = patient ? 24 : 4;
  for (let attempt = 0; attempt < attempts; attempt++) {
    try {
      const r = await fetch(url);
      if (r.ok) return await r.json();
      if (r.status === 404 && !patient) throw new Error(`404 ${url}`);
      console.warn(`[prerender] ${r.status} ${url} (attempt ${attempt + 1}/${attempts})`);
    } catch (e) {
      if (String(e).startsWith("Error: 404")) throw e;
      console.warn(`[prerender] ${e} (attempt ${attempt + 1}/${attempts})`);
    }
    await new Promise((res) => setTimeout(res, patient ? 30000 : 1500 * (attempt + 1)));
  }
  throw new Error(`[prerender] gave up on ${url}`);
}

const CSS = `
:root{--bg:#0a0e1a;--text:#ffffff;--muted:#b8bcc8;--accent:#0084ff;--card:#131a2b;--rule:#223050}
@media (prefers-color-scheme:light){:root{--bg:#fafaf7;--text:#1a1a1a;--muted:#555;--card:#f0efe9;--rule:#d8d6cc}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--text);font-family:Lora,Georgia,"Times New Roman",serif;line-height:1.65;font-size:18px}
main{max-width:680px;margin:0 auto;padding:24px 16px 64px}
header.site{font-size:14px;color:var(--muted);letter-spacing:.04em}
header.site a{color:var(--muted);text-decoration:none}
h1{font-size:28px;line-height:1.2;margin:16px 0 4px}
.edition{color:var(--muted);font-size:15px;margin:0 0 20px}
.intro{color:var(--muted);font-style:italic;margin:0 0 20px}
p.v{margin:0 0 .6em}
sup.n{color:var(--accent);font-size:.7em;font-weight:600;margin-right:.35em}
.card{background:var(--card);border:1px solid var(--rule);border-radius:12px;padding:18px 18px 16px;margin:28px 0}
.card h2{margin:0 0 8px;font-size:19px}
.card p{margin:0 0 10px;font-size:16px;color:var(--muted)}
.btn{display:inline-block;background:var(--accent);color:#fff;text-decoration:none;padding:10px 16px;border-radius:999px;font-size:16px;font-family:system-ui,sans-serif;border:0;cursor:pointer}
.btn.secondary{background:transparent;color:var(--text);border:1px solid var(--rule)}
.notice{display:none;margin-top:10px;font-size:15px;color:var(--muted)}
nav.pn{display:flex;justify-content:space-between;gap:12px;margin:24px 0;font-family:system-ui,sans-serif;font-size:15px}
nav.pn a{color:var(--text);text-decoration:none;border:1px solid var(--rule);border-radius:999px;padding:8px 14px}
ul.chapters{list-style:none;padding:0;display:flex;flex-wrap:wrap;gap:8px}
ul.chapters a{display:inline-block;min-width:44px;text-align:center;border:1px solid var(--rule);border-radius:8px;padding:6px 8px;color:var(--text);text-decoration:none}
ul.books{list-style:none;padding:0}
ul.books li{margin:6px 0}
ul.books a{color:var(--text);text-decoration:none}
h2.cat{font-size:16px;letter-spacing:.08em;text-transform:uppercase;color:var(--accent);margin:28px 0 8px}
footer{margin-top:48px;font-size:14px;color:var(--muted)}
footer a{color:var(--muted)}
`;

function shell({ title, description, canonical, body, ogTitle }) {
  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${esc(title)}</title>
<meta name="description" content="${esc(description)}">
<link rel="canonical" href="${canonical}">
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<meta name="theme-color" content="#0a0e1a">
<meta property="og:type" content="article">
<meta property="og:site_name" content="Remnant of Promise Study Bible">
<meta property="og:url" content="${canonical}">
<meta property="og:title" content="${esc(ogTitle ?? title)}">
<meta property="og:description" content="${esc(description)}">
<meta property="og:image" content="${SITE}/og-image.png">
<meta name="twitter:card" content="summary_large_image">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
<style>${CSS}</style>
</head>
<body>
<main>
<header class="site"><a href="/">Remnant of Promise Study Bible</a> · <a href="/library/">Library</a></header>
${body}
<footer>
<p>The Remnant of Promise Official Study Bible — the restored names, the canon and the books it left out, read side by side. <a href="/">Read free in the app</a> · <a href="https://remnantofpromise.org">remnantofpromise.org</a></p>
</footer>
</main>
</body>
</html>
`;
}

const TASTE_SCRIPT = `
<script>
(function(){
  var btn=document.getElementById('taste');if(!btn)return;
  var src=btn.getAttribute('data-src'),timing=btn.getAttribute('data-timing');
  var N=${SAMPLE_VERSES},notice=document.getElementById('taste-notice'),a=null,stopAt=null,done=false;
  function show(t){notice.textContent=t;notice.style.display='block';}
  btn.addEventListener('click',function(){
    if(a&&!a.paused){a.pause();btn.textContent='▶ Hear this chapter — Michael, natural voice';return;}
    if(a&&!done){a.play();btn.textContent='❚❚ Pause';return;}
    btn.textContent='Loading…';
    fetch(timing).then(function(r){return r.ok?r.json():null}).catch(function(){return null}).then(function(t){
      a=new Audio(src);done=false;
      if(t&&t.verses){var v=t.verses.filter(function(p){return p[0]===N+1})[0];stopAt=v?v[1]:null;}
      a.addEventListener('timeupdate',function(){if(stopAt!=null&&a.currentTime>=stopAt){a.pause();done=true;btn.textContent='▶ Hear it again';show('That was a taste of the natural voice — the first '+N+' verses. Partners and the 7-day free trial hear every chapter, read along, word by word.');}});
      a.addEventListener('ended',function(){done=true;btn.textContent='▶ Hear it again';if(stopAt==null)show('Partners and the 7-day free trial hear every chapter in the natural voice.');});
      a.addEventListener('error',function(){btn.style.display='none';});
      a.play().then(function(){btn.textContent='❚❚ Pause';}).catch(function(){btn.textContent='▶ Hear this chapter — Michael, natural voice';});
    });
  });
})();
</script>`;

function chapterPage({ book, name, ch, prev, next, totalChapters }) {
  const n = ch.chapter_number;
  const url = `${SITE}/library/${book.slug}/${n}/`;
  const title = `${name} ${n} — Restored Names Edition | Remnant of Promise Study Bible`;
  const first = ch.verses[0]?.text ?? "";
  const description = (ch.teaser
    ? `${name} ${n}, Restored Names Edition — the first paragraph free, the whole chapter with the 7-day trial. `
    : `${name} ${n} in the Restored Names Edition. `) + first.slice(0, 150);
  const withheld = Math.max(0, ch.verse_count - ch.verses.length);
  const key = audioKey(book);

  const verses = ch.verses
    .map((v) => `<p class="v" id="v${v.verse_number}"><sup class="n">${v.verse_number}</sup>${esc(v.text)}</p>`)
    .join("\n");

  const teaserCard = ch.teaser
    ? `<section class="card">
<h2>That is the first paragraph of ${esc(name)} ${n}</h2>
<p>The other ${withheld} verse${withheld === 1 ? "" : "s"} of this chapter — and every chapter of the partner library (the Apocrypha, 1 Enoch, Jubilees, Jasher, the Apostolic Fathers, Josephus, and more) — open with the 7-day free trial. The 66-book canon stays free for everyone.</p>
<a class="btn" href="/pricing">Start the 7-day free trial — read the whole chapter</a>
</section>`
    : "";

  const tasteCard = `<section class="card">
<h2>Hear this chapter</h2>
<p>Michael reads ${esc(name)} ${n} in a natural voice. Free listeners hear the first ${SAMPLE_VERSES} verses; partners and the 7-day free trial hear every chapter, with read-along highlighting in the app.</p>
<button class="btn" id="taste" data-src="${AUDIO_BASE}/${VOICE}/${key}/${n}.mp3" data-timing="${AUDIO_BASE}/${VOICE}/${key}/${n}.json">▶ Hear this chapter — Michael, natural voice</button>
<div class="notice" id="taste-notice"></div>
<p style="margin-top:14px"><a class="btn secondary" href="/pricing">Start the 7-day free trial</a> &nbsp; <a class="btn secondary" href="/read?book=${encodeURIComponent(book.slug)}&amp;chapter=${n}">Open in the app</a></p>
</section>`;

  const nav = `<nav class="pn">
${prev ? `<a href="/library/${prev.book.slug}/${prev.n}/" rel="prev">← ${esc(prev.name)} ${prev.n}</a>` : "<span></span>"}
<a href="/library/${book.slug}/">${esc(name)} · ${totalChapters} chapters</a>
${next ? `<a href="/library/${next.book.slug}/${next.n}/" rel="next">${esc(next.name)} ${next.n} →</a>` : "<span></span>"}
</nav>`;

  const body = `
<h1>${esc(name)} ${n}${ch.chapter_title ? ` — ${esc(ch.chapter_title)}` : ""}</h1>
<p class="edition">${esc(book.title)} · Restored Names Edition${ch.teaser ? " · first paragraph" : ""}</p>
${nav}
<article>
${verses}
</article>
${teaserCard}
${tasteCard}
${nav}
${TASTE_SCRIPT}`;

  return { url, html: shell({ title, description, canonical: url, body, ogTitle: `${name} ${n} — Restored Names Edition` }) };
}

function bookPage({ book, name, chapters }) {
  const url = `${SITE}/library/${book.slug}/`;
  const teaser = chapters[0]?.teaser;
  const title = `${name} — Restored Names Edition | Remnant of Promise Study Bible`;
  const description = `${book.title}, Restored Names Edition: ${chapters.length} chapters${teaser ? ", the first paragraph of each free to read, the whole book with the 7-day trial" : ", free to read"}.`;
  const list = chapters.map((c) => `<li><a href="/library/${book.slug}/${c.chapter_number}/">${c.chapter_number}</a></li>`).join("");
  const body = `
<h1>${esc(book.title)}</h1>
<p class="edition">Restored Names Edition · ${chapters.length} chapters${teaser ? " · partner library (first paragraph of each chapter free)" : " · free"}</p>
${book.abstract ? `<p class="intro">${esc(book.abstract)}</p>` : ""}
<ul class="chapters">${list}</ul>
<p style="margin-top:24px"><a class="btn secondary" href="/read?book=${encodeURIComponent(book.slug)}&amp;chapter=1">Open in the app</a>${teaser ? ` &nbsp; <a class="btn" href="/pricing">Start the 7-day free trial</a>` : ""}</p>`;
  return { url, html: shell({ title, description, canonical: url, body }) };
}

function libraryPage(books) {
  const url = `${SITE}/library/`;
  const title = "The Library — Restored Names Edition | Remnant of Promise Study Bible";
  const description = "Every book in the Remnant of Promise Study Bible: the 66-book canon free in full, and the books the canon left out — the Apocrypha, 1 Enoch, Jubilees, Jasher, the Apostolic Fathers and more — with the first paragraph of every chapter free to read.";
  const byCat = new Map();
  for (const b of books) {
    if (!byCat.has(b.witness_category)) byCat.set(b.witness_category, []);
    byCat.get(b.witness_category).push(b);
  }
  let body = `<h1>The Library</h1><p class="edition">Restored Names Edition</p>`;
  for (const [cat, list] of byCat) {
    body += `<h2 class="cat">${esc(CATEGORY_LABEL[cat] ?? cat)}</h2><ul class="books">`;
    for (const b of list) body += `<li><a href="/library/${b.slug}/">${esc(b.title)}</a>${b.locked ? " 🔒" : ""}</li>`;
    body += `</ul>`;
  }
  return { url, html: shell({ title, description, canonical: url, body }) };
}

async function writePage(url, html) {
  const rel = url.replace(SITE, "").replace(/^\//, "");
  const dir = path.join(DIST, rel);
  await mkdir(dir, { recursive: true });
  await writeFile(path.join(dir, "index.html"), html, "utf8");
}

async function main() {
  const t0 = Date.now();
  const all = await getJSON(`${API}/books?include_locked=true`);
  const books = all.filter((b) => !isSuppressed(b));
  const seen = new Map();
  for (const b of books) {
    if (seen.has(b.slug)) throw new Error(`[prerender] slug collision: ${b.slug} in ${seen.get(b.slug)} and ${b.edition_slug}`);
    seen.set(b.slug, b.edition_slug);
  }
  console.log(`[prerender] ${books.length} books (${all.length - books.length} suppressed)`);

  // Fetch every book with bounded concurrency; order preserved for prev/next.
  const fetched = new Array(books.length);
  let i = 0;
  await Promise.all(
    Array.from({ length: CONCURRENCY }, async () => {
      while (i < books.length) {
        const idx = i++;
        const b = books[idx];
        fetched[idx] = await getJSON(`${API}/public/library/${b.edition_slug}/${b.slug}`);
        console.log(`[prerender] ${b.edition_slug}/${b.slug}: ${fetched[idx].chapters.length} chapters${fetched[idx].chapters[0]?.teaser ? " (teaser)" : ""}`);
      }
    })
  );

  // Flat chapter sequence for prev/next across book boundaries.
  const seq = [];
  for (let k = 0; k < books.length; k++) {
    const book = books[k];
    const name = displayName(book);
    for (const ch of fetched[k].chapters) seq.push({ book, name, ch, total: fetched[k].chapters.length });
  }

  const urls = [];
  const lib = libraryPage(books);
  await writePage(lib.url, lib.html); urls.push(lib.url);
  for (let k = 0; k < books.length; k++) {
    const p = bookPage({ book: books[k], name: displayName(books[k]), chapters: fetched[k].chapters });
    await writePage(p.url, p.html); urls.push(p.url);
  }
  let pages = 0, verses = 0;
  for (let k = 0; k < seq.length; k++) {
    const s = seq[k];
    const prev = k > 0 ? { book: seq[k - 1].book, name: seq[k - 1].name, n: seq[k - 1].ch.chapter_number } : null;
    const next = k < seq.length - 1 ? { book: seq[k + 1].book, name: seq[k + 1].name, n: seq[k + 1].ch.chapter_number } : null;
    const p = chapterPage({ book: s.book, name: s.name, ch: s.ch, prev, next, totalChapters: s.total });
    await writePage(p.url, p.html); urls.push(p.url);
    pages++; verses += s.ch.verses.length;
  }

  const today = new Date().toISOString().slice(0, 10);
  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n` +
    urls.map((u) => `  <url><loc>${u}</loc><lastmod>${today}</lastmod></url>`).join("\n") +
    `\n</urlset>\n`;
  await writeFile(path.join(DIST, "sitemap.xml"), sitemap, "utf8");
  console.log(`[prerender] ${pages} chapter pages, ${verses} verses, ${urls.length} sitemap URLs in ${((Date.now() - t0) / 1000).toFixed(0)}s`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
