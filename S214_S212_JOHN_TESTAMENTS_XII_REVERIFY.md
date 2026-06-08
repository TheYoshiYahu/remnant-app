# S214 — Re-verify the S212 John 13–17 Testaments XII xref rows against clean Charles text

**Goal (per `SESSION212_CLOSE.md`):** re-verify the S212 John 13–17 Testaments XII
cross-ref rows against the re-parsed (clean) text and fix any that shifted.

**Method:** extracted the **clean** Charles 1913 Testaments XII body text directly
from `~/Downloads/charles-1913-vol2.pdf` with a layout-aware pdfplumber pass that
drops the footnote apparatus by font-size + bottom-of-page position (the original
pypdf parse was coordinate-blind, which is why the apparatus bled into the verses).
Then searched the clean body (210,288 chars, apparatus-free) for each shipped
quote.

## Result — all 7 cited quotes are faithfully present in clean Charles. No fabrications.

| John src | Testaments XII (DB ch:v / patriarch) | Shipped quote (key phrase) | In clean Charles? |
|---|---|---|---|
| 13:34 | 62:2 — Gad | *love one another in deed, and in word, and in the inclination of the soul* | ✅ verbatim |
| 15:12 | 63:7 — Gad | *love one another with uprightness of heart* | ✅ verbatim |
| 15:13 | 89:5 — Benjamin | *…loveth as his own soul* | ✅ verbatim |
| 15:18 | 61:1 — Gad | *…maketh small things to be great…* | ✅ verbatim |
| 15:23 | 61:2 — Gad | *drive forth hatred, which is of the devil* | ✅ verbatim |
| 16:8 | 35:5 — Judah | *the spirit of truth testifieth all things, and accuseth all; and the sinner is burnt up by his own heart* | ✅ present\* |
| 14:17 | 35:4 — Judah | *on the heart itself have they been written down before the Lord* | ✅ present\* |

\* Present with two cosmetic differences only, both expected: (a) Charles wraps
phrases the S212 rows quote bare in MS-variant single-quotes — clean text reads
*burnt up ‘by his own heart’* and *‘before the Lord’*; (b) a marginal verse
marker sits inside the run.

**The S212 fix held.** The one fabricated quote `SESSION212_CLOSE.md` flagged
(Test. Gad 62:2) is now textually faithful — *love one another in deed, and in
word, and in the inclination of the soul* matches the clean source verbatim.

## One verse-boundary nuance to reconcile (Judah 35:4 / 35:5)

In the clean text the passage runs:

> …there is no time at which the works of men can be hid; for on the heart itself
> have they been **[5]** written down ‘before the Lord’. And the spirit of truth
> testifieth all things, and accuseth all; and the sinner is burnt up ‘by his own
> heart’…

The verse-**5** marker falls at *written down before the Lord*, which places
*written down before the Lord* at the **head of v.5**, not the tail of v.4. The
S212 rows assign *on the heart itself have they been written down before the
Lord* to **35:4**. The content and the thread reading are unaffected (both
clauses sit inside the same Judah spirit-of-truth pericope), but when the full
clean re-parse lands and Testaments XII is renumbered, the `35:4` row's target
verse should be reconciled to wherever *written down before the Lord* lands under
the clean versification (likely 35:5). Flagged, not yet changed — the precise new
verse id comes from the completed re-parse.

## Status of the full re-parse (Task 1)

- **Approach proven.** The layout-aware extraction cleanly removes the footnote
  apparatus that flat pypdf could not — sentences are intact, no `Cf.`/`MSS`/Greek
  apparatus in the body. This is the faithful fix (same Charles translation +
  versification).
- **Two residual challenges before a production swap:** (1) Charles prints some
  Testaments XII poetic sections as **parallel recensions in two columns**; OCR
  merges them left-to-right and they need de-interleaving (e.g., the Test. Simeon
  6 "Restored Text" parallel). (2) Charles's **compact verse/chapter markers**
  (`71,2`, `48,1`, marginal numbers fused to the first word like `6a wife`) need
  reconstruction, ideally numbered off the running-header chapter ranges.
- **Recommended verification gate before swapping the production JSON and
  re-pointing any xref verse ids:** cross-check the re-parsed verse boundaries
  against CCEL's clean Charles text (reachable via the connected browser; CCEL's
  reader is JavaScript-rendered so plain web-fetch returns an empty shell). The
  fidelity stakes (xref rows resolve by verse id) make a verified renumber worth
  the gate rather than a blind auto-swap.
