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
  pin. Includes family-line trees from Adam through the twelve tribes. CORRECTED S471 (Yoshi): NO "Watcher line"
  in the trees — the tares are sown in with the wheat and exist today even within the seed of promise, so marking a
  line as Watcher-descended would be a guess and would cross a line. Do the Adam line; other related lines (Cain,
  Ishmael, Esau, Lot, etc.) may be drawn as scripture gives them, but never label any line "Watcher."
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
LAUNCH GATE — people & places (Yoshi 2026-10-25): these are checkable facts, not approval batches. Verse
occurrences, genealogies and place pins are verified against the app's own library text (pins also against an open
CC BY geocoding set); extra-book people (Enoch, Jasher, Jubilees names) are checked against the text only. Launch a
book once it is verified. Only the short "who this was" blurbs carry the voice and come to Yoshi, in batches.
Still open: launch gate for the passage guide and the stored teachings.


S471 (2026-10-25, cut short — switching model): Sky preview.mp3 made. Ra'ah locked as rɑˈʔɑ (rah-AH) for all
voices. REDO batch: Psalm 23 in af_sky, am_michael, bm_george, am_onyx, af_heart (old Ra'ah); same batch to fix
compound-name verses that drop their meaning in audio (Ps 23:1 says "Yahuah Ra'ah; I shall not want" — no
"is my shepherd"; check Gen 22:14, Ex 15:26, Ex 17:15, Jer 23:6, Ezek 48:35). Open: say name then meaning?
Free vs paid: Yoshi believes three tiers already exist — LOOK IT UP in the code/docs before proposing anything.

S472 (2026-10-25) — STORE BILLING, SETTLED (Yoshi): build it together with the offline store release
(enrollment, bank/tax setup in App Store Connect + Play Console happen then).
- Two doors on the purchase screen: Apple/Google in-app purchase AND the website (Stripe). Existing tiers only.
- Account required before upgrading (plain email sign-up; no "Sign in with Apple", so emails stay real).
  Store purchase carries the account ID (Apple appAccountToken / Google obfuscatedAccountId); server sets the
  tier from store notifications so it follows the person to the web (RevenueCat or direct — decide at build).
- Store prices (monthly; assumes 15% cut — enroll in Apple Small Business Program first):
  Study Notes $1.99 (unchanged), Library $5.49 (+50¢), Companion $8.49 (+$1). Web prices unchanged.
- Coupons stay Stripe/web. US users (store-region check): coupon line with a working link to the website.
  Outside the US: no coupon line in the app (anti-steering, wording doesn't matter); coupons go out by email /
  social / books with the web link. Store offer codes (Apple) / promo codes (Google) possible later.
- Google: enroll in the US external-links program in Play Console for the US link. Check current fees then
  (sources disagreed: 0% vs 10% service fee on link-outs).
- Keep the neutral "manage your account" line in account settings.
- Why: one-tap store checkout converts better; store sales count toward Top Grossing charts.
- Cleanup noted: stray app/src/lib/"native-shell 2.ts" duplicate → _to_delete when in the code.

S472 (2026-10-25/26) — PEOPLE & PLACES BUILT (Study Notes), waiting on Yoshi's deploy run + push.
- Data: STEPBible TIPNR (CC BY 4.0) for who-is-who, family links, Hebrew/Greek forms; OpenBible pins.
  TIPNR's own descriptions (AI-written, church framing) are NOT used anywhere. blurb column empty until
  Yoshi approves "who this was" notes in batches.
- Verified against the live app text (audio-text/canon_live.json, pulled Oct 13): 3,955 people/places ship;
  24,572 of 29,965 verse occurrences confirmed; 8,427 family links; 474 map pins (TIPNR and OpenBible agree
  within 30 km). Full held list: people-places/S472_VERIFY_REPORT.md. Rebuild: python3 _s472_people_places_build.py
- Framework holds built in: Joseph is never drawn as father of Yahusha (Luke 3:23 "as was supposed");
  Arimathaea not merged into Mizpah; tribe/nation usages ("Levite", "Jews", the people Israel, "children of
  Israel") kept OFF the pages of Jacob and his sons — their pages show only where the man himself is in view
  (4,429 such verses held). Family links across verses only count inside genealogy chapters.
- Restored display names: Yahusha (Jesus), Yashar'el (Israel), Yahudah (Judah), Melek Tsadiq, Messiah (Christ).
- App: verse menu → "People & places" (Study Notes+; locked stub below). Sheet: who/where the verse names,
  search, person page (names, Hebrew/Greek, family chips, father line back to Adam where the text confirms,
  every verse tap-to-go), place page with a small map of nearby confirmed places. New Features entry added.
- Deploy: bash _session472_people_places_deploy.sh (loads DB, reads back, commits; stages only the S472 lines
  of App.tsx so the S470 offline work stays uncommitted) → then Yoshi runs git push.
NEXT for this feature: (1) tribe & nation pages (the twelve tribes, Yashar'el as a people, Yahudah/Yahudim,
  the nations) — the held 4,429 verses land there; (2) extra-book people (Enoch, Jubilees, Jasher) checked
  against the text only; (3) blurb batches for Yoshi, most-named people first; (4) the 130 Psalm-title
  references (the app has no Psalm titles) and 834 name-not-found verses — mostly spelling forms, review list.
Then the passage guide (one screen per verse, rows by tier).

S473 (2026-10-26) — TRIBE & NATION PAGES BUILT (Study Notes), waiting on Yoshi's deploy run + push.
- S472 confirmed pushed at session open (local main = origin/main at dd258f7).
- Builder: python3 _s473_tribes_nations_build.py (runs the S472 builder in-process, then adds the pages;
  this is now THE rebuild for people & places — it writes people_places.json and session473_people_places.sql,
  a full rebuild that supersedes the S472 migration). Report: people-places/S473_TRIBES_NATIONS_REPORT.md.
- 36 pages: Yashar'el (Israel) as a people; 14 tribes (Reuben, Simeon, Levi, Yahudah, Dan, Naphtali, Gad,
  Asher, Issachar, Zebulun, Joseph, Ephraim, Manasseh, Benjamin); 21 named nations (Egyptians, Canaanites,
  Hittites, Moabites, Ammonites, Edomites, Philistines, Midianites, Amalekites, Ishmaelites, Syrians,
  Assyrians, Chaldeans, Babylonians, Persians, Medes, Greeks, Romans, Samaritans, Ethiopians, Arabians).
  The S472 people-groups (Amorites, Jebusites, Hivites...) join the browse list.
- 4,414 of the 4,427 S472-held verses now have a page (13 left: Bethlehem-judah, Ephrathite, Ashurites,
  two Psalm titles — listed in the report). Every verse checked: it must carry the tribe's or nation's name.
- Sections on each page are the words the verse uses (children of / house of / tribe of / Levites /
  Yahudim (Jews) / kings of / land and cities of / Jacob as the people's name / Jeshurun). Nothing interpreted.
- Fixes to S472 found on the way: Javan's page carried Paul's "Greeks" and "Gentiles" (TIPNR folds them into
  the man) — cleared; Greeks go to the Greeks page. Jacob's page got back 36 verses where the man is named
  ("Abraham, Isaac, and Jacob"; 1 Sam 12:8; Josh 24:4,32; Ps 105:23; Mal 1:2, Rom 9:13 on both).
  The sons' pages got back "the son of Levi", "the bones of Joseph", family-list verses (69, kept on the
  tribe page too). 45 verses spelled with æ (Judæa, Cæsarea, Tiberius Cæsar...) S472 had missed — now on.
  Judea's page was showing as "Galilee" — fixed, and 6 Galilee-only verses taken off it. 794 verses that name
  a people but not its land ("the Egyptians", "the Philistines") moved from the place page to the people page.
- App: People & places sheet gets "Browse the tribes and peoples"; tribe/nation pages show verses in
  collapsible sections; a man's page shows "The people called by his name", nations show "Their land".
  New Features entry "tribes-nations". Typecheck clean.
- HELD for Yoshi (not on any page): "Gentiles" / "heathen" / "nations" verses — 6 Gentile verses came off
  Javan's page and sit nowhere. Open question: does "Gentiles" get a page at all, and if so where.
- Noticed, not fixed: S472 entry eznites-2sa-23-8 shows as "spear" (TIPNR quirk) — fix in a later pass.
- Deploy: bash _session473_tribes_nations_deploy.sh → then Yoshi runs git push.
NEXT for this feature: extra-book people (Enoch, Jubilees, Jasher), then blurb batches, then the passage guide.
S473 — VOICES: splice instead of full re-record (Yoshi's idea, 2026-10-26). Michael (am_michael) and Olivia
(af_heart) were recorded before the names were settled by ear. Instead of re-recording every chapter,
tts/splice_names.py re-speaks only the verses that carry a name (and the chapter heading if it does) and
swaps them into the existing chapter mp3 using the verse marks in its .json; marks after are shifted.
~15,800 of 48,267 verses (a third of the audio); 2,064 of 2,269 chapter files change.
Tested in the cloud on Psalm 1 and 117 against a fresh full recording: marks agree within 0.01 s, every verse
matches (0.97–1.00), untouched verses are the original recording. Originals kept in audio/_redo/<voice>/s473-splice.
Run: bash ~/Desktop/App/tts/record_splice.sh am_michael af_heart  (resumable) → node _s444_upload_audio.mjs
(upload re-sends any file whose size changed). Listen test first: splice_names.py <voice> --test psalms/1 →
audio/_splice_test/<voice>/ (before/after). Chapters whose timing file doesn't match the text are skipped and
listed in audio/<voice>/.splice-skipped-s473.txt.
S473 — MICHAEL REMOVED (Yoshi 2026-10-26: "I hate Michael's voice"). Gone from the picker (recordedAudio.ts);
Olivia (af_heart) is now the default and first in the list; record scripts no longer default to am_michael.
Readers who had Michael saved fall back to the default. Michael's files stay in R2 and audio/ until Yoshi says
to delete them. A replacement male voice is being picked: samples of am_echo, am_adam, am_eric, am_fenrir,
am_liam, am_puck, bm_daniel, bm_lewis, bm_fable sent (Psalm 1:1-2, Deut 6:4, John 3:3). Note: George (16
chapters) and Ivan (2) are barely recorded — Olivia is the only complete voice right now.
The splice now only matters for Olivia: bash tts/record_splice.sh af_heart.
IDEA (Yoshi, not started): YouTube audiobook readings from the recorded voices. Rights are fine (Kokoro is
Apache-2.0, the text is his edition). Ad money is the risk: YouTube's July 2025 "inauthentic content" rule
demonetizes mass-produced AI-voice uploads; his own human input on each video (spoken intro, on-screen text)
is what keeps it monetizable.
S473 — REPLACEMENT VOICE, still open. Yoshi heard 9 male Kokoro voices, then 4 American voices with British
speech rules (lang en-gb), then Liam+Echo blends (70/30, 50/50, 30/70, 50/50 British) — style vectors mixed in
kokoro_onnx, names tuned on Echo applied. No pick yet.
NEW IDEA (Yoshi): his OWN voice. Kokoro can't learn a voice. Chatterbox (Resemble AI, MIT, free, runs locally)
clones from a recording. Next step: Yoshi records 1–2 minutes (quiet room, phone close) reading Psalm 1 + verses
with Yahuah / Yahusha / Yashar'el / Elohim, attaches it; Claude builds the same Psalm 1 test passage in his voice.
Measure speed on one chapter before promising a full-library run (Chatterbox is much heavier than Kokoro).
Yoshi (00:45): Liam+Echo blends liam30-echo70 and liam50-echo50 are "pretty good" — the front-runners. The blend is
style = w*am_liam + (1-w)*am_echo (kokoro get_voice_style), am_echo's IPA overrides, lang en-us. record_bible.sh /
gen_bible.py take a voice name only — a blend needs a small change (new voice id, e.g. "liam_echo", mapped to the mix).
S474 (2026-10-26) — VOICES.
- S473 push confirmed at session open (origin/main = b356d31).
- Blends now record: tts/names_ipa.py has BLENDS (liam30_echo70, liam40_echo60, liam50_echo50 — style mix of
  am_liam + am_echo, Echo's settled names, en-us). gen_bible.py and splice_names.py take a blend id like any voice:
  bash tts/record_bible.sh liam30_echo70. Tested on Psalm 117. Samples of all three sent (Psalm 1, Ps 23:1, Deut 6:4,
  John 3:3, names roll) — tts/blend_sample.py remakes them. Yoshi's pick: still open.
- Olivia splice: --test on Psalm 1 sent (vv. 2 and 6 re-spoken); Yoshi started record_splice.sh af_heart (01:40),
  stopping the Sky recording to do it — restart Sky after with bash tts/record_bible.sh af_sky (resumable).
- Noticed: chapters_all.json keeps the English bracket after restored names in 1,713 verses, so the recordings say
  it aloud ("Yahuah Eloheinu, the LORD our God, is one Yahuah"). Yoshi to decide whether that stays.
- His own voice: Chatterbox clone built in the cloud from voice-clone/yoshi-normal-take1.m4a (first 13 s as the
  reference). Names respelled for it (it can't take IPA): Ee-ah-oo-ah, Ee-ah-oo-sha, Yah-shar-el, El-oh-heem...
  First cut saved: voice-clone/yoshi-clone-psalm1.mp3. Speed: 1 min 48 s of audio took ~20 min on 2 cloud CPUs —
  far too slow for the whole library on CPU; a full run would need a GPU. Allowlist now has huggingface.co, *.hf.co,
  download.pytorch.org (Yoshi added 01:39).
- Yoshi on the clone (02:07): "sounds nothing like me" (not bad, but not him); ordinary words decent; sacred and
  Hebrew names butchered. Chatterbox reads spelled-out text only, so the names can't be set the way Kokoro's are.
  Cut B (other reference stretch) stopped. Whether to keep trying his own voice: open, his call.
- Second route tried (02:10): Kokoro reads (blend liam30_echo70, names as settled), then Chatterbox's voice
  converter (chatterbox.vc) turns that voice into Yoshi's (reference = first 13 s of his take). Sample:
  voice-clone/yoshi-voice-from-blend.mp3. Speed: 74 s of audio in ~6 min on 2 cloud CPUs. Waiting on his ear.
- Yoshi (02:16): the voice-converter route is "much better." He noticed it raised his pitch, so he recorded
  Desktop/"a deeper version.m4a" (19 s) → voice-clone/yoshi-deeper-from-blend.mp3. KEEP the normal take too —
  "we may use it as one of my voices." Fun clips (Desktop: just for fun / even funnier / morgan rediculous claude)
  converted too → voice-clone/*-claude-voice.mp3. Clips that go in are untouched on his Desktop.
- Note for scripting: the converter keeps the SOURCE reading's rhythm and pitch shape (Kokoro's); the clip gives
  only the voice. Singing into the clip won't make it sing. To sing scripture, sing the source and convert that.
- To make each sample: cloud venv with chatterbox-tts (torch 2.6 CPU, setuptools<81 for perth), vc.py
  <source.wav> <ref.wav> <out.wav>. Load-once multi-ref runs died after the first file — run one at a time.
- Yoshi (11:16) kept three samples: voice-clone/yoshi-clone-psalm1.mp3, morgan-ridiculous-claude-voice.mp3,
  yoshi-deeper-from-blend.mp3. Deleted the other samples. All his recordings (.m4a) kept.
S475 (2026-10-26) — VOICES.
- Olivia splice (record_splice.sh af_heart) still running at 11:26: 1,311 of ~2,064 chapters done (in Jubilees),
  ~200 chapters/hour, so about 3.5–4 hours left. After "All done": Yoshi runs node _s444_upload_audio.mjs, then
  restarts Sky with bash tts/record_bible.sh af_sky.
- Yoshi's pick for the male voice: liam50_echo50 (50/50 Liam+Echo). Next is tuning the names by ear on that
  blend, then recording it (bash tts/record_bible.sh liam50_echo50). Don't start it while the splice is running.
- Yoshi's own voice: BOTH takes, as two voices (the normal take and the deeper take). Still open: the speed of a
  full run. The converter took ~6 min for 74 s on 2 CPUs, and two voices doubles the work, so a GPU is needed.
- EXTRA-BOOK PEOPLE, pass 1 (built, NOT in the app or DB yet): _s475_extra_people_build.py →
  people-places/s475_extra_people.json + S475_EXTRA_PEOPLE_REPORT.md. 1 Enoch, 2 Enoch, Jubilees, Jasher.
  6,347 verse occurrences linked to 283 canon people; 1,163 held (100 names) with reasons; 791 raw extra-only words.
  Rule: a name links only when exactly one person by that name stands in the canon era the book covers
  (Enoch books: Genesis 1–11; Jubilees: Genesis–Exodus; Jasher: Genesis–Judges 2). Shared names settle by family
  names in the verse → chapter → two chapters either side → (Enoch books only) the book itself, by count.
  Person/place names (Shechem, Hebron, Adam...) link only when the verse settles it, or when the name is mostly a
  person in the canon and the verse has no place wording. 1 Enoch's title "that/the Son of Adam" (46–48) is
  never linked to Adam the man (Red Line 12). Spot-check of 12 links: all right.
  Held, correctly: Pharaoh (several kings), Canaan/Moab/Seir/Cush/Midian (lands and peoples), Eliezer in Jasher
  (Abraham's servant has no family on file to settle him), 7 Jubilees "Enoch" verses (44:11 is Reuben's son).
  Per-verse fix: Jasher 5:1 "Enoch the son of Seth … 905 years" → Enosh. FLAG for Yoshi: check whether Jasher 5:1
  in his edition should read Enosh (Gen 5:11 gives Enosh 905 years); not changed in the text.
- Open question for Yoshi: angels (Michael, Gabriel, Uriel, Raphael) — Michael is held because the canon only has
  him in Daniel/Jude/Revelation, outside the era. Angels likely need their own rule (not era-bound).
NEXT (S476): sort the 791 extra-only words into real people / places / ordinary words (Jasher's kings and
  generals — Angeas, Rikayon, Zelicah, Kikianus, Latinus, Turnus, Azdrubal, Niblos; watchers and angels), then
  the app/DB step for the links, then blurb batches, then the passage guide. Olivia splice upload + Sky restart
  if not done; tune names on liam50_echo50; GPU plan for Yoshi's two voices.
- Yoshi (11:56): FREE ONLY for his own voice — no money for paid/rented services (he stressed "free" from the start).
  He'll record ~30 min if it sounds more like him. Route: train a fast reader on his voice on a free GPU
  (Kaggle/Colab), then record on his Mac. Chatterbox full-library conversion is dropped as too heavy.
- REVIEW of S471–S475 (Opus sessions) against the files, S475 on Fable: commits and deploys match the notes (S472
  people & places, S473 tribes/nations + Michael removed, three S473 commits all pushed); the 35 changed verses in
  tts/chapters_all.json are the approved S456 canon fix (Ps 119 letters, 14 epistle subscriptions); S474's blend
  code is sound (uncommitted with the S470 offline work). ONE REAL BUG FOUND: the "bracket" note was a strip-list
  gap, not a decision — app/src/lib/stripParentheticals.ts lacked "(the Lord)", possessives "(Lord's)" "(God's)",
  "(most high God)", "(Lord Jesus Christ)" etc., so 835 verses (722 in Jasher) were SPOKEN with the English bracket.
  Fixed: list extended (typecheck clean; the reader's hide-brackets toggle gains the same forms), chapters_all.json
  spoken text regenerated. The running Olivia splice loaded the old text (77 Jasher chapters already done), so after
  "All done" Yoshi runs: bash tts/redo_bracket_chapters.sh af_heart (drops the 270 affected chapters from the
  done-list and splices them again), then upload. Sky and George need the same redo later. Still uncommitted.
- S475 (Fable) BUILT, uncommitted: voice picker BEFORE the first play of each app open (Yoshi's idea) — App.tsx
  startPlaybackAsking / handleVoiceAskPick / voiceAskStart effect; VoicePickerModal exported from AudioPlayer.tsx.
  Top ▶ and "Play from here" ask once per app open; skips and chapter auto-advance never ask. Typecheck clean.
- BUG (Yoshi, 2026-10-26): the spoken-verse highlight does not carry into the next chapter on auto-advance; the
  audio keeps reading. Not found by reading; needs a live test. Look first at (1) queueChapterFromVerse: speak()
  is called BEFORE the onStart/onEnd handlers are subscribed, so a run that starts synchronously is missed;
  (2) the recorded engine's prefetched next-chapter run and which handlers are live when it starts.
- IDEA (Yoshi): a modern version in the app. NIV/ESV/NLT need publisher licenses (not free). The Berean Standard
  Bible (public domain 2023) and World English Bible (public domain) can take the restored names through the
  existing pipeline. Claude's verdict: restore the Berean rather than hand-modernize the KJV; needs the S455-style
  audit of translation choices against the settled principles first, and audio later. Not decided by Yoshi yet.
- APPROVED (Yoshi, 2026-10-26 14:28): BUILD the Restored-Name Berean as a second canon edition. Berean Standard
  Bible is public domain (berean.bible/licensing.htm, April 30 2023; derivatives for commercial use allowed).
  Source: ebible.org engbsb. Yoshi read Ps 23, Matt 5:17–19, Gal 3 side by side and approved.
  Order of work: (1) marks saved by reference (book/chapter/verse) added BESIDE verse_id — existing rows untouched,
  run on a DB copy first, counts before/after; whole-verse highlights, bookmarks, notes, reading place cross over;
  word/phrase highlights carried by matching the words in the other edition, else whole verse + a per-verse note
  "carried over from the other edition — may need adjusting", plus a one-time message on first edition switch.
  (2) Edition picker: "Restored King James" / "Restored Berean"; canon books open in the chosen edition.
  (3) Restore the names on the Berean with the existing pipeline; then the S455-style audit of translation choices
  against the settled principles. Flags already seen: Matt 5:17 "abolish" (KJV "destroy"); Gal 3:10 "rely on works
  of the law" ("rely" is not in the Greek); Gal 3:23 "held in custody / locked up". Keep "Gentiles" where it stands.
  (4) Audio: Berean ships text-first. Until its recordings exist, pressing play in the Berean shows:
  "Voices are still being recorded for this version. Please switch to the Restored King James edition for the
  natural voices." (Yoshi's wording, lightly tidied — check with him.) Recordings for the Berean come after.
  (5) Strong's in the Berean (Yoshi): the Strong's numbers are tied to KJV words, so a Strong's press in the
  Berean opens a sheet: "There is no Strong's version for this edition" + the same verse in the Restored King
  James; the reader taps the KJV word they mean and gets the Hebrew/Greek as usual. Later possibility: the
  Berean's own word-to-Greek/Hebrew tagging (Berean Interlinear, same public-domain family) could tag the Berean
  directly and retire the sheet. Yoshi: "very useful" — so check the Berean Interlinear's license and format
  FIRST when the edition is built; the KJV-word sheet is the fallback if it can't be used.
- S475 BEREAN STEP 1 BUILT (Fable), uncommitted, NOT yet applied to the DB: DESIGN CHANGE — no partner-data
  migration. verses.canonical_verse_id (NULL = self) points a Berean verse at the King James verse at the same
  reference; canon_verse_id() helper. Writes: whole-verse highlights, bookmarks and notes store the canonical id;
  word/phrase highlights stay on the verse whose words they mark. Chapter reads find marks through the canonical
  verse and return THIS edition's verse_id; a word mark from the other edition comes back whole-verse with
  carried=true (Highlight model). Chapter text now carries verse.canonical_id (set only in the Berean) for xrefs,
  commentary, Strong's and people lookups. Files: data-schema/migrations/session475_canonical_verse.sql,
  data-schema/schema.sql, api/main.py (highlights/bookmarks/notes/chapter), api/models.py.
  Apply + dry run in one: python3 _session475_canonical_verse_apply.py (keeps nothing unless old and new
  queries match row for row for every partner). Reading position already resolves by reference (unchanged).
  NEXT (step 1b): app side — show "carried" marks with the note; use verse.canonical_id for lookups.
