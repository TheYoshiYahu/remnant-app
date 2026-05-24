# S130 — Additive-marker content pass + S129 ship verification

S129 shipped the render path. S130 is the content pass + the post-deploy walk.

1. **Walk every commentary source and insert `<!-- additive-from-here -->` markers.** The S129 reader fix added marker support but no file carries one yet, so the duplicate-prose UX is still live until the markers land. Per chapter: open `commentaries/matthew-N-short.md` and `commentaries/matthew-N.md`, find where the recap ends and the new-content tail begins, drop the marker on its own line. 28 chapters × 2 files = 56 marker insertions. Document the convention in `DESIGN_LANGUAGE.md` §9 so future commentary authors know to honor it.

2. **Ship-walk the S129 deploys.** PWA: confirm the Render Static Site rebuilt, bible.remnantofpromise.org/ serves the new Landing surface, /read drops cleanly into the Reader with the saved reading position rehydrated, /pricing + /manage + /sign-in still resolve. Mobile breakpoint check on the brand-mark (200px clamp) + CTA. WP: confirm theme 1.0.9 picked up, WPE cache purged, fallback nav shows the new label, hero CTA shows the new label, content-import.xml re-import (if Yoshi ran it) carries the new label too. Static-site deploy: confirm the new hero CTA + nav link render.

3. **Pre-existing lint debt on `ChapterCommentary.tsx` + `App.tsx`** (10 errors surfaced by S129's lint run, all `react-hooks/set-state-in-effect` on long-standing useEffects). Triage: silence with comments where the effect is doing its job correctly (chapter-load reset effects); refactor where the effect is genuinely cascading. Out of scope for S129 since none were introduced by the wheel.

**Out of scope:** v4 color tuning, scripture-page argaman underlines, app hide-apparatus toggle, BuddyPress structural changes, marketing-copy edits beyond the landing-page frame.

**Safety:** content pass is markdown-edit only (no API/db touch). Marker insertions are reversible per-chapter; backward-compat in the render path means partial coverage just leaves un-marked chapters at current behavior.
