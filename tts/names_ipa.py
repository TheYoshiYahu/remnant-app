import re
from kokoro_onnx import Kokoro
# Fixed pronunciations as IPA so nothing around a name can bleed into it.
IPA = {
 "Yahuah":"ˈiːˈɑːˈuːˈɑː", "Yahusha":"ˈiːˈɑːˈuːʃˈɑː",
}
RESPELL = {
 "Ruach HaKodesh":"Roo-ak Hah-koh-desh","El Elyon":"El El-yohn","El Shaddai":"El Shah-dye","El Gibbor":"El Gib-bor","El Olam":"El Oh-lahm",
 "Elohim":"El-oh-heem","Elohayka":"El-oh-hy-kah","Elohaychem":"El-oh-hy-kem","Eloheinu":"El-oh-hay-noo","Elohav":"El-oh-hahv","Elohai":"El-oh-hy",
 "Adonai":"Ah-doh-nye","HaMashiach":"Hah-mah-shee-ak","Yashar'el":"Yah-shar-el","Yahudah":"Yah-hoo-dah","Yahudim":"Yah-hoo-deem","Yahudi":"Yah-hoo-dee",
 "Ruach":"Roo-ak","HaKodesh":"Hah-koh-desh",
 "Tseva'ot":"Tseh-vah-ote","Shammah":"Shah-mah","Rapha":"Rah-fah","Shalom":"Shah-lohm","Yireh":"Yir-eh",
 "Nissi":"Nee-see","Ra'ah":"Rah-ah","Tsidkenu":"Tsid-keh-noo",
}
_rk=sorted(RESPELL,key=len,reverse=True)
_rrx=re.compile(r"(?<![\w'-])("+"|".join(map(re.escape,_rk))+r")(?='s\b|[^\w'-]|$)")
_irx=re.compile(r"(?<![\w'-])(Yahuah|Yahusha)(?=('s)?\b)")
# S444 — speech-only fixes for divine names the restoration pipeline missed in
# the app text (LORD'S, small-caps GOD, JEHOVAH). The text itself still needs
# fixing in the app; these keep the recordings right meanwhile.
SPEECH_FIXES=[
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
    for a,b in SPEECH_FIXES: text=re.sub(a,b,text)
    # Small-caps / all-caps words ("HOLINESS TO", "KING OF KINGS") would be spelled out letter by letter.
    text=re.sub(r"\b[A-Z]{2,}\b",lambda m:m.group(0).lower(),text)
    text=_rrx.sub(lambda m:RESPELL[m.group(1)],text)
    out=[];pos=0
    for m in _irx.finditer(text):
        pre=text[pos:m.start()]
        if pre.strip(): out.append(k.tokenizer.phonemize(pre,lang))
        out.append(IPA[m.group(1)]+("z" if m.group(2) else "")); pos=m.end()+(2 if m.group(2) else 0)
    rest=text[pos:]
    if rest.strip(): out.append(k.tokenizer.phonemize(rest,lang))
    return " ".join(p.strip() for p in out if p.strip())
