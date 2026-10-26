# S451 — App feature roadmap (Yoshi: "do it all", 2026-10-16)

Decided in conversation 2026-10-16. Build in this order, one or two per
session, deploy each as it lands (publish-then-edit). Tick as shipped.

## Shipped in S451
- [x] Free / signed-out taste: natural voices in every picker (Michael default), verses 1–5 of any chapter, then the invite. Partners/trial unchanged.
- [x] Dark-mode read-along highlight was invisible (8% blue on black) — fixed.
- [x] Sleep timer (Off / 15 / 30 / 60 min / End of chapter) under the ⚙ button; badge in the player bar.
- [x] Lock-screen / notification controls via Media Session (play, pause, skip verse; chapter as title).

## Open from S452 (2026-10-16 evening)
- [x] Push the site build — 64ddcee is on origin (S453 checked). BUT the /library/ pages come back as the app shell (no verses) on the live site: the Render rewrite problem S452 predicted. Parked with the Google work by Yoshi's word (2026-10-17); fix = the fallback in S452_SESSION_HANDOFF.md.
- [x] **Stripe checkout email prefilled + locked** to the signed-in account (S453: api/subscriptions.py — token email, else users.email). Sign-in form (native shell) now says to use the registered email, and the failed-sign-in message repeats it.

