# S469 — Michael & Olivia: say Yahuah / Yahusha the way Yoshi picked

Read the last "NEXT (own session)" note in S468_SESSION_OPEN_PROMPT.md first.

## Roadmap (one at a time; Yoshi listens and runs everything on his Mac)
1. TEST CLIPS: in tts/, make short clips of a few verses with Yahuah, Yahusha, Elohim in both
   voices (am_michael, af_heart), several single-stress one-word IPA versions each.
2. YOSHI PICKS by ear; lock the winner in tts/names_ipa.py (check Enoch, Eve, Baruch too).
3. RE-RECORD both voices (record_bible.sh), then upload and verify like S456.
Also open from S468: answer Cheryl; 13 verses still show JEHOVAH in the app text.

## S469 result (settled by Yoshi by ear, saved in tts/names_ipa.py)
- Yahuah iˈɑuɑ, Yahusha iˈɑuʃɑ (B) · Elohim ˈɛlohim (4) · Enoch həˈnoʊk, Eve huˈɑ (#2)
- Baruch bəˈɹux, Yashar'el jɑʃəˈɹɛl, Yahudah jəˈhudə, Adonai ɑdoˈnaɪ · Ruach ɹɹˈuːɑk (#3, stronger R per his wife)
- HaKodesh hɑkˈoʊdəʃ — settled by Yoshi (his #3; tried "hako desh", worse).
- Lesson: never splice a name rendered separately at another speed — it sounds like a different voice;
  Yoshi: worse than a bad pronunciation. Only single-pass renders; change sounds, not speed.
- NEXT: re-record both voices (step 3). Clear tts/name_tests
  (needs delete permission). Still open from S468: answer Cheryl; 13 verses show JEHOVAH in app text.
- Per-voice names: names_ipa.IPA_BY_VOICE + use_voice() (gen_bible calls it). Olivia (af_heart) HaKodesh = "hɑkˈoʊ dɛʃ".
- Voice audition: 27 English voices in tts/name_tests/voices/. Yoshi liked am_echo and af_sky (not done listening).
  Each extra voice = a full Bible recording; pick a few, not all.
- NEW PRIORITY (Yoshi): the Bible has never been fully functional offline, even with the download-to-phone
  features. Must be fixed — own session: find what breaks offline (text, audio, commentary, search) and fix it.
  ROOT CAUSE FOUND (S469): the phone app is a shell that loads the live site — capacitor.config server.url =
  https://bible.remnantofpromise.org (ios/App/App/capacitor.config.json, android/app/src/main/assets/capacitor.config.json).
  No service → app can't open (error page), whatever was downloaded. Fix: ship the app's pages inside the
  app (or a service worker that caches the app itself), then make downloaded text/audio load from the phone.
  Needs new app builds + store submissions.

## S470 offline diagnosis (Claude, 2026-10-25) — four breaks, not one
1. SHELL: capacitor.config.ts server.url = live site (set S201 so web deploys reach phones without rebuild).
   Offline → no app at all. Fix = remove server.url so the app ships its own pages (dist/). API calls are
   already absolute (lib/api.ts API_BASE), so bundling does not break them.
   COST: after this, app-code fixes reach phones only by new builds + store submissions (content/text from the
   API still updates live). DECISION NEEDED from Yoshi.
2. TIER LOCK: App.tsx ~2111 — offline, /me fails → tier falls to "free" → contentCache scope "free" → a paid
   partner's downloads (stored under their paid tier) are invisible. Fix: remember last known tier on device,
   use it when /me can't be reached.
   Also: until /me answers, cache runs pass-through (contentCache.ts) — offline it must read the stored scope.
3. AUDIO: recorded audio (lib/recordedAudio.ts) only streams from AUDIO_BASE; no audio download exists in
   downloadManager/offlineDownload. Needs a real audio download (Capacitor Filesystem) + local playback.
4. Still to check: book list, search, commentary, lexicon load paths when offline.

## S470 decisions + state (Yoshi, 2026-10-25, end of night)
- DECIDED: build the app's pages into the phone app (no live-site link). Content (text, commentary,
  xrefs, audio) stays live from the server; app-code changes go out by store release, batched every
  couple of weeks.
- DONE (uncommitted, tsc passes): app/capacitor.config.ts server.url removed;
  App.tsx + components/DownloadsSettings.tsx remember last tier ("rop_last_tier") for offline.
- DECIDED: voices = Michael + Olivia only. Don't record the other 27. Maybe later: samples of all,
  record only what people ask for.
- HOLD: audio downloads NOT built yet. Re-record Michael + Olivia first, then build per-book audio
  download (~3 GB/voice whole library). Plan: @capacitor/filesystem 8.1.2 downloadFile into app data;
  recordedAudio.ts loadTiming + srcFor check the phone first.
- Offline check so far: book list has saved fallback (ok); search + lexicon are online-only (ok for now).
- NEXT ORDER: re-record Michael + Olivia → audio downloads → new builds + both store submissions.
- CHANGED (Yoshi, 01:15): record am_echo + af_sky NEXT (four voices rolling), re-record Michael + Olivia
  after. First step: short name-test clips in echo + sky (Yahuah, Yahusha, Elohim, HaKodesh, Ruach…) for
  Yoshi to check by ear — Olivia needed her own HaKodesh, so new voices may too (names_ipa.IPA_BY_VOICE).
  Then full recording with record_bible.sh.
- S470 names (2026-10-25 afternoon): Echo + Sky top group all settled by ear, saved per voice in
  tts/names_ipa.py IPA_BY_VOICE (Eloheinu + Elohai settled for both). names_ipa now resets per voice
  (no leak between voices) and builds its name pattern from the live list. Not yet heard: second-tier
  names (El Gibbor, El Olam, compound Yahuah names, extra-book names).
- S470: Echo HaKodesh settled (hɑkoˈdɛʃ). All checked names settled for Echo + Sky. Ready to record.
- S470 housekeeping: deleted tts/name_tests (all clips) and tts/chapters_all.json.pre-s448..456
  (nothing referenced them; 4 were in git, so history still has them — next commit records the delete).
- S470 recording: Yoshi running `record_bible.sh af_sky am_echo` (Sky first, then Echo).
  S471: Sky's picker line IS now in recordedAudio.ts with a "still recording" note (Psalms, Enoch, Jubilees done);
  add Jasher etc. to the note as they upload; drop the note when she's complete. Echo's line still not added.
  (older note:) Picker entries NOT in the code yet (kept out so other app work can push freely). After upload,
  add to RECORDED_VOICES in app/src/lib/recordedAudio.ts, after Olivia:
    { id: "af_sky", name: "Sky · Natural voice (female)", lang: "en-US", localService: false },
    { id: "am_echo", name: "Matthew · Natural voice", lang: "en-US", localService: false },
  Still needed before upload: audio/af_sky/preview.mp3 and audio/am_echo/preview.mp3 (picker preview;
  no script exists for how Michael's was made — make one short clip per voice).
- S471: audio/af_sky/preview.mp3 made (Psalm 23:1-3, 11.6 s, same settings as gen_bible.py). Echo preview still to make
  after Echo records. Sky uploading partial while recording continues (upload script skips unfinished .part files).
  S471: Psalm 23 removed from all five recorded voices (23:1 now spoken "Yahuah is my shepherd") — rerun
  record_bible.sh per voice to refill, then upload. Details in S451_APP_FEATURE_ROADMAP.md bottom.
