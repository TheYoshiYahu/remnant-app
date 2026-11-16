#!/usr/bin/env node
/**
 * Fetch one representative photo per plant from Wikimedia Commons, with its
 * license and author, and record them beside the entry in data/plants/<st>.json.
 *
 * Source of the pick: the English Wikipedia article for the first scientific
 * name (its lead image is nearly always a Commons photo of the right plant);
 * the license and author come from the Commons file's extmetadata. Only
 * public-domain and CC licenses are accepted; anything else is skipped and
 * listed at the end for a hand pick.
 *
 *   node walk/photos.mjs tx          # fills photo{} on entries that lack one
 *   node walk/photos.mjs tx --force  # refetch all
 *
 * Images are saved at walk/public/img/plants/<slug>.jpg (800px wide thumb
 * from Commons, so the page stays light). Each entry gets:
 *   photo: { file, title, author, license, license_url, source }
 */
import { readFile, writeFile, mkdir } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const HERE = path.dirname(fileURLToPath(import.meta.url));
const st = process.argv[2];
const force = process.argv.includes("--force");
if (!st) { console.error("usage: node photos.mjs <state> [--force]"); process.exit(1); }
const dataPath = path.join(HERE, "data", "plants", `${st}.json`);
const outDir = path.join(HERE, "public", "img", "plants");
await mkdir(outDir, { recursive: true });
const data = JSON.parse(await readFile(dataPath, "utf8"));
const UA = "RemnantOfPromise-walk/1.0 (info@remnantofpromise.org)";
const OK_LICENSE = /^(pd|cc0|public domain|cc[- ]by)/i;

// curl, not fetch: Node's fetch ignores the Mac's HTTPS_PROXY, curl honors it.
import { execFile } from "node:child_process";
import { promisify } from "node:util";
const run = promisify(execFile);
async function curl(url, { binary = false } = {}) {
  const args = ["-sS", "-L", "--max-time", "60", "-A", UA, "-H", "Accept: application/json", url];
  const { stdout } = await run("curl", args, { encoding: binary ? "buffer" : "utf8", maxBuffer: 64 * 1024 * 1024 });
  return stdout;
}
async function getJSON(url) {
  const t = await curl(url);
  try { return JSON.parse(t); } catch { throw new Error(`bad json from ${url}: ${String(t).slice(0, 120)}`); }
}
// Commons only (Wikipedia is not reachable from the Mac's proxy). The
// species category on Commons holds the photos; its first JPEG that is
// not a map, herbarium sheet, or illustration is the pick. The build
// prints every pick so each can be checked by eye against the entry.
async function leadImageTitle(sci) {
  const cat = `Category:${sci}`;
  const q = `https://commons.wikimedia.org/w/api.php?action=query&list=categorymembers&cmtitle=${encodeURIComponent(cat)}&cmtype=file&cmlimit=50&format=json`;
  const j = await getJSON(q);
  const files = (j.query?.categorymembers ?? []).map((m) => m.title);
  const bad = /map|range|distribution|herbar|illustration|drawing|botanical|plate|seed|\.svg$|\.png$|\.gif$|\.pdf$|\.tif/i;
  const pick = files.find((t) => /\.jpe?g$/i.test(t) && !bad.test(t));
  return pick ?? null;
}
async function commonsInfo(fileTitle) {
  const q = `https://commons.wikimedia.org/w/api.php?action=query&prop=imageinfo&iiprop=url|extmetadata&iiurlwidth=800&format=json&titles=${encodeURIComponent(fileTitle)}`;
  const j = await getJSON(q);
  const page = Object.values(j.query.pages)[0];
  const ii = page?.imageinfo?.[0];
  if (!ii) return null;
  const m = ii.extmetadata ?? {};
  const strip = (s) => String(s ?? "").replace(/<[^>]+>/g, "").trim();
  return {
    thumb: ii.thumburl ?? ii.url,
    source: ii.descriptionurl,
    author: strip(m.Artist?.value),
    license: strip(m.LicenseShortName?.value),
    license_url: strip(m.LicenseUrl?.value),
  };
}

