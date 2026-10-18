# S446 handoff (Oct 13, 2026) — continuous play stopping at chapter breaks

## Report
A partner said the audio does not go on to the next chapter in Enoch and Jasher; the first canon books did.

## Causes found
1. Enoch chapters 1 and 10 had no recording in any voice (moved to audio/_redo in S444, never re-recorded). A missing chapter silently switched to the phone's voice, which is silent on the Android build before 1.1.2. Yoshi restarted tts/record_bible.sh am_michael on Oct 13 to fill them; upload with node _s444_upload_audio.mjs after.
2. Only Michael is recorded (George 16 Psalms, Onyx 2, Heart 2); other voices fall back to Michael per chapter. Expected.
3. Real Jasher cause: no background audio on iOS and nothing keeping the screen on. When the phone locks mid-chapter the WebView is suspended, the chapter finishes, nothing starts the next one. Jasher chapters are 5–9 min so it locks almost every time.

## Changes (web — ships with the next Render push; the shells load the live site)
- app/src/lib/wakeLock.ts (new): Screen Wake Lock while the player is open; re-acquired on visibilitychange.
- app/src/App.tsx: keepScreenAwake() when a chapter run starts, allowScreenSleep() on player close; ttsNotice state fed from engine.onError and passed to AudioPlayer.
- app/src/components/AudioPlayer.tsx: `notice` prop shown in place of the verse reference.
- app/src/lib/recordedAudio.ts: when no recording exists in any voice, emit "No natural-voice recording for this chapter yet. Using the phone's voice." before falling back (was silent).

## Changes (iOS native — needs a new App Store build, 1.1.3 / build 14)
- ios/App/App/Info.plist: UIBackgroundModes = [audio].
- ios/App/App/AppDelegate.swift: AVAudioSession .playback / .spokenAudio, set active at launch.
- project.pbxproj: MARKETING_VERSION 1.1.3, CURRENT_PROJECT_VERSION 14.
Android needs no native change for this (Wake Lock API is in the WebView).

## To verify on a phone
Play a Jasher chapter, lock the phone, wait for the chapter to end: the next chapter should start (iOS needs the 1.1.3 build; Android only needs the web push). Play Enoch 9 before the re-upload lands: the bar should read the "No natural-voice recording" notice instead of going quiet.

## Phone tests (Oct 13, 3:30 PM, before the web push)
- iPhone: audio keeps playing after lock, but STOPS at the chapter break. Confirms the 1.1.3 build (background audio) is needed.
- Android: at the chapter break with the phone locked, it switches to the phone's robot voice until unlocked and replayed. Likely the timing-JSON fetch (or audio.play) fails while locked, so startBatch falls to the device engine.
- Both stores: 1.1.2 is published.

## S447 (Oct 13, 3:45 PM) — Android fix, written and deployed with _session447_deploy.sh
Cause: at the chapter break the chapter text came from the IndexedDB cache, but the timing JSON had to be fetched from R2; with the phone locked that fetch failed and startBatch fell through to the phone's voice.
- recordedAudio.ts: loadTiming tells a 404 (truly unrecorded → S446 notice + device voice) from a network failure (→ "Couldn't reach the recording. Tap play to try again.", no voice switch; play re-runs the same chapter). Retries ~12 s with backoff.
- recordedAudio.ts: prefetch now holds the next chapter's MP3 in memory as a blob (two at most) and plays from it, so the break needs no network.
- App.tsx: queueChapterFromVerse also warms the next chapter's text (and the next book's chapter list across a book boundary) through readThrough.
- Still to do: Xcode archive + submit 1.1.3 (iOS background audio); upload audio after the Jasher redo. Open question (c) above still unconfirmed.

## S447b (Oct 13, 3:55 PM) — phone test after the first push
Android, locked: no longer switches voices, but the next chapter does not start at all; after unlock the small play button did nothing, the top play button started it. So the hand-off now reaches the new chapter and Android's WebView refuses audio.play() for a new source while the screen is locked (the old "Tap play to start audio" path, which the small button could not recover from).
- recordedAudio.ts: a refused play() leaves the run armed ("Waiting for the screen to unlock to start the next chapter."); it auto-starts on visibilitychange→visible, and the small play button (resume) starts it too. resume() also plays a paused element it did not pause itself.
- App.tsx: an empty engine error clears the player notice.
- NEXT (needs a Play Store build): true locked-screen chapter advance on Android needs native playback — a foreground media service / MediaSession plugin (e.g. a Capacitor native-audio plugin) driving the MP3 instead of the WebView <audio>. Same build can carry the proxy address and listing overhaul.

