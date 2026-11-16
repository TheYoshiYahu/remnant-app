#!/usr/bin/env node
/**
 * walk.remnantofpromise.org — "Living in His Ways"
 *
 * Static build. Reads walk/data/**, writes walk/dist/**. No framework, no
 * dependencies, no trackers, no fonts from anyone's servers. Runs on Render as
 * the build command of the `remnant-walk` static site (hosting/render.yaml).
 *
 * What a page carries is decided here for FREE entries and by the API for the
 * rest: a free entry is written whole into the HTML; a member entry is written
 * with its name, where it grows, its season, and EVERY look-alike warning
 * (the warning is never behind the join line), and the part-eaten and
 * preparation are greyed. After load, walk.js asks the API who the reader is
 * (the rop_jwt cookie from the WordPress login is shared across
 * .remnantofpromise.org) and, for Study Notes and above, fetches the greyed
 * parts from /v1/walk/plants/{state} and fills them in.
 *
 * Scripture openers are read from source-texts/parsed/canon.json — the
 * restored library — verbatim, never retyped.
 */

import { mkdir, readFile, writeFile, readdir, copyFile, stat } from "node:fs/promises";
import { existsSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const HERE = path.dirname(fileURLToPath(import.meta.url));
const REPO = path.resolve(HERE, "..");
const DIST = path.join(HERE, "dist");
const DATA = path.join(HERE, "data");
const SITE = "https://walk.remnantofpromise.org";
const API = (process.env.VITE_API_BASE ?? "https://api.bible.remnantofpromise.org/v1").replace(/\/$/, "");
const HOME = "https://remnantofpromise.org";
const APP = "https://bible.remnantofpromise.org";
const APPSTORE = "https://apps.apple.com/app/id6778134531";
const PLAY = "https://play.google.com/store/apps/details?id=com.remnantofpromise.bible";
const JOIN_TIER = "Study Notes";

const SEASONS = [
  ["spring", "Spring", "March – May"],
  ["summer", "Summer", "June – August"],
  ["fall", "Fall", "September – November"],
  ["winter", "Winter", "December – February"],
];

const STATES = [
  ["AL","Alabama"],["AK","Alaska"],["AZ","Arizona"],["AR","Arkansas"],["CA","California"],["CO","Colorado"],["CT","Connecticut"],["DE","Delaware"],["FL","Florida"],["GA","Georgia"],["HI","Hawaii"],["ID","Idaho"],["IL","Illinois"],["IN","Indiana"],["IA","Iowa"],["KS","Kansas"],["KY","Kentucky"],["LA","Louisiana"],["ME","Maine"],["MD","Maryland"],["MA","Massachusetts"],["MI","Michigan"],["MN","Minnesota"],["MS","Mississippi"],["MO","Missouri"],["MT","Montana"],["NE","Nebraska"],["NV","Nevada"],["NH","New Hampshire"],["NJ","New Jersey"],["NM","New Mexico"],["NY","New York"],["NC","North Carolina"],["ND","North Dakota"],["OH","Ohio"],["OK","Oklahoma"],["OR","Oregon"],["PA","Pennsylvania"],["RI","Rhode Island"],["SC","South Carolina"],["SD","South Dakota"],["TN","Tennessee"],["TX","Texas"],["UT","Utah"],["VT","Vermont"],["VA","Virginia"],["WA","Washington"],["WV","West Virginia"],["WI","Wisconsin"],["WY","Wyoming"],
];

function esc(s) {
  return String(s ?? "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
}
function slugState(name) { return name.toLowerCase().replace(/\s+/g, "-"); }

// ---- scripture from the restored library ---------------------------------
let CANON = null;
async function verses(book, chapter, from, to) {
  if (!CANON) {
    const p = path.join(REPO, "source-texts", "parsed", "canon.json");
    CANON = JSON.parse(await readFile(p, "utf8"));
  }
  const b = CANON.books.find((x) => x.book_id === book);
  if (!b) throw new Error(`canon: no book ${book}`);
  const c = b.chapters.find((x) => x.number === chapter);
  if (!c) throw new Error(`canon: no ${book} ${chapter}`);
  const out = c.verses.filter((v) => v.number >= from && v.number <= to);
  if (out.length !== to - from + 1) throw new Error(`canon: ${book} ${chapter}:${from}-${to} incomplete`);
  return out;
}
function bookLabel(id) {
  return { leviticus: "Leviticus", deuteronomy: "Deuteronomy", genesis: "Genesis", exodus: "Exodus", "1-kings": "1 Kings", psalms: "Psalm" }[id] ?? id;
}
async function scriptureBlock(book, chapter, from, to) {
  const vs = await verses(book, chapter, from, to);
  const text = vs.map((v) => `<sup>${v.number}</sup>${esc(v.text)}`).join(" ");
  return `<blockquote class="scripture"><p><em>${text}</em> <span class="ref">(${bookLabel(book)} ${chapter}:${from}–${to})</span></p></blockquote>`;
}

// ---- shell ---------------------------------------------------------------
const CSS = `
:root{--bg:#0a0e1a;--text:#fff;--muted:#b8bcc8;--accent:#0084ff;--card:#131a2b;--rule:#223050;--grey:#2a3246;--warn:#ffb347;--red:#ff4d4d}
@media (prefers-color-scheme:light){:root{--bg:#fafaf7;--text:#1a1a1a;--muted:#555;--card:#f0efe9;--rule:#d8d6cc;--grey:#e4e2d9;--warn:#9a5b00;--red:#c81e1e}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--text);font-family:Georgia,"Times New Roman",serif;line-height:1.6;font-size:18px}
main{max-width:720px;margin:0 auto;padding:16px 16px 64px}
header.site{display:flex;flex-wrap:wrap;gap:6px 14px;align-items:center;font-family:system-ui,sans-serif;font-size:14px;color:var(--muted);padding:8px 0 16px;border-bottom:1px solid var(--rule)}
header.site a{color:var(--muted);text-decoration:none}
header.site a.brand{color:var(--text);font-weight:600;letter-spacing:.02em}
header.site .app{margin-left:auto;display:flex;gap:10px}
header.site .app a{border:1px solid var(--rule);border-radius:999px;padding:3px 10px}
h1{font-size:30px;line-height:1.15;margin:20px 0 6px}
h2{font-size:22px;margin:32px 0 10px}
h3{font-size:19px;margin:0 0 6px}
.lede{color:var(--muted);margin:0 0 18px;font-size:17px}
blockquote.scripture{margin:22px 0;padding:0 0 0 16px;border-left:3px solid var(--accent)}
blockquote.scripture p{margin:0}
blockquote.scripture sup{color:var(--accent);font-size:.7em;margin-right:.25em}
blockquote.scripture .ref{color:var(--muted);font-style:normal;font-size:15px}
.rule{background:var(--card);border:1px solid var(--rule);border-radius:12px;padding:14px 16px;margin:18px 0;font-size:16px}
.rule strong{color:var(--warn)}
ul.states{list-style:none;padding:0;display:grid;grid-template-columns:repeat(auto-fill,minmax(150px,1fr));gap:8px;font-family:system-ui,sans-serif;font-size:15px}
ul.states a{display:block;border:1px solid var(--rule);border-radius:8px;padding:8px 10px;color:var(--text);text-decoration:none}
ul.states li.soon a{color:var(--muted);border-style:dashed}
nav.seasons{display:flex;flex-wrap:wrap;gap:8px;margin:14px 0 6px;font-family:system-ui,sans-serif;font-size:15px}
nav.seasons a{border:1px solid var(--rule);border-radius:999px;padding:6px 12px;color:var(--text);text-decoration:none}
.card{background:var(--card);border:1px solid var(--rule);border-radius:12px;padding:16px 18px;margin:14px 0}
.card .sci{color:var(--muted);font-style:italic;font-size:15px;margin:0 0 8px}
.card dl{margin:0;display:grid;grid-template-columns:7.5em 1fr;gap:4px 12px;font-size:16px}
.card dt{color:var(--muted);font-family:system-ui,sans-serif;font-size:13px;letter-spacing:.06em;text-transform:uppercase;padding-top:3px}
.card dd{margin:0}
.locked{position:relative;border-radius:8px;background:var(--grey);color:transparent;user-select:none;min-height:3.2em;filter:blur(3px)}
.join{font-family:system-ui,sans-serif;font-size:15px;background:var(--card);border:1px dashed var(--accent);border-radius:10px;padding:10px 14px;margin:10px 0 0}
.join a{color:var(--accent)}
.look{border-left:3px solid var(--warn);padding:6px 0 6px 12px;margin:10px 0}
.look b{font-family:system-ui,sans-serif;font-size:14px;letter-spacing:.05em;text-transform:uppercase;color:var(--warn)}
.look p{margin:4px 0;font-size:16px}
.look .danger{font-weight:600}
.look.red{border-left-color:var(--red)}
.look.red b{color:var(--red)}
.look.red .danger{color:var(--red)}
.look.red .lookphoto img{border-color:var(--red)}
.caution{font-size:16px;color:var(--muted);margin:10px 0 0}
.photo{margin:0 0 10px}
.photo img{max-width:100%;height:auto;border-radius:8px;display:block}
.photo figcaption{font-size:13px;color:var(--muted);font-family:system-ui,sans-serif;margin-top:4px}
.photo figcaption a{color:var(--muted)}
.lookphoto img{max-width:360px;border:2px solid var(--warn)}
a.entry{color:var(--text)}
ul.entries{list-style:none;padding:0;margin:0}
ul.entries li{padding:8px 0;border-bottom:1px solid var(--rule)}
ul.entries li .meta{color:var(--muted);font-size:15px;font-family:system-ui,sans-serif}
ul.entries li.member .name::after{content:" · members";color:var(--accent);font-family:system-ui,sans-serif;font-size:13px}
footer{margin-top:48px;padding-top:16px;border-top:1px solid var(--rule);font-family:system-ui,sans-serif;font-size:14px;color:var(--muted)}
footer a{color:var(--muted)}
footer .apps{display:flex;flex-wrap:wrap;gap:10px;margin:8px 0}
footer .apps a{border:1px solid var(--rule);border-radius:999px;padding:4px 12px;text-decoration:none}
.sources{font-size:14px;color:var(--muted);margin-top:28px}
`;

const WALK_JS = `
(function(){
  var API=${JSON.stringify(API)};
  var RANK={free:0,study_notes:1,extras:2,complete_study:3,everything:4};
  // S504 visit counter: one beacon per page load, random id in localStorage (no cookie, no IP), API dedupes to one visit per 30 min.
  try{var vid=localStorage.getItem('rop_visit_id');if(!vid){vid=(crypto.randomUUID?crypto.randomUUID():String(Math.random()).slice(2)+Date.now());localStorage.setItem('rop_visit_id',vid);}
    fetch(API+'/visit',{method:'POST',credentials:'include',keepalive:true,headers:{'Content-Type':'application/json'},
      body:JSON.stringify({anon_id:vid,surface:'walk',path:location.pathname})}).catch(function(){});
  }catch(e){}
  var page=document.body.getAttribute('data-walk');
  if(!page)return;
  fetch(API+'/subscriptions/me',{credentials:'include'}).then(function(r){return r.ok?r.json():null}).catch(function(){return null}).then(function(me){
    var tier=(me&&me.tier)||'free';
    if(me&&(me.status==='active'||me.status==='trialing')&&RANK[tier]>=1){unlock(page);}
  });
  function unlock(page){
    var parts=page.split(':');
    fetch(API+'/walk/'+parts[0]+'/'+parts[1],{credentials:'include'}).then(function(r){return r.ok?r.json():null}).catch(function(){return null}).then(function(d){
      if(!d||!d.entries)return;
      d.entries.forEach(function(e){
        var el=document.getElementById('e-'+e.slug);if(!el)return;
        var p=el.querySelector('[data-f=part]');if(p){p.textContent=e.part;p.classList.remove('locked');}
        var q=el.querySelector('[data-f=prepare]');if(q){q.textContent=e.prepare;q.classList.remove('locked');}
        var j=el.querySelector('.join');if(j)j.remove();
      });
      document.querySelectorAll('li.member').forEach(function(li){li.classList.remove('member');});
    });
  }
})();
`;

function shell({ title, description, canonical, body, walk }) {
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
<meta property="og:site_name" content="Remnant of Promise — Living in His Ways">
<meta property="og:url" content="${canonical}">
<meta property="og:title" content="${esc(title)}">
<meta property="og:description" content="${esc(description)}">
<meta property="og:image" content="${SITE}/og-image.png">
<style>${CSS}</style>
</head>
<body${walk ? ` data-walk="${esc(walk)}"` : ""}>
<main>
<header class="site">
<a class="brand" href="${HOME}">Remnant of Promise</a>
<a href="/">Living in His Ways</a>
<a href="/wild-edibles/">Wild edibles</a>
<span class="app"><a href="${APP}">Study Bible</a><a href="${APPSTORE}">App Store</a><a href="${PLAY}">Google Play</a></span>
</header>
${body}
<footer>
<p>Living in His Ways is part of <a href="${HOME}">Remnant of Promise</a>, a church in Wood County, Texas. Nothing here is tracked and nothing is sold to anyone.</p>
<p>The Remnant of Promise Study Bible — the restored names, the canon and the books it left out, read side by side:</p>
<p class="apps"><a href="${APP}">bible.remnantofpromise.org</a><a href="${APPSTORE}">App Store</a><a href="${PLAY}">Google Play</a></p>
</footer>
</main>
<script>${WALK_JS}</script>
</body>
</html>
`;
}

function joinLine(stateName) {
  return `<p class="join">Members see the part eaten and how to prepare it, on every plant in every state. The ${esc(JOIN_TIER)} tier ($1.99 a month) opens all of it here and the framework commentary in the Study Bible. <a href="${APP}/pricing">Join</a> · <a href="${APP}/sign-in">Already a member? Sign in</a></p>`;
}

let LOOK_PHOTOS = {};
function lookPhoto(l) {
  const p = l.scientific && LOOK_PHOTOS[l.scientific];
  if (!p?.file) return "";
  const credit = `${esc(p.author ?? "")}${p.license ? ` · ${esc(p.license)}` : ""}${p.source ? ` · <a href="${esc(p.source)}">Wikimedia Commons</a>` : ""}`;
  return `<figure class="photo lookphoto"><img src="/img/lookalikes/${esc(p.file)}" alt="${esc(l.name)} — ${esc(l.scientific)} — do not eat" loading="lazy"><figcaption>${credit}</figcaption></figure>`;
}
function lookalikes(e) {
  if (!e.lookalikes?.length) return "";
  return e.lookalikes.map((l) => `<div class="look${/deadly|poison|toxic|rash|injur|sting|sick|nausea|vomit|cyanide/i.test(l.danger ?? "") ? " red" : ""}"><b>${/deadly/i.test(l.danger ?? "") ? "Deadly look-alike" : "Look-alike"}</b><p><strong>${esc(l.name)}</strong>${l.scientific ? ` <em>(${esc(l.scientific)})</em>` : ""}</p>${lookPhoto(l)}<p>${esc(l.how)}</p><p class="danger">${esc(l.danger)}</p></div>`).join("");
}

function photo(e) {
  if (!e.photo?.file) return "";
  const src = `/img/plants/${e.photo.file}`;
  const credit = `${esc(e.photo.author ?? "")}${e.photo.license ? ` · ${esc(e.photo.license)}` : ""}${e.photo.source ? ` · <a href="${esc(e.photo.source)}">Wikimedia Commons</a>` : ""}`;
  return `<figure class="photo"><img src="${src}" alt="${esc(e.common)} — ${esc(e.scientific)}" loading="lazy"><figcaption>${credit}</figcaption></figure>`;
}

function entryCard(e, stateName, { full }) {
  const locked = !e.free && !full;
  const field = (name, value) => locked
    ? `<dd class="locked" data-f="${name}">${esc("Members see this.")}</dd>`
    : `<dd data-f="${name}">${esc(value)}</dd>`;
  return `<article class="card" id="e-${esc(e.slug)}">
<h3><a class="entry" href="/wild-edibles/${slugState(stateName)}/${esc(e.slug)}/">${esc(e.common)}</a></h3>
<p class="sci">${esc(e.scientific)} · ${esc(e.family)} · USDA ${esc(e.usda)}</p>
${photo(e)}
<dl>
<dt>Season</dt><dd>${esc(e.months)}</dd>
<dt>Where</dt><dd>${esc(e.where)}</dd>
<dt>Part eaten</dt>${field("part", e.part)}
<dt>Prepare</dt>${field("prepare", e.prepare)}
</dl>
${locked ? joinLine(stateName) : ""}
${lookalikes(e)}
${e.caution ? `<p class="caution"><strong>Before you pick it:</strong> ${esc(e.caution)}</p>` : ""}
</article>`;
}

// ---- pages ---------------------------------------------------------------
async function writePage(url, html) {
  const dir = path.join(DIST, url);
  await mkdir(dir, { recursive: true });
  await writeFile(path.join(dir, "index.html"), html);
}

async function homePage(liveStates) {
  const s1 = await scriptureBlock("genesis", 1, 29, 29);
  const body = `
<h1>Living in His Ways</h1>
<p class="lede">Life is part of walking in his ways. What grows wild where you live, what carries a household through hard days, and what the Word says about the days of darkness — laid out plainly, with the scripture that makes each one his instruction.</p>
${s1}
<h2>Wild edibles, by state</h2>
<p>Pick your state. See what grows wild and edible near you, by season — the photo, where it grows, which part, how to prepare it, and the poisonous look-alike on every entry.</p>
<p><a href="/wild-edibles/">Choose a state →</a> ${liveStates.length ? `(live now: ${liveStates.map((s) => `<a href="/wild-edibles/${slugState(s)}/">${esc(s)}</a>`).join(", ")})` : ""}</p>
<h2>Bug-in, bug-out</h2>
<p class="lede">Our own guide to what carries a household through the days of darkness, built from the public-domain manuals and the old household books. Coming.</p>
<h2>What scripture requires in the days of darkness</h2>
<p class="lede">The texts themselves, in full from the restored library — who the days come on and what the faithful kept. Coming.</p>
`;
  await writePage("", shell({ title: "Living in His Ways — Remnant of Promise", description: "Wild edibles by state, a bug-in / bug-out guide, and what scripture requires in the days of darkness — from Remnant of Promise.", canonical: `${SITE}/`, body }));
}

async function statePickerPage(liveStates) {
  const live = new Set(liveStates);
  const items = STATES.map(([abbr, name]) => live.has(name)
    ? `<li><a href="/wild-edibles/${slugState(name)}/">${esc(name)}</a></li>`
    : `<li class="soon"><a href="/wild-edibles/${slugState(name)}/" title="Coming">${esc(name)}</a></li>`).join("");
  const body = `
<h1>Wild edible plants, by state</h1>
<p class="lede">Choose your state. Each page lists what grows wild and edible there by season, with the poisonous look-alikes on every entry.</p>
<ul class="states">${items}</ul>
<p class="sources">States marked with a dashed border are being written. Texas is the model page; the others follow on the same pattern.</p>
`;
  await writePage("wild-edibles", shell({ title: "Wild edible plants by state", description: "Pick your state to see what grows wild and edible near you, by season, with the poisonous look-alikes on every entry.", canonical: `${SITE}/wild-edibles/`, body }));
}

async function comingStatePage(name) {
  const body = `<h1>Wild edible plants in ${esc(name)}</h1><p class="lede">This page is being written on the same pattern as <a href="/wild-edibles/texas/">Texas</a>. Check back.</p>`;
  await writePage(`wild-edibles/${slugState(name)}`, shell({ title: `Wild edible plants in ${name} — coming`, description: `Wild edibles in ${name}, by season — coming.`, canonical: `${SITE}/wild-edibles/${slugState(name)}/`, body }));
}

async function statePages(data) {
  const name = data.state_name;
  const st = slugState(name);
  LOOK_PHOTOS = data.lookalike_photos ?? {};
  const s1 = await scriptureBlock("leviticus", 25, 1, 7);
  const s2 = await scriptureBlock("leviticus", 19, 9, 10);
  const bySeason = Object.fromEntries(SEASONS.map(([k]) => [k, []]));
  for (const e of data.entries) for (const s of e.season) bySeason[s].push(e);
  const freeCount = data.entries.filter((e) => e.free).length;

  const seasonNav = `<nav class="seasons">${SEASONS.map(([k, label]) => `<a href="#${k}">${label}</a>`).join("")}</nav>`;
  const seasonLists = SEASONS.map(([k, label, months]) => `
<h2 id="${k}">${label} <span class="meta" style="font-size:15px;color:var(--muted)">${months}</span></h2>
<ul class="entries">${bySeason[k].map((e) => `<li${e.free ? "" : ' class="member"'}><a class="entry name" href="/wild-edibles/${st}/${esc(e.slug)}/">${esc(e.common)}</a> <span class="meta">— ${esc(e.months)}</span></li>`).join("")}</ul>`).join("");

  const cards = data.entries.map((e) => entryCard(e, name, { full: false })).join("");

  const body = `
<h1>Wild edible plants in ${esc(name)} — by season</h1>
<p class="lede">${data.entries.length} plants that grow wild in ${esc(name)}, with the poisonous look-alike on every one. ${freeCount} are open to everyone in full; the rest show the part eaten and the preparation to members. The warnings are never hidden.</p>
${s1}
${s2}
<div class="rule"><strong>The rule.</strong> ${esc(data.rule)}</div>
${seasonNav}
${seasonLists}
<h2>Every plant</h2>
${cards}
<p class="sources">${esc(data.sources_note)}</p>
`;
  await writePage(`wild-edibles/${st}`, shell({ title: `Wild edible plants in ${name} — by season`, description: `${data.entries.length} wild edible plants in ${name} by season, with where each grows, the part eaten, how to prepare it, and the poisonous look-alike on every entry.`, canonical: `${SITE}/wild-edibles/${st}/`, body, walk: `plants:${data.state.toLowerCase()}` }));

  for (const e of data.entries) {
    const body = `
<p><a href="/wild-edibles/${st}/">← Wild edibles in ${esc(name)}</a></p>
<h1>${esc(e.common)} in ${esc(name)}</h1>
${entryCard(e, name, { full: false })}
<p class="sources">${esc(data.sources_note)}</p>
`;
    await writePage(`wild-edibles/${st}/${e.slug}`, shell({ title: `${e.common} — wild edible in ${name}`, description: `${e.common} (${e.scientific}) in ${name}: ${e.months}. ${e.where} Look-alikes: ${e.lookalikes.map((l) => l.name).join(", ")}.`, canonical: `${SITE}/wild-edibles/${st}/${e.slug}/`, body, walk: `plants:${data.state.toLowerCase()}` }));
  }
  return data.entries.map((e) => `/wild-edibles/${st}/${e.slug}/`);
}

// copyFile overwrites in place; fs.cp would unlink first, which the Mac's
// delete-locked mount refuses.
async function copyTree(src, dst) {
  await mkdir(dst, { recursive: true });
  for (const name of await readdir(src)) {
    const s = path.join(src, name), d = path.join(dst, name);
    if ((await stat(s)).isDirectory()) await copyTree(s, d);
    else await copyFile(s, d);
  }
}

async function main() {
  await mkdir(DIST, { recursive: true });
  const plantsDir = path.join(DATA, "plants");
  const files = (await readdir(plantsDir)).filter((f) => f.endsWith(".json"));
  const urls = ["/", "/wild-edibles/"];
  const liveStates = [];
  for (const f of files) {
    const data = JSON.parse(await readFile(path.join(plantsDir, f), "utf8"));
    liveStates.push(data.state_name);
    const st = slugState(data.state_name);
    urls.push(`/wild-edibles/${st}/`);
    urls.push(...(await statePages(data)));
  }
  await homePage(liveStates);
  await statePickerPage(liveStates);
  for (const [, name] of STATES) if (!liveStates.includes(name)) await comingStatePage(name);
  if (existsSync(path.join(HERE, "public"))) await copyTree(path.join(HERE, "public"), DIST);
  await writeFile(path.join(DIST, "sitemap.xml"), `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urls.map((u) => `<url><loc>${SITE}${u}</loc></url>`).join("\n")}\n</urlset>\n`);
  await writeFile(path.join(DIST, "robots.txt"), `User-agent: *\nAllow: /\nSitemap: ${SITE}/sitemap.xml\n`);
  console.log(`[walk] wrote ${urls.length} pages for ${liveStates.join(", ") || "no states"}`);
}

main().catch((e) => { console.error(e); process.exit(1); });
