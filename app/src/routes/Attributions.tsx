/**
 * S196 — Attributions / data-credits surface. Lives at `/attributions`.
 *
 * Top-level route handled by App.tsx's pathname switch alongside /pricing,
 * /manage, /sign-in, /settings. Credits every public-domain + open-licensed
 * data source the study tooling ships, with the license each requires honored
 * in attribution (CC-BY and ODbL both require credit; the openbible.info place
 * data, OpenStreetMap-derived geometry, BradyStephenson's Nave's compilation,
 * and STEPBible's tagged/lexicon data are all attribution-required).
 *
 * No tier gate — attribution is shown to every reader. localStorage-free,
 * reader-surface single column, matching the Settings page register.
 */

interface Credit {
  tool: string;
  source: string;
  url: string;
  license: string;
  note: string;
}

const CREDITS: Credit[] = [
  {
    tool: "Maps — place identifications & coordinates",
    source: "OpenBible.info Bible Geocoding Data",
    url: "https://www.openbible.info/geo/",
    license: "CC-BY 4.0",
    note:
      "Ancient + modern place identifications and coordinates. Tiles are rendered " +
      "by this app from the coordinate data; no third-party atlas imagery is used.",
  },
  {
    tool: "Maps — place geometry (rivers, regions)",
    source: "OpenStreetMap contributors",
    url: "https://www.openstreetmap.org/copyright",
    license: "ODbL 1.0",
    note:
      "Geographic geometry derived from OpenStreetMap, used where region and " +
      "watercourse shapes are drawn. © OpenStreetMap contributors.",
  },
  {
    tool: "Nave's Topical Bible",
    source: "Orville J. Nave (1897), compiled by Brady Stephenson",
    url: "https://github.com/BradyStephenson/bible-data",
    license: "CC-BY 4.0 (compilation)",
    note:
      "Underlying Nave's text is public domain (1897); the machine-readable " +
      "compilation is by Brady Stephenson. Shown as a clearly-subordinate inherited foil.",
  },
  {
    tool: "Interlinear, Nikkudot & Greek lexicon (LSJ)",
    source: "STEPBible (Tyndale House, Cambridge)",
    url: "https://github.com/STEPBible/STEPBible-Data",
    license: "CC-BY 4.0",
    note:
      "TAHOT / TAGNT tagged Hebrew + Greek (Strong's-aligned lemma, transliteration, " +
      "morphology, vowel-pointing) and the TFLSJ formatted LSJ lexicon. Reformatted " +
      "into this app's database as the licence permits.",
  },
  {
    tool: "BDB Hebrew lexicon & Strong's",
    source: "OpenScriptures (Brown-Driver-Briggs 1906; Strong's 1890)",
    url: "https://github.com/openscriptures/HebrewLexicon",
    license: "Public domain",
    note: "Brown-Driver-Briggs Hebrew lexicon and Strong's Hebrew/Greek dictionaries.",
  },
  {
    tool: "Vincent's Word Studies",
    source: "Marvin R. Vincent (1887–1900)",
    url: "https://archive.org/details/cu31924092322522",
    license: "Public domain",
    note: "Word Studies in the New Testament. Author d. 1922; pre-1929 publication.",
  },
  {
    tool: "Treasury of Scripture Knowledge (TSK)",
    source: "R.A. Torrey; cross-reference set via OpenBible.info",
    url: "https://www.openbible.info/labs/cross-references/",
    license: "CC-BY (compilation); TSK public domain",
    note:
      "Standalone, opt-in reference set shown as a clearly-subordinate inherited foil.",
  },
];

export default function Attributions() {
  return (
    <div className="min-h-screen bg-[var(--reader-bg)] px-4 py-8 text-[var(--reader-text)]">
      <div className="mx-auto max-w-2xl">
        <a
          href="/read"
          className="text-sm text-[var(--reader-accent)] hover:underline"
        >
          ← Back to the reader
        </a>
        <h1 className="mt-4 text-2xl font-semibold">Attributions &amp; data sources</h1>
        <p className="mt-2 text-sm leading-relaxed text-[var(--reader-muted)]">
          The Remnant of Promise Study Bible builds its study tooling from public-domain
          and openly-licensed data. Every source below is credited as its licence
          requires. The framework reading is the app&rsquo;s own; these are the inherited
          reference bases it reads through the framework.
        </p>

        <div className="mt-6 space-y-4">
          {CREDITS.map((c) => (
            <section
              key={c.tool}
              className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4"
            >
              <div className="flex items-baseline justify-between gap-3">
                <h2 className="text-sm font-semibold">{c.tool}</h2>
                <span className="shrink-0 rounded border border-[var(--reader-rule)] px-2 py-0.5 text-[11px] tracking-wide text-[var(--reader-muted)]">
                  {c.license}
                </span>
              </div>
              <p className="mt-1.5 text-sm text-[var(--reader-text)]">{c.source}</p>
              <p className="mt-1 text-xs leading-relaxed text-[var(--reader-muted)]">
                {c.note}
              </p>
              <a
                href={c.url}
                target="_blank"
                rel="noopener noreferrer"
                className="mt-2 inline-block text-xs text-[var(--reader-accent)] hover:underline"
              >
                {c.url}
              </a>
            </section>
          ))}
        </div>

        <p className="mt-6 text-xs leading-relaxed text-[var(--reader-muted)]">
          KJV base text (1769 Blayney) and all extra-canonical translations ship from
          public-domain editions. The restored Sacred Names editions, the framework
          commentary, and the annotation layer are the work of Remnant of Promise.
        </p>
      </div>
    </div>
  );
}