## S448 (Oct 14, 9:50 PM) — Michael complete; voice renames; next voice Olivia
- Michael (am_michael): 1,438 chapters recorded (canon 1,189 + 1 Enoch 108 + Jubilees 50 + Jasher 91), 103.6 h of audio; all 2,920 files (mp3 + json) are in audio/.uploaded.txt — nothing missing after the re-run. The Jasher redo finished ~9:30 PM.
- Recording cost (from Michael's run): median ~74 s per chapter, ~34.5 h of machine time per voice for the current set.
- Renamed display names only: af_heart "Heart · Natural voice (female)" → "Olivia · Natural voice (female)"; am_onyx "Onyx · Natural voice (deep)" → "Ivan · Natural voice (deep)". Lock notice in AudioPlayer.tsx updated. recordedVoiceByName maps the two old names to their ids so a saved preference keeps working. Deploy: _session448_deploy.sh. AUDIO_SETUP.md and the store listing text do not mention voice names.
- GAP (Yoshi's catch): tts/chapters_all.json carries only canon + Enoch + Jubilees + Jasher. Not in the recording set, by edition (chapters): apocrypha 187, adam-eve-conflict 101, apocalypse-of-abraham 32, ascension-isaiah 11, sonnini-acts-29 1, apocrypha-charles-vol1 160, pseudepigrapha (Charles vol 2) 426; historical witnesses josephus 369, lightfoot-apostolic-fathers 39, mrjames-apocryphal-nt 42. _s444_fetch_live_text.mjs fetches only edition_slug === "canon"; extending it to the other editions is how the set grows. record_bible.sh skips chapters already done, so Olivia can start now and pick up any added books on a re-run.
- Yoshi confirmed (10:16 PM): 1.1.3 NOT yet archived or submitted; both stores sit at 1.1.2 (two submissions so far: launch + the 1.1.2 update). iOS 1.1.3 / build 14 can ship on its own (only native change is background audio; the web side is already live). Android has no native change yet — a Play Store build waits for the native-playback work. Android native playback (foreground media service / MediaSession) not started; android versionName still 1.1.2.
- Yoshi (9:55 PM): Michael records everything except Josephus. _s448_add_extras_text.mjs built the extras from source-texts/parsed (the files the live DB is seeded from; verified identical to live text for Enoch/Jubilees/Jasher — the API hides extras from anonymous callers, so a live fetch returned nothing). Run on Oct 14: +985 chapters in 58 books, set now 2,423 chapters; chapter-0 introductions skipped; backup at tts/chapters_all.json.pre-s448. Then: bash tts/record_bible.sh am_michael af_heart — Michael's ~1,000 new chapters (~20 h), then Olivia's full set (~2,400 chapters, ~50 h). Upload with _s444_upload_audio.mjs as before.

## S448b (Oct 14, 10:30 PM) — 1 ENOCH TEXT IS CORRUPT (partner report: ch 14 and 17 duplicate)
Confirmed, and it is the published Restored Names Edition itself (source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt = the KDP book = parsed/enoch.json = the app = Michael's audio), not the app parse. The base text the edition was built on does not follow Charles's versification and repeats blocks across chapters:
- ch 14 vv.8–21 are ch 18's "seven mountains / prison of the stars" text; the real 14:8–25 throne vision is MISSING. ch 17 = Charles 17:1–8 + 18:1–13; ch 18 repeats 17:8–21 again.
- Whole-chapter duplicates: 28=29, 95=97, 103=104 (identical). Heavy overlap: 89/90 (19 shared verses), 94–97 (14 each), 102/103/104, 70/71, 30–32, 39/42, 41/44, 24/26–29.
- Verse counts vs Charles: 14→21 (Charles 25), 17→21 (8), 18→18 (16), 28→13 (3), 29→12 (2), 95→19 (7), 97→19 (10), 103→25 (15), 104→25 (13).
NEXT SESSION (its own session): rebuild 1 Enoch from a clean Charles 1917 text (not on disk; must be fetched), run it through restoration-pipeline/restore.py, re-parse to parsed/enoch.json, reseed, re-record Enoch for Michael (move audio/am_michael/enoch to audio/_redo, run record_bible.sh am_michael, upload), republish the KDP Enoch edition. Cross-references/commentary that cite Enoch chapter:verse will need a check against the corrected versification.

## S449 (Oct 14–15) — 1 ENOCH REBUILT TO CHARLES 1917, BY CONTENT. Live in the app.
Rule that governed this session and must govern every audit after it: verify by content, verse-by-verse against a clean source, numbers shown per chapter; never by length or count. The earlier "checked, looks fine" passes were count checks — that is how 515 invented verses went unnoticed.

### What was found (source-texts/enoch-charles-1917/enoch-damage-table.md)
Published edition vs Charles 1917 (1,062 verses): matched 412, changed 89, missing 561, extra 872 — of the extra, 349 were Charles text under the wrong chapter number and **515 matched nothing in Charles: invented prose** (ch 14:2–7 "carried off in a whirlwind", ch 101 padded to 100 verses, 79, 25–36, 62–68, 72–82, 86–90, 94–97, 101–107). Only 17 chapters were intact (1, 2, 4, 19, 47, 49, 50, 54, 55, 56, 57, 91, 92, 93, 98, 99, 100). Enoch-Restored-Names-Edition.txt.pre-s449 = the corrupt text, kept as evidence.

### Clean base (source-texts/enoch-charles-1917/)
- enoch-charles-1917.txt — Charles 1917, 108 chapters / 1,063 verses (60:25 is printed inline after 60:6 in Charles), one verse per line, chapter from the CHAPTER heading. Base = Wikisource transcription (enoch-wikisource-charles-1917.raw.txt — found in ~/Downloads as enoch-raw-charles.txt, Apr 13: this was the lost original source text). Second witness = sacred-texts.com (enoch-charles-1917.json, 109 pages pulled through the browser pane; the site moved behind Cloudflare, so fetch.sh / curl get 403 — enoch-sacredtexts-charles-1917.txt). Witnesses agree ≥98.5% per chapter once section titles, Charles's printed rearrangements (51, 90, 106) and the Ethiopic/Greek parallel columns (22, 27, 32; Ethiopic kept) are accounted for. Scripts: parse_wikisource.py, parse_charles.py, diff_edition.py, build_edition.py, gen_migration.py, sweep_citations.py.

### What was changed
- existing-restored-editions/Enoch-Restored-Names-Edition.txt — verse text of all 108 chapters rebuilt from the base through restoration-pipeline/restore.py; front matter, chapter titles, all 108 commentaries, back matter carried verbatim. Verified through the app parser: 1,063/1,063 verses equal Charles word-for-word with names mapped back.
- parsed/enoch.json — re-parsed (only verse text changed). .pre-s449 beside it.
- restoration-pipeline/parse_published_editions.py — BUG FIXED: a verse ending in a number ("…are 80." then "17 And") swallowed the next marker. Lookbehind fix; .pre-s449. NOT yet re-run on Jasher/Jubilees/Apocrypha — when they are re-parsed they will gain verses that were silently merged; do it inside their own audits.
- LIVE DB (Rule-10 in-place migrations, all applied Oct 15): session449_enoch_full_rebuild.sql (upsert all 1,063 verses, ids kept); session449b_enoch_blank_surplus.sql (241 surplus rows blanked); session449c_enoch_xref_sort.sql (278 cards retired — 216 on invented verses, 55 duplicates, 7 self-references; 138 cards re-pointed to the true verse with the note's "Enoch c:v" rewritten; thread anchors moved; 236 freed rows deleted). Live now: 1,068 verse rows = 1,063 + 5 blanked rows held only by readers' highlights/notes (11:7, 17:9, 17:21, 24:9, 25:9 old numbering); 1,944 cross-references touching Enoch. Retired cards archived with notes: enoch-xrefs-retired.tsv. Render DB access list needed Yoshi's current IP (fixed Oct 15).
- Pipeline rendering choices (differ from the old text, which came from the bad base, not the pipeline): "Yahuah (Lord) of Spirits" (source-echo) not "(God)"; "holy ones" not "set-apart ones". SETTLED (Yoshi, Oct 15): keep the pipeline rendering — Yahuah (Lord) of Spirits, holy ones.

### Audio (step E) — scripts ready, run when the recorder is idle
node _s449_enoch_audio_redo.mjs (refuses to run while gen_bible.py runs; swaps the 108 Enoch chapters in tts/chapters_all.json 1,373→1,063 verses, moves audio/am_michael/enoch/1-enoch → audio/_redo/am_michael/1-enoch-s449, drops old Enoch lines from audio/.uploaded.txt) → bash tts/record_bible.sh am_michael → node _s444_upload_audio.mjs. Only Michael had Enoch recorded. Yoshi stopped the extras recorder on Oct 15 morning.

### Step F — what cites the old text (enoch-citation-sweep.md, enoch-commentary-flags.md, enoch-verse-status.json)
- 1 Enoch chapter commentaries: 17 stand, 10 quick read (3, 6, 7, 9, 10, 12, 20, 46, 51, 58), 81 REDO (written on invented/misplaced text).
- Live cards: 923 same; 796 different + 87 reworded (notes quote the old verse — content pass in Yoshi's voice, later sessions); 138 moved (read wording).
- Called God a Liar: cards 1 Enoch 95_2.png and 97_2.png + the video kit quote an invented verse. True witnesses: 104:9–10, 99:2. 5:4 and 98:15 stand. If the video is live, it read the invented verse on air.
- Books: The Sides of the North! (14 Enoch citations now pointing at different words), Ephraim Rising (15:8–10, 69:6), Understanding_Scripture (7:3–4, 69:6), Jasher edition commentary (6:1–8, 7:5, 14:18–20). Teaching Corpus: SERIES-SPINE (10:17–22, 89:32–33), concepts 14-revelation-cyclical (90:6–19), kingdom-gospel (62:6–9).
- App commentaries (Matthew etc.): 9 Enoch citations, all stand.

### Step G — KDP Enoch edition (NOT built; Yoshi's word)
New interior from Enoch-Restored-Names-Edition.txt (the whole old interior is the corrupt text; the S438 REVISED docx only fixed 91–93). Chapter titles can stay; the 81 REDO commentaries should be rewritten before the interior is built, or the book ships with commentary on text it no longer contains. Build per yoshi-voice references/bookcraft-mechanics.md. Masters: ~/Desktop/docx claude finished/The-Book-of-Enoch-Restored-Names-Edition*.docx.

### THE BIGGER AUDIT (Yoshi, Oct 14 22:56): "we have to check all of scripture… then recheck all cross references, re-record all voices, then go through my books; Enoch, Jasher, Jubilees and the Apocrypha have to be audited and fixed."
Order, general → specific, each by content against a clean public-domain source with per-chapter numbers:
1. Jasher (Noah 1840), Jubilees (Charles 1902), Apocrypha (KJV 1611 / Brenton; Charles vol 1) — same method as this session: fetch clean base (browser pane if the host blocks curl; archive.org djvu text is OCR — second witness only), parse, diff_edition-style table, rebuild only what fails, Rule-10 migration, card sort.
2. Canon (KJV base vs parsed/canon.json) — expected clean, but it has never been content-checked; cheap to prove.
3. The other extras (pseudepigrapha vol 2, adam-eve, apocalypse-of-abraham, ascension-isaiah, sonnini, josephus, lightfoot, mrjames).
4. Then cross-references (the 796+87 Enoch cards first), then voices (re-record only chapters whose text changed), then books (book-revamp list above).
Never re-parse all editions with parse_published_editions.main() — it overwrites every JSON; parse one edition at a time.

## S450 (Oct 15, morning) — JASHER AUDITED BY CONTENT. Book text faithful; app was short 85 verses. Fix STAGED, awaiting Yoshi's word.
Method = S449's: clean public-domain base, parsed by chapter heading, one verse per line; edition diffed verse by verse by CONTENT (restored names mapped back, the edition's modernized grammar normalized on both sides); every non-identical verse then read at word level. Never by count.

### Scorecard — every edition in the app (update this table each audit)
| # | edition | base | audited by content | verdict | numbers |
|---|---|---|---|---|---|
| — | enoch | Charles 1917 | S449 | REBUILT, live | 1,063/1,063 verses equal Charles; 515 invented verses removed |
| 1 | jasher | Noah 1840 (sacred-texts) | S450 | TEXT FAITHFUL; app parse short 85 verses; fix staged | book 3,910/3,910 matched; app 3,825/3,910 |
| 2 | jubilees | Charles 1917 SPCK (sacred-texts; 1902 OCR as 2nd witness) | S453 | TEXT FAITHFUL; 243 rows held 2–3 verses each; fix staged | base 1,307/1,307 matched (0 missing, 0 extra); app 1,031 rows → 1,307 |
| 3 | apocrypha (KJV 1611 / Brenton); apocrypha-charles-vol1 | — | — | | |
| 4 | canon (KJV) | — | — | never content-checked | |
| 5 | pseudepigrapha (Charles vol 2), adam-eve-conflict, apocalypse-of-abraham, ascension-isaiah, sonnini-acts-29, lightfoot, mrjames, josephus | — | — | | |

### A. Clean base (source-texts/jasher-noah-1840/)
- Two witnesses, both sacred-texts.com (the site is behind Cloudflare: curl 403; pulled through the browser pane via fetch() on the page, saved as jasher-sacredtexts-1887.json, 91 chapter pages). Witness 1 = ~/Downloads/jasher-raw-1840.txt (Apr 13 — the lost original source, same story as Enoch's) → jasher-downloads-raw-1840.txt → parse_raw.py → **jasher-noah-1840.txt: 91 chapters / 3,910 verses, numbering regular, no gaps.** Witness 2 = today's pull → parse_sacredtexts.py → jasher-sacredtexts-1887.txt. The two are word-for-word identical on all 3,910 verses (one "<P" artifact at 85:63 in today's). Three printed page numbers (15, 20, 52) sit inside the source after 7:18, 9:7, 20:13 — stripped from the base.
- Per-chapter counts: 1:36 2:37 3:38 4:21 5:36 6:42 7:51 8:36 9:39 10:39 11:61 12:70 13:28 14:33 15:47 16:36 17:20 18:43 19:60 20:30 21:48 22:55 23:90 24:45 25:28 26:39 27:17 28:29 29:43 30:29 31:77 32:73 33:52 34:70 35:25 36:38 37:50 38:52 39:65 40:52 41:34 42:53 43:48 44:80 45:32 46:20 47:33 48:66 49:44 50:39 51:54 52:42 53:32 54:110 55:36 56:68 57:45 58:30 59:28 60:31 61:25 62:27 63:35 64:50 65:38 66:31 67:61 68:32 69:9 70:51 71:16 72:42 73:48 74:23 75:22 76:62 77:51 78:16 79:57 80:63 81:62 82:37 83:43 84:32 85:63 86:12 87:11 88:65 89:54 90:50 91:17.

### B. Diff (jasher-damage-table.md = the book text; jasher-damage-table-app.md = parsed/jasher.json; worddiff-txt.log = every non-identical verse at word level)
- **The published book text (existing-restored-editions/Jasher-Restored-Names-Edition.txt): 3,910 matched / 0 changed / 0 missing / 0 extra. Nothing invented, nothing misplaced.** 3,622 verses identical after normalization, 188 at ≥0.99, 69 at ≥0.97, 25 at ≥0.95, 6 at ≥0.90 — the lower scores are all compound-name renderings ("Yahuah his Elohim (the Lord his God)") and modernization. Jasher is NOT the Enoch case.
- Real defects found by reading the word-level diff (all also in the KDP docx master, ~/Desktop/docx claude finished/The-Book-of-Jasher-Restored-Names-Edition.docx — verified: 90 «, 6 "from from there", 1 "THE END"): (1) a stray "«" line after the last verse of 90 chapters (sacred-texts page-nav glyph scraped into the book); (2) page numbers "15", "20", "52" printed as lines after 7:18, 9:7, 20:13; (3) "THE END" after 91:17; (4) "from from there" ×6 (24:31, 24:34, 34:69, 44:52, 45:9, 80:62); (5) 12:35 "The Elohim of heaven" — 1840 reads "God of heaven and earth"; (6) 47:5 "Elohim of my fathers" should be "your fathers"; (7) 78:10 "your fathers" should be "my fathers"; (8) "the El Shaddai (Almighty God)" ×3 (2:24, 29:28, 52:23); (9) 23:63 "the will of the Yahuah our Elohim" (the app JSON already had this right since S69 — txt and JSON had drifted; the only drift found); (10) 34 chapter titles wrap to a second line that the app parser drops ("…the First Blood on").
- **The app (parsed/jasher.json, = live DB): 3,825 matched / 85 missing / 3 extra.** The three page numbers made the parser swallow 7:19–51 (33 verses), 9:8–39 (32), 20:14–30 (17) into 7:18, 9:7, 20:13 — three 4–7 KB "verses". Michael's audio for those chapters reads the whole run as one verse. 21 session252 cards and 7 thread anchors sit on those three rows.
- Rendering items NOT changed (Yoshi's call, not content errors): 9:10 nested parenthetical "Yahuah (for they served each man his own Elohim (God))"; 79:47 "Yahuah Elohim of elohim (of Gods)"; 79:51 "of the nations" (1840: "of nations"); the edition's parenthetical is dropped on a second mention in some verses (26:7, 29:26, 34:69) against the every-mention rule.

### C. Fix — STAGED, nothing live touched, originals untouched (decision: surgical patch, not a restore.py rebuild — the text is Yoshi's modernized, already-restored edition and it is right; rebuilding from 1840 would undo the modernization)
- fix_edition.py (every edit counted and asserted) → jasher-noah-1840/Jasher-Restored-Names-Edition.fixed.txt: the 10 items above; 90 + 3 + 1 lines removed, 6 + 1 + 1 + 1 + 3 + 1 phrases fixed, 34 titles joined. Nothing else changes (diff shown and read).
- reparse_jasher.py (parse_jasher only — never main()) → jasher.fixed.json: 91 / 3,910, front matter, back matter and all 91 commentaries byte-identical to the old JSON except the "« " dropped; 98 verse rows differ from the old JSON (85 new + 13 corrected: 2:24, 7:18, 9:7, 12:35, 20:13, 24:31, 24:34, 29:28, 34:69, 44:52, 45:9, 47:5, 52:23, 78:10, 80:62, 91:17 — list in jasher-changed-verses.json). Verified through diff_edition.py: 3,910/3,910 matched; word-level: every remaining difference is a name rendering or modernization.
- data-schema/migrations/session450_jasher_fix.sql (gen_migration.py from the S449 template; Rule 10 — upsert in place, ids kept, 85 inserts, titles → chapters.chapter_title; verify or EXCEPTION; reports every card on the 3 blob rows). session450b_jasher_xref_sort.sql (gen_xref_sort.py): moves the 20 session252 cards off the blob rows to the verse each describes — assigned by READING the true verses (Gen 10:25 Peleg → 7:19; Gen 10:8 → 7:30; Gen 10:10 → 7:43; Micah 5:6 → 7:44; Jub 10:19 → 7:42; Gen 11:1 → 7:46; Gen 5:24 / Heb 11:5 → 7:25; Gen 11:26 / Josh 24:2 → 7:51; Deut 4:19 / Jub 12:17 → 9:19; Gen 20:7 → 20:14; Gen 12:17 → 20:21; Gen 12:18 → 20:24; Gen 20:17 → 20:30; Josh 24:2 on 9:7 stays), rewrites the note's "Jasher c:v", re-anchors the 7 threads (7:19–22, 7:23–48, 7:24–51, 9:6–10, 9:11–19, 20:12–17, 20:18–30), skips a move if a card already sits on the destination, lists whatever is still on a blob row. **Both migrations were run against a scratch Postgres seeded with the old JSON and the session252 cards: 3,828 → 3,910 rows, 20 cards moved, 7 anchors set, idempotent on re-run.** The live DB could not be reached from the Claude shell (HTTP-only), so the first live run is Yoshi's paste.
- _session450_jasher_deploy.sh: backs up the originals as .pre-s450, moves the fixed txt and JSON OVER the originals (staged copies removed), applies both migrations, logs to _session450_jasher_deploy.log.
- _s450_jasher_audio_redo.mjs: re-records only the 15 chapters whose text changed (2 7 9 12 20 24 29 34 44 45 47 52 78 80 91) — swaps them in tts/chapters_all.json, moves Michael's old files to audio/_redo/am_michael/jasher-s450, drops their .uploaded.txt lines. Only Michael has Jasher recorded.
- Lookbehind parser fix from S449: re-parse confirmed Jasher gains exactly the 85 page-number verses and nothing else.

### What waits on Yoshi (in order)
1. `bash ~/Desktop/App/_session450_jasher_deploy.sh`  — files + live DB. Read the NOTICE lines: BEFORE should say 3828, AFTER 3910; "cards moved: 20"; any "STILL ON BLOB" beyond the Josh 24:2 card on 9:7 is a card from a later session to sort by hand.
2. When the recorder is idle: `node ~/Desktop/App/_s450_jasher_audio_redo.mjs` → `bash ~/Desktop/App/tts/record_bible.sh am_michael` → `node ~/Desktop/App/_s444_upload_audio.mjs`.
3. KDP Jasher interior carries the same 10 defects (the « glyph prints after every chapter). Fix in the docx on the book-revamp pass (bookcraft-mechanics.md), not now.
4. Next audit session: Jubilees (Charles 1902) — same method; jasher-noah-1840/ scripts are the template (diff_edition.py takes a .txt or a parsed .json).
- **LIVE (Oct 15, 2:25 PM): Yoshi ran _session450_jasher_deploy.sh — files landed (.pre-s450 backups), both migrations committed. _s450_jasher_check.py read back: titles complete, 12:35 and 7:19 correct, 20 cards on their destination verses (7:19=5 7:25=2 7:30 7:42 7:43 7:44 7:46 7:51=2 9:19=2 20:14 20:21 20:24 20:30), 1 card left on 9:7 (Josh 24:2 — correct), all 7 thread anchors re-set. Jasher is DONE in the app except audio (step 2 above).**
- Oct 15, 2:54 PM: Yoshi stopped the extras recorder (Michael, at apocrypha/2-maccabees 10 — 272 extras chapters done) and ran _s450_jasher_audio_redo.mjs: 15 Jasher chapters swapped in chapters_all.json (586 → 668 verses), 30 old files moved to audio/_redo/am_michael/jasher-s450, 30 .uploaded.txt lines dropped. Next: record_bible.sh am_michael (does the 15 Jasher chapters, then resumes the extras where they stopped), then _s444_upload_audio.mjs.

- **S453 (Oct 17): Michael is FINISHED — tts/chapters_all.json has 2,422 chapters, every one has an mp3 + timing json on disk (incl. the 15 Jasher redo chapters and all extras), and audio/.uploaded.txt shows all 4,845 am_michael files in R2. The "stopped at 2 Maccabees 10" line above is stale. Voices lane is clear until an audit changes a chapter.**

### S453 (Oct 17) — Jubilees audit (source-texts/jubilees-charles-1917/)
- Clean base: Charles 1917 SPCK via the sacred-texts mirror (77 section pages pulled through the browser pane — curl is 403'd), parsed to 50 ch / 1,307 vv with no gaps; 7 markers the site printed without a period and one header typo repaired by reading (parse1917.py). The 1902 OCR (archive.org bookofjubileesor00char) saved as jub1902_ocr.txt for tie-breaks.
- Diff (diff_jub.py, jubilees-damage-table.md): app 1,031 rows vs 1,307 — 787 match 1:1, 243 rows each hold 2–3 verses (520 base verses), 0 missing, 0 extra; the one "changed" (10:7) is compound-name rendering only. Verse NUMBERS were already Charles's (row after 1:5 is 1:7), so no renumbering — the merged verses just had no row. Commentaries already cite Charles's numbers (so they now point at the right rows).
- Fix staged (split_jub.py → jubilees.fixed.json, 519 pieces all ≥0.85 vs Charles, 482 at 1.00; fix_txt.py → Jubilees-Restored-Names-Edition.fixed.txt, markers 2..n in every chapter, word-identical otherwise; clean_strays.py: 24 stray footnote digits inherited from the source removed, 3:23 "32." and 25:10 "19." corrected, 17:2/17:3 split moved to Charles's boundary). Prologue stays folded in 1:1.
- Cards: 1,695 unique cards touch Jubilees (local SQL copies); card_sort.py read each note's quotation against Charles: 1,530 already right, 102 move (session453b), 97 no evidence (29 of them on a formerly merged row — jub-card-sort-report.md).
- Both migrations ran on a scratch Postgres seeded with the old JSON + cards: 1,031 → 1,307 rows, 102 moved, idempotent on re-run.
- Waits on Yoshi: `bash ~/Desktop/App/_session453_jubilees_deploy.sh` (BEFORE 1031 → AFTER 1307, cards moved 102). Audio: all 50 chapters queued via _s453_jubilees_audio_redo.mjs — voices lane, LAST. KDP Jubilees interior carries the same 243 merges + 24 strays — book-revamp pass.
- Next audit: Apocrypha (KJV 1611 / Brenton; apocrypha-charles-vol1) — same method; jubilees-charles-1917/ scripts are the template (diff_jub.py takes a parsed .json).
