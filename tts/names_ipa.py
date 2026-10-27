import re
from kokoro_onnx import Kokoro
# Fixed pronunciations as IPA so nothing around a name can bleed into it.
IPA = {
 # S469: Yoshi picked version B by ear (one word, weight on the "ah").
 "Yahuah":"iˈɑuɑ", "Yahusha":"iˈɑuʃɑ",
 # S469: Yoshi picked Elohim version 4 (EL-oh-him).
 "Elohim":"ˈɛlohim",
 # S469: settled by ear — one word, quick vowels, no breaks.
 "Yashar'el":"jɑʃəˈɹɛl", "Yahudah":"jəˈhudə", "Adonai":"ɑdoˈnaɪ", "Ruach":"ɹɹˈuːɑk",
 # S469: HaKodesh settled by Yoshi (his #3).
 "HaKodesh":"hɑkˈoʊdəʃ",
 # S477: Enoch is said the English way, EE-nok (Yoshi, Oct 26 — he did not like "ha-noke"); Eve = "who-ah" (S469).
 "Enoch":"ˈiːnɑk", "Eve":"huˈɑ", "Baruch":"bəˈɹux",
 # S446: "O king, live for ever" was read as "lyve". In scripture "live" is the
 # verb (rhymes with give) everywhere except "a live coal" (Isaiah 6:6).
 "live":"lˈɪv", "Live":"lˈɪv",
 # S471: Ra'ah settled by ear on Sky — rah-AH, small catch between (Psalm 23:1).
 "Ra'ah":"rɑˈʔɑ",
}
# S469: per-voice overrides — a voice can land a name another voice misses.
IPA_BY_VOICE = {
 "af_heart": {"HaKodesh":"hɑkˈoʊ dɛʃ"},  # Olivia: Yoshi liked her "hako desh" #1
 # S470: Echo, settled by ear (rounds 2-3).
 "am_echo": {"El Elyon":"ɛl ɛliˈoʊn","El Shaddai":"ɛl ʃəˈdaɪ","Elohav":"ɛloˈhɑv",
             "Elohaychem":"ɛloˈheɪkɛm","Elohayka":"ɛloˈhaɪkɑ","HaMashiach":"hɑmɑʃˈiɑx",
             "Tseva'ot":"səvɑˈoʊt","Yahudi":"jɑː huː diː","Yahudim":"jɑː huː diːm",
             "Enoch":"ˈiːnɑk","Ruach":"ɹˈuɑːk","Yahudah":"iɑhˈuːdə",
             "HaKodesh":"hɑkoˈdɛʃ"},
 # S470: Sky, settled by ear (rounds 2-3).
 "af_sky": {"Elohav":"ˈɛlohɑv","Elohaychem":"ɛloˈheɪkɛm","Elohayka":"ɛloˈheɪkɑ",
            "El Elyon":"ɛl, ɛliˈoʊn","Tseva'ot":"tseɪvɑˈoʊt","Yahudi":"jɑː huː diː","Yahudim":"jɑː huː diːm","El Shaddai":"ɛl ʃəˈdaɪ","HaMashiach":"hɑ, mɑʃˈiɑk"},
}
# S474: blended voices — a new voice id made by mixing Kokoro style vectors.
# "mix" is the recipe; "names" says whose settled name list the blend uses.
BLENDS = {
 "liam30_echo70": {"mix":[("am_liam",0.30),("am_echo",0.70)], "names":"am_echo"},
 "liam40_echo60": {"mix":[("am_liam",0.40),("am_echo",0.60)], "names":"am_echo"},
 "liam50_echo50": {"mix":[("am_liam",0.50),("am_echo",0.50)], "names":"am_echo"},
}
_BASE_IPA=dict(IPA)
def use_voice(voice):
    # S470: reset to the shared list first so one voice's picks never leak into another.
    names = BLENDS[voice]["names"] if voice in BLENDS else voice
    IPA.clear(); IPA.update(_BASE_IPA); IPA.update(IPA_BY_VOICE.get(names,{}))
    if voice in BLENDS: IPA.update(IPA_BY_VOICE.get(voice,{}))  # a blend can carry its own tuned names too
def voice_style(k, voice):
    """What to hand Kokoro as voice=: the plain name, or the mixed style for a blend."""
    if voice not in BLENDS: return voice
    return sum(w*k.get_voice_style(v) for v,w in BLENDS[voice]["mix"])
def voice_lang(voice):
    base = BLENDS[voice]["mix"][0][0] if voice in BLENDS else voice
    return "en-gb" if base.startswith("b") else "en-us"
