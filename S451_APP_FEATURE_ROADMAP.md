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
- [ ] canon (KJV) — audited S455 (source-texts/kjv-canon-audit/): faithful, 31,102/31,102; fix for the 5 items (Psalm titles, Ps 119 letters, epistle subscriptions, 7 rewordings, 1 echo) waits on Yoshi's word — S446_SESSION_HANDOFF.md S455b.

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

## Next — retention
- [ ] Daily verse push notification + home-screen widget.
- [ ] Reading streaks / chapters completed on Today.
- [ ] Sabbath and feast sundown reminders from the existing Calendar (by location).

## Next — conversion
- [ ] First-open tour (3 screens: restored names, the cut books, the voices) ending at the taste.
- [ ] Ratings prompt after the third chapter of listening.