// Hand picks — chosen by title from the Commons category listing where the
// automatic pick was wrong (a lichen for acorns, a butterfly for Turk's cap)
// or the category was empty. Each still passes the license check.
const PICKS = {
  "agarita": "File:Berberis trifoliolata fruit.jpg",
  "elderberry": "File:American elderberry (Sambucus canadensis) (37257156270).jpg",
  "yaupon": "File:Ilex vomitoria (2020).jpg",
  "mayhaw": "File:Crataegus aestivalis NRCS-1.jpg",
  "ground-cherry": "File:Physalis heterophylla - 49926031248.jpg",
  "evening-primrose": "File:Buttercups or Pink primrose -- Oenothera speciosa.jpg",
  "yucca": "File:Spanish Dagger San Antonio.jpg",
  "spiderwort": "File:Tradescantia occidentalis 001 — Matt Lavin.jpg",
  "redbud": "File:Eastern redbud (25139673094).jpg",
  "turks-cap": "File:Malvaviscus arboreus var. drummondii (331692361).jpg",
  "sotol": "File:Dasylirion texanum TX Ft Stockton fh - Kopie.jpg",
  "boxelder": "File:Acer negundo - boxelder - 52356389001.jpg",
  "mulberry": "File:MorusRubra10.jpg",
  "cattail": "File:Southern cattail, Typha domingensis (15657392893).jpg",
  "sunflower": "File:2010 sonnenblume (Helianthus annuus).JPG",
  "maypop": "File:Flickr - ggallice - Purple Passionflower.jpg",
  "farkleberry": "File:Sparkleberry (Vaccinium arboreum) (39069727701).jpg",
  "mesquite": "File:Honey Mesquite - Flickr - treegrow.jpg",
  "pecan": "File:Carya illinoinensis (pecan tree) 1 (24790682337).jpg",
  "muscadine": "File:Muscadines.Scuppernongs.jpg",
  "hackberry": "File:Celtis laevigata fruit.jpg",
  "sumac": "File:Smooth Sumac (2996302655).jpg",
  "mustang-grape": "File:Vitis mustangensis.jpg",
  "common-persimmon": "File:Common persimmon (40146979460).jpg",
  "serviceberry": "File:Amelanchier arborea - Downy Serviceberry.jpg",
  "texas-persimmon": "File:Texas persimmon (38137694922).jpg",
  "acorns": "File:Post Oak (30361656693).jpg",
};
const only = (process.argv.find((a) => a.startsWith("--only=")) ?? "").slice(7).split(",").filter(Boolean);
const onlyLook = (process.argv.find((a) => a.startsWith("--only-look=")) ?? "").slice(12).split("|").filter(Boolean);