RESPELL = {
 "El Elyon":"El El-yohn","El Shaddai":"El Shah-dye","El Gibbor":"El Gib-bor","El Olam":"El Oh-lahm",
 "Elohayka":"El-oh-hy-kah","Elohaychem":"El-oh-hy-kem","Eloheinu":"El-oh-hay-noo",  # S470: Eloheinu + Elohai settled by ear (Echo + Sky); others on this line not yet
 "Elohav":"El-oh-hahv","Elohai":"El-oh-hy",  # S470: Eloheinu + Elohai settled by ear (Echo + Sky); others on this line not yet

 "HaMashiach":"Hah-mah-shee-ak","Yahudim":"Yah-hoo-deem","Yahudi":"Yah-hoo-dee",
 
 "Tseva'ot":"Tseh-vah-ote","Shammah":"Shah-mah","Rapha":"Rah-fah","Shalom":"Shah-lohm","Yireh":"Yir-eh",
 "Nissi":"Nee-see","Ra'ah":"Rah-ah","Tsidkenu":"Tsid-keh-noo",
 # Partner-library names (S444): standard pronunciations where the default voice slips.
 "Tobit":"Toe-bit","Sirach":"Seer-ak","Maccabeus":"Mack-uh-bee-us","Maccabees":"Mack-uh-beez",
 "Holofernes":"Hol-uh-fur-neez","Beliar":"Bee-lee-ar","Phanuel":"Fan-yoo-el","Lamech":"Lah-mek","Sammael":"Sam-ay-el",
 "Uriel":"Yoor-ee-el","Azazel":"Ah-zah-zel","Raphael":"Raf-ay-el","Mattathias":"Mat-uh-thy-us","Esdras":"Ez-druss",
}
_rk=sorted(RESPELL,key=len,reverse=True)
_rrx=re.compile(r"(?<![\w'-])("+"|".join(map(re.escape,_rk))+r")(?='s\b|[^\w'-]|$)")
_irx=re.compile(r"(?<![\w'-])(Yahuah|Yahusha|Elohim|Yashar'el|Yahudah|Adonai|Ruach|HaKodesh|Enoch|Eve|Baruch|[Ll]ive(?! coals?\b))(?=(['’]s)?\b)")
# S444 — speech-only fixes for divine names the restoration pipeline missed in
# the app text (LORD'S, small-caps GOD, JEHOVAH). The text itself still needs
# fixing in the app; these keep the recordings right meanwhile.
SPEECH_FIXES=[
 # S471 (Yoshi): Psalm 23:1 reads "Yahuah Ra'ah (The LORD is my shepherd)" on the page; the
 # audio text drops the bracket and with it the whole sentence. Spoken as Yoshi set it:
 (r"\bYahuah Ra'ah;","Yahuah is my shepherd;"),
 (r"Yahuah OF LORDS","Lord of lords"),
 (r"\b[Tt]he LORD[’']S\b","Yahuah's"),
 (r"\bLORD[’']S\b","Yahuah's"),
 (r"\bTHE Yahuah\b","Yahuah"),
 (r"\bAdonai GOD\b","Adonai Yahuah"),
 (r"\bGOD Adonai\b","Yahuah Adonai"),
 (r"\bTHY GOD\b","thy Elohim"),
 (r"\bUNKNOWN GOD\b","unknown god"),
 (r"\bYahuah JEHOVAH\b","Yah Yahuah"),
 (r"\bJEHOVAH\b","Yahuah"),
 (r"\bGOD\b","Yahuah"),
]
def to_phonemes(k, text, lang):
    text=text.replace("’","'").replace("‘","'")
    for a,b in SPEECH_FIXES: text=re.sub(a,b,text)
    # Small-caps / all-caps words ("HOLINESS TO", "KING OF KINGS") would be spelled out letter by letter.
    text=re.sub(r"\b[A-Z]{2,}\b",lambda m:m.group(0).lower(),text)
    # S470: names with a set pronunciation (IPA, incl. per-voice) win over respellings,
    # and the name pattern is built from the current list so per-voice names apply.
    rk=sorted((x for x in RESPELL if x not in IPA),key=len,reverse=True)
    rrx=re.compile(r"(?<![\w'-])("+"|".join(map(re.escape,rk))+r")(?='s\b|[^\w'-]|$)")
    text=rrx.sub(lambda m:RESPELL[m.group(1)],text)
    ik=sorted((x for x in IPA if x not in ("live","Live")),key=len,reverse=True)
    irx=re.compile(r"(?<![\w'-])("+"|".join(map(re.escape,ik))+r"|[Ll]ive(?! coals?\b))(?=(['’]s)?\b)")
    out=[];pos=0
    for m in irx.finditer(text):
        pre=text[pos:m.start()]
        if pre.strip(): out.append(k.tokenizer.phonemize(pre,lang))
        out.append(IPA[m.group(1)]+("z" if m.group(2) else "")); pos=m.end()+(2 if m.group(2) else 0)
    rest=text[pos:]
    if rest.strip(): out.append(k.tokenizer.phonemize(rest,lang))
    return " ".join(p.strip() for p in out if p.strip())
