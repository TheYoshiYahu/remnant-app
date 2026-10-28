# ALEPH-BET — spec (written S478, Oct 28, 2026; build queued behind the Oct 28 priorities)

Yoshi's ask: every form of the aleph-bet in the app — modern, paleo, pictograph, everything that exists; the "Remove the vowel additions?"
panel spells out the consonants of the word; pointing at a letter opens a card that says what the letter is and shows every form of it.

## 1. Data — one static letters table (app/src/data/alephbet.json; no migration)
Per letter: id, square form (+ final form), name (Hebrew + English), sound, number value, pictograph meaning (what the earliest sign drew),
and the forms: `pictograph` (SVG, ours), `paleo` (Phoenician Unicode), `samaritan` (Samaritan Unicode), `square` (SBL Hebrew), `rashi`,
`cursive`. Working list (meanings per the standard proto-Sinaitic readings; confirm the wording you teach):

| # | square | name | sound | value | pictograph | paleo U+ | samaritan U+ |
|---|---|---|---|---|---|---|---|
| 1 | א | Aleph | silent / glottal | 1 | ox head — strength, first | 10900 | 0800 |
| 2 | ב | Bet | b / v | 2 | house / tent floor-plan | 10901 | 0801 |
| 3 | ג | Gimel | g | 3 | camel / foot — to lift, carry | 10902 | 0802 |
| 4 | ד | Dalet | d | 4 | door / tent door | 10903 | 0803 |
| 5 | ה | He | h | 5 | man with arms raised — behold, breath | 10904 | 0804 |
| 6 | ו | Vav | v / w / o / u | 6 | peg / nail / hook — to join | 10905 | 0805 |
| 7 | ז | Zayin | z | 7 | weapon / mattock — to cut | 10906 | 0806 |
| 8 | ח | Chet | kh | 8 | fence / wall — to separate | 10907 | 0807 |
| 9 | ט | Tet | t | 9 | basket / coiled — to surround | 10908 | 0808 |
| 10 | י | Yod | y / i | 10 | hand / arm — to work | 10909 | 0809 |
| 11 | כ / ך | Kaf | k / kh | 20 | open palm — to cover, allow | 1090A | 080A |
| 12 | ל | Lamed | l | 30 | shepherd's staff / goad — to lead | 1090B | 080B |
| 13 | מ / ם | Mem | m | 40 | water — chaos, mighty | 1090C | 080C |
| 14 | נ / ן | Nun | n | 50 | seed / sprouting — continue, heir | 1090D | 080D |
| 15 | ס | Samekh | s | 60 | prop / thorn — to support | 1090E | 080E |
| 16 | ע | Ayin | silent / guttural | 70 | eye — to see, know | 1090F | 080F |
| 17 | פ / ף | Pe | p / f | 80 | mouth — to speak | 10910 | 0810 |
| 18 | צ / ץ | Tsade | ts | 90 | fish hook / trail — to hunt, need | 10911 | 0811 |
| 19 | ק | Qof | q | 100 | sun on the horizon / back of the head — behind, time | 10912 | 0812 |
| 20 | ר | Resh | r | 200 | head of a man — first, chief | 10913 | 0813 |
| 21 | ש | Shin | sh / s | 300 | two front teeth — sharp, press, eat | 10914 | 0814 |
| 22 | ת | Tav | t | 400 | crossed sticks / mark — sign, covenant | 10915 | 0815 |

Other forms "that exist" — decide which to show: Rashi script (medieval commentary type), modern cursive (handwriting), block/print vs
Torah-scroll "STAM" letters (the crowns), Ktav Ivri variants (Moabite / Siloam / Lachish letters — all paleo family), Aramaic square
precursor (Elephantine), Yiddish/Judeo forms. Recommendation for v1: pictograph · paleo · Samaritan · square (scroll + print) · Rashi ·
cursive — six, in that historical order left to right.

## 2. Sources — free only
- Paleo: Unicode Phoenician block, font Noto Sans Phoenician (SIL OFL). Samaritan: Unicode Samaritan block, Noto Sans Samaritan (OFL).
- Square: SBL Hebrew (already in app/public/fonts). Rashi + cursive: an OFL font — check Culmus (Shofar / Rashi) and Noto Serif Hebrew; if
  none carries Rashi, draw the 22 as SVG from a public-domain type specimen.
- Pictographs: NO Unicode and no font. Draw the 22 proto-Sinaitic signs ourselves as clean SVG from the standard scholarly chart (Gardiner /
  Albright line drawings are the reference), one file per letter in app/public/alephbet/pict/. Never AI-generated glyphs — the Grok "paleo"
  divider (S202) was invented and was pulled (S204). Yoshi reviews the 22 drawings before they ship.

## 3. Where it shows
(a) ALEPH-BET CHART page (menu → Study tools): 22 rows × the six forms, name, sound, value, meaning; a tap/hover on any cell opens the
    letter card. Free tier (it is a reference, and it is the thing that sells the "restored" reading).
(b) LETTER CARD (modal / sheet): big square letter, name, sound, value, pictograph meaning in one sentence, then the forms side by side with
    their labels and the period each belongs to; a "words that begin with this letter in the lexicon" link is optional later.
(c) "REMOVE THE VOWEL ADDITIONS?" panel (VowelsLens.tsx): under "Without the vowels: נצר" list the consonants letter by letter, right to
    left as written: `נ Nun — seed · צ Tsade — hook · ר Resh — head`; each letter is a hover (desktop) / tap (phone) target that opens the
    letter card. The consonants already come from /v1/skeleton/{lemma} — this is app-side only. The pictograph meaning string can also be read
    out as a line ("seed · hook · head") — Yoshi's call whether that line is shown by default or behind "what the letters picture".
(d) Later, optional: a letter-forms strip on the Strong's card for any Hebrew lemma; a Caution-layer-style toggle to render a verse's Hebrew
    in paleo.

## 4. Build order (one session, no migration)
alephbet.json + fonts (Noto Phoenician / Samaritan, Culmus) → the 22 pictograph SVGs (Yoshi reviews) → LetterCard component → the consonant
list in VowelsLens → the chart page → type-check, build, push (Yoshi's). Model rule as usual; the SVGs are hand work, the data table is
checked letter by letter against two printed charts before it ships.

## 5. Short questions for Yoshi (answer whenever)
1. The meanings column — your wording for each letter, or the standard chart's?
2. Which forms in v1: the six above, or more (STAM crowns, Moabite, Elephantine)?
3. The "seed · hook · head" picture-line in the vowel panel: shown by default, or behind a tap?