## Content audit (S453 order: Jasher ✓ → Jubilees ✓ staged → Apocrypha → canon KJV → other extras; then cross-refs; voices last)
- [x] Jubilees audited by content (S453): faithful text, 243 merged rows split → 1,307; deploy script staged (S446_SESSION_HANDOFF.md).
- [x] Apocrypha KJV edition audited by content (S454): faithful; Esther 10 split + 3 small fixes staged (deploy script in S446_SESSION_HANDOFF.md).
- [x] apocrypha-charles-vol1 retired (S455): 3 Maccabees verified 228/228 vs Brenton 1851 and moved into pseudepigrapha (ids kept, all cards survive); deploy script _session455_deploy.sh waits on Yoshi (S446_SESSION_HANDOFF.md, S455).
- [x] canon (KJV) — audited S455 (source-texts/kjv-canon-audit/): faithful, 31,102/31,102. Fix BUILT S456 (Psalm titles → chapter_title, Ps 119 acrostic, 14 subscriptions → JSON footnote, Rom 15:30; Amos 3:7 / 1 John 3:4–8 / Ps 81:3 kept as Yoshi's renderings, registered); canon.json fixed in place, re-diffed 0 differ; `_session456_deploy.sh` waits on Yoshi (S446_SESSION_HANDOFF.md S456). Audio for 15 chapters queued (voices lane).
- [ ] Next audits (scorecard row 5): pseudepigrapha (Charles vol 2), adam-eve-conflict, apocalypse-of-abraham, ascension-isaiah, sonnini-acts-29 — after cross-references, by Yoshi's order.

## Pinned — growth (free)
- [x] **The library on Google** (S452): every chapter of every book is a real page at /library/<book>/<n>/ — canon in full, extras as the FIRST PARAGRAPH only (Yoshi 2026-10-16: never the full extras text, on the web or in the app), then the taste → trial. Sitemap + titles like "Enoch 7 — Restored Names Edition". Sitemap still to be submitted in Search Console (steps in S452_SESSION_HANDOFF.md).
- [ ] YouTube read-along videos per book from the existing Michael recordings (text on screen, app links in description).
- [ ] Store listing keywords: Enoch, Jasher, Jubilees, Apocrypha, audio (title/subtitle, not just "Study Bible").
- [ ] Share cards land on a readable web page (verse + chapter + taste), not a dead image.
- [ ] QR code to the app on the About-the-Ministry page in every book.

## Next — audio
- [ ] Hear the names: tap a restored name → pronunciation audio (names_ipa.py + Kokoro; rules in memory topics/name-pronunciation).
- [x] Background play + lock-screen controls in the shells (S453): @capgo/capacitor-media-session (free, MPL-2.0) — Android foreground media service + notification controls, iOS Now Playing; FOREGROUND_SERVICE(_MEDIA_PLAYBACK) permissions added; versions bumped to 1.1.4 (Android versionCode 14, iOS build 15). Needs the store builds uploaded and a phone check (screen off → audio keeps going; controls on lock screen).

## Next — library (what nobody else has)
- [ ] Witness view: canon chapter beside its extras witness (Genesis 6 ↔ Enoch 6 ↔ Jubilees 5; Exodus ↔ Jasher; Jude ↔ Enoch 1). Pairs come from the existing cross-reference threads. Screenshot for the store.
- [ ] Guided threads: ordered reading trails through the whole library (the gathering of the twelve tribes; the Watchers; the order of the end), verses quoted in full, one tap to the next.
- [ ] Red letter for the Formed One: words of Yahusha in the Gospels, and the Tanakh appearances where the One who appeared speaks.
- [ ] **Ask in Yoshi's voice (paid members)** — decided Oct 19 (S459): build the answer bank first with the big model under the voice skill (the few hundred questions people actually ask — Sabbath, Paul and the law, who the Gentiles are, the olive tree, the rapture, the names, Enoch, the cut books, the Trinity, feasts, baptism, hell), Yoshi reviews and redlines each answer like a chapter; serve from the bank with a cheap model that only matches the question and stitches approved answers with the restored verses quoted in full (Come-and-See) — it never reasons about Torah on its own. Unanswered questions get "nothing here yet" and go on Yoshi's list. Cost control: a per-member monthly spend allowance (~$2, shown as a meter, never a dollar figure) rather than a question cap, plus a daily backend ceiling and a rate limit. Sits after cross-references → features in the app order.

## Next — retention
- [ ] Daily verse push notification + home-screen widget.
- [ ] Reading streaks / chapters completed on Today.
- [ ] Sabbath and feast sundown reminders from the existing Calendar (by location).

## Next — conversion
- [ ] First-open tour (3 screens: restored names, the cut books, the voices) ending at the taste.
- [ ] Ratings prompt after the third chapter of listening.

## S470 — The big vision: on par with Logos (IDEA STILL BEING BUILT — nothing here is settled)
Yoshi, 2026-10-25: make this a multi-million-dollar app on par with Logos, with everything already
stored up and approved, not made on prompt by AI. Conversation not finished — continue in a fresh
session before any spec or build.

Working map (general → specific), from the S470 conversation:
1. Original-language layer — Hebrew + Greek under every verse, Strong's, word studies. Open data only
   (STEPBible CC BY, OpenScriptures morphology CC BY, Strong's public domain). Check what the app's
   lexicon already has first.
2. Reference shelves — public-domain works only (Matthew Henry, Gill, Clarke, Barnes, Easton's, Smith's),
   labeled as what they are. Where they carry church teaching, the Caution layer answers them.
3. Yoshi's stored teaching library — sermons, study guides, a companion per book, drafted from his own
   corpus + restored library under the voice skill, approved by Yoshi in batches; readers only ever get
   approved content (same model as "Ask in Yoshi's voice"). Can feed the workbook series.
4. Caution layer ties shelves to corrections (Phase 3 of S463 roadmap).
5. Search across all of it.

Guard raised in S470: copyrighted sermons/study guides online are NOT source material, not even "to
learn from" — legal risk, and against Yoshi's rule that his teaching comes from his library + corpus.
The edge over Logos is not shelf size: it is the restored names, the full extra-book library, the
witness pairs, and one Torah-keeping voice through all of it.

Added in S470 (idea only, not settled) — "Torah in the order it happened":
- A chronological Torah, Genesis through Deuteronomy, as both a reading option in the app and a
  KDP book. Built a book at a time (Genesis, then Exodus...).
- Facing pages like a Stone edition: restored English in event order on one page, the Hebrew
  for the same verses on the other, consonants only (no nikkud).
- Carries the cross-references and end cards.
- Possibly bound right-to-left on KDP, with a left-to-right option as well. Whether KDP takes a
  right-to-left Hebrew paperback still needs checking.
- What's already on disk: the pointed Hebrew (STEPBible TAHOT, CC BY, verse-aligned), so a
  no-nikkud text can be made by stripping the pointing. Also the S211 Arranged Reading spec plus
  _s211_build_chronological_order.py, whose ordering is still waiting on Yoshi's redline.
- Hard part: the order itself is a judgment call (Numbers/Leviticus/Deuteronomy interleave,
  Genesis genealogies). Jubilees and Jasher can help with the dating. The Hebrew is the easy part.

Added in S470 — Yoshi 2026-10-25: "all of it" (the list of what the big paid apps have that we don't).
Taken into the vision; order, scope and price still open:
- End cards stay short; each one opens a full-length teaching behind it. Teachings ship in approved
  batches (the most-asked chapters first) and are the same body of work as the companion per book (item 3).
- People and places pages: who each one was, their family line, every verse they appear in, and a map
  pin. Includes family-line trees from Adam through the twelve tribes, with the Watcher line set apart.
- Passage guide: one screen per verse with the Hebrew/Greek, cross-references, witness texts, teaching,
  people, places and timeline.
- Timeline (ties to the chronological Torah and Arranged Reading).
- Advanced search: Hebrew/Greek root word, word form, phrase, across the extra books too.
- Dictionaries: Easton's, Smith's, ISBE 1915 (public domain), labeled, answered by the Caution layer.
- Notes you can organize and export (a small sermon/study builder for group leaders).
- Group study: shared reading plans and notes for a fellowship.
- Offline download.

Which first (Yoshi 2026-10-25, "sure"): people and places pages with the family-line trees first,
then the passage guide. The rest of the S470 order is still open.

Open questions for the next session (one at a time): free vs paid lines; how many approved pieces before launch of each part.

S471 (2026-10-25 night) — correction: the app ALREADY has its tiers (Free reader / Study Notes $1.99 / Library $4.99 /
Companion $7.49, app/src/routes/Pricing.tsx). The "free vs paid" question is therefore only: which existing tier each
S470 piece lands in (people & places, passage guide, stored teachings, advanced search, chronological Torah), and
whether anything free today moves. Do NOT propose new tiers. Voices stay paid (5-verse free taste) — already decided.
S471 audio: Psalm 23:1 is spoken "Yahuah is my shepherd; I shall not want" (Yoshi) — set in tts/names_ipa.py
SPEECH_FIXES; Ra'ah IPA locked rɑˈʔɑ for all voices. Psalm 23 deleted from af_sky, am_michael, bm_george, am_onyx,
af_heart so the next record_bible.sh run for each voice redoes it, then upload. Sky preview.mp3 remade with the fix.
Other compound-name verses (Gen 22:14, Ex 17:15, Judg 6:24, Jer 23:6, Ezek 48:35) are true names — audio is fine
as is. Ex 15:26 "for I am Yahuah Rapha" loses "that healeth thee" — not yet asked.

SETTLED (Yoshi 2026-10-25): natural voices unlock at the FIRST paid tier (Study Notes). Because the extra-canonical
books are Library (2nd tier), their audio unlocks with them — Study Notes hears the canon, Library hears the canon
plus the extras. Matches the code today (App.tsx hwEntitled = any paid tier or trial), so no change needed.
SETTLED (Yoshi 2026-10-25): people & places pages + family-line trees → Study Notes.
SETTLED (Yoshi 2026-10-25, "sure"): tier principle — everyone should end up on Companion, but the lower tiers must
be genuinely reasonable, not a sham. Passage guide = ONE screen per verse, rows unlocking by tier, visible to all:
  Study Notes: Hebrew/Greek, cross-references, people, places, timeline.
  Library:     + witness texts from the extra books, in the same screen.
  Companion:   + the full stored teaching behind the verse.
A Study Notes reader sees the two locked rows on every verse — the guide sells the upgrade itself.
Stored teaching library and advanced (Hebrew/Greek root) search → Companion.
SETTLED (Yoshi 2026-10-25): chronological Torah reading option → Study Notes (canon text, Hebrew facing);
the Jubilees/Jasher dating notes in it show for Library.
Tier placement is now closed for every S470 piece. Still open: how many approved pieces before each part launches.


S471 (2026-10-25, cut short — switching model): Sky preview.mp3 made. Ra'ah locked as rɑˈʔɑ (rah-AH) for all
voices. REDO batch: Psalm 23 in af_sky, am_michael, bm_george, am_onyx, af_heart (old Ra'ah); same batch to fix
compound-name verses that drop their meaning in audio (Ps 23:1 says "Yahuah Ra'ah; I shall not want" — no
"is my shepherd"; check Gen 22:14, Ex 15:26, Ex 17:15, Jer 23:6, Ezek 48:35). Open: say name then meaning?
Free vs paid: Yoshi believes three tiers already exist — LOOK IT UP in the code/docs before proposing anything.