const skipped = [];
for (const e of data.entries) {
  if (only.length && !only.includes(e.slug)) continue;
  if (e.photo?.file && !force && !only.length) continue;
  const sci = e.scientific.split(";")[0].trim();
  try {
    const title = PICKS[e.slug] ?? (await leadImageTitle(sci));
    if (!title) { skipped.push(`${e.slug}: no lead image for ${sci}`); continue; }
    const info = await commonsInfo(title);
    if (!info) { skipped.push(`${e.slug}: no commons info for ${title}`); continue; }
    if (!OK_LICENSE.test(info.license)) { skipped.push(`${e.slug}: license '${info.license}' not accepted (${title})`); continue; }
    const buf = await curl(info.thumb, { binary: true });
    if (!buf || buf.length < 2000) { skipped.push(`${e.slug}: thumb download empty`); continue; }
    const file = `${e.slug}.jpg`;
    await writeFile(path.join(outDir, file), buf);
    e.photo = { file, title, author: info.author, license: info.license, license_url: info.license_url, source: info.source };
    console.log(`${e.slug}: ${title} — ${info.license} — ${info.author}`);
    await new Promise((r) => setTimeout(r, 2500)); // Commons rate limit
  } catch (err) {
    skipped.push(`${e.slug}: ${err.message}`);
  }
}
// ---- look-alikes --------------------------------------------------------
// Every look-alike with a scientific name gets its own photo, keyed by that
// name exactly as the entry writes it, saved under img/lookalikes/. Where the
// entry names a genus ("Solanum spp.") the Texas species stands for it.
const LOOK_CATS = {
  "Aesculus spp.": "Aesculus pavia",
  "Agave lechuguilla": "Agave lechuguilla",
  "Ampelopsis arborea": "Ampelopsis arborea",
  "Anagallis (Lysimachia) arvensis": "Anagallis arvensis",
  "Carya texana, Carya ovata": "Carya texana",
  "Cicuta maculata": "Cicuta maculata",
  "Cnidoscolus texanus": "Cnidoscolus texanus",
  "Cocculus carolinus": "Cocculus carolinus",
  "Conium maculatum": "Conium maculatum",
  "Crataegus spp.": "Crataegus crus-galli",
  "Cylindropuntia leptocaulis": "Cylindropuntia leptocaulis",
  "Datura wrightii": "Datura wrightii",
  "Diospyros virginiana": "Diospyros virginiana",
  "Euphorbia maculata and kin": "Euphorbia maculata",
  "Euphorbia spp.": "Euphorbia maculata",
  "Hypochaeris radicata; Pyrrhopappus carolinianus": "Pyrrhopappus carolinianus",
  "Ilex spp.": "Ilex decidua",
  "Iris pseudacorus": "Iris pseudacorus",
  "Lactuca serriola; L. canadensis": "Lactuca serriola",
  "Ligustrum spp.": "Ligustrum sinense",
  "Melia azedarach": "Melia azedarach",
  "Menispermum canadense": "Menispermum canadense",
  "Nothoscordum bivalve": "Nothoscordum bivalve",
  "Nymphaea spp.": "Nymphaea odorata",
  "Parthenocissus quinquefolia": "Parthenocissus quinquefolia",
  "Peltandra virginica": "Peltandra virginica",
  "Phytolacca americana": "Phytolacca americana",
  "Potentilla (Duchesnea) indica": "Potentilla indica",
  "Rubus argutus, R. flagellaris": "Rubus argutus",
  "Solanum americanum": "Solanum americanum",
  "Solanum spp.": "Solanum americanum",
  "Sophora secundiflora": "Dermatophyllum secundiflorum",
  "Toxicodendron radicans": "Toxicodendron radicans",
  "Toxicodendron spp.": "Toxicodendron radicans",
  "Toxicodendron vernix": "Toxicodendron vernix",
  "Toxicoscordion (Zigadenus) nuttallii": "Toxicoscordion nuttallii",
  "Trifolium spp.": "Trifolium repens",
  "Yucca spp.": "Yucca treculeana",
};
const LOOK_PICKS = { // hand picks by scientific key → Commons File: title
  "Cicuta maculata": "File:Cicuta maculata - Water Hemlock.jpg",
  "Yucca spp.": "File:Spanish Dagger San Antonio.jpg",
  "Trifolium spp.": "File:20170503Trifolium repens1.jpg",
  "Iris pseudacorus": "File:Iris pseudacorus Yellow flag iris in Hatfield Broad Oak Essex England 04.jpg",
  "Nothoscordum bivalve": "File:Nothoscordum bivalve (Amaryllidaceae).jpg",
  "Lactuca serriola; L. canadensis": "File:20150603Lactuca serriola1.jpg",
  "Ligustrum spp.": "File:Chinese privet 1.jpg",
  "Cocculus carolinus": "File:Cocculus carolinus Arkansas.jpg",
  "Agave lechuguilla": "File:Agave lechuguilla (5703206931).jpg",
  "Datura wrightii": "File:Datura wrightii 22232954.jpg",
  "Sophora secundiflora": "File:Texas mtn. laurel pod with 5 mescalbeans.jpg",
  "Diospyros virginiana": "File:Common persimmon (40146979460).jpg",
  "Melia azedarach": "File:Melia azedarach - Chinaberrytree 01.jpg",
  "Nymphaea spp.": "File:Flower Daingerfield State Park Texas 2023.jpg",
  "Toxicodendron radicans": "File:Toxicodendron radicans, leaves.jpg",
  "Toxicodendron spp.": "File:Toxicodendron radicans, leaves.jpg",
  "Anagallis (Lysimachia) arvensis": "File:Anagallis arvensis (Flower).jpg",
};
const lookDir = path.join(HERE, "public", "img", "lookalikes");
await mkdir(lookDir, { recursive: true });
data.lookalike_photos = data.lookalike_photos ?? {};
const wanted = new Set();
for (const e of data.entries) for (const l of e.lookalikes ?? []) if (l.scientific) wanted.add(l.scientific);
for (const key of wanted) {
  if (onlyLook.length && !onlyLook.includes(key)) continue;
  if (only.length && !onlyLook.length) continue;
  if (data.lookalike_photos[key]?.file && !force && !process.argv.includes("--lookalikes") && !onlyLook.length) continue;
  const cat = LOOK_CATS[key];
  if (!cat) { skipped.push(`look-alike ${key}: no category mapped`); continue; }
  try {
    const title = LOOK_PICKS[key] ?? (await leadImageTitle(cat));
    if (!title) { skipped.push(`look-alike ${key}: no image in Category:${cat}`); continue; }
    const info = await commonsInfo(title);
    if (!info || !OK_LICENSE.test(info.license)) { skipped.push(`look-alike ${key}: license '${info?.license}' (${title})`); continue; }
    const buf = await curl(info.thumb, { binary: true });
    if (!buf || buf.length < 2000) { skipped.push(`look-alike ${key}: thumb empty`); continue; }
    const file = cat.toLowerCase().replace(/[^a-z0-9]+/g, "-") + ".jpg";
    await writeFile(path.join(lookDir, file), buf);
    data.lookalike_photos[key] = { file, title, author: info.author, license: info.license, license_url: info.license_url, source: info.source };
    console.log(`look-alike ${key}: ${title} — ${info.license} — ${info.author}`);
    await new Promise((r) => setTimeout(r, 2500));
  } catch (err) { skipped.push(`look-alike ${key}: ${err.message}`); }
}

await writeFile(dataPath, JSON.stringify(data, null, 2) + "\n");
if (skipped.length) { console.log("\nNeed a hand pick:"); for (const s of skipped) console.log("  " + s); }
