-- session-162 — lexicon_callouts V1 (34 author-reviewed framework callouts)
-- Phase 9.3. Spec: DESIGN_LANGUAGE.md §26. Voice-gate: outputs/S162_CALLOUT_REVIEW.md.
-- 0 Red Line violations in the set per the S162 voice-gate pass.
-- 16 Hebrew + 18 Greek = 34 rows.
-- DEPENDS ON: session162_lexicon_tables.sql (creates lexicon_callouts table).
--
-- Re-runnable: each row uses ON CONFLICT (strong_number) DO UPDATE so the
-- migration can be re-applied to update existing callouts without dropping.

BEGIN;

-- G0040_hagios.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G0040',
    'hagios',
    'Lexicons gloss holy/set-apart; Christian register softens to moral-purity, treats "the hagioi" as self-selected confessing class',
    $callout$The inherited reading hands *hagios* across in three softened registers: *holy* (a generic moral elevation), *sacred* (a thing or person the institution has consecrated), and *saint* (a confessing Christian, or in the older fabric, the canonized dead). Under all three the word floats free of its covenant anchor. The Christian register narrows it further: *the hagioi* become the self-selected class of those who said the prayer, joined the church, and were thereby reckoned among the saved — a category open to anyone of any people who confesses correctly. The Greek word carries none of that. *Hagios* is the Septuagint's translation of the Hebrew *qadosh* — set-apart-unto-Yahuah — and it carries the same covenant-specific set-apartness the prophets had been speaking for centuries before the Greek translators ever reached for it. The set-apartness is not a moral altitude the believer achieves and not a confessional badge the institution issues. It is the bond of a people the Father called by name, anchored in his name, into which his own are drawn by being his.

The architecture is laid down at Sinai and never moves:

> *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar'el (Israel).* (Exodus 19:6)

*Holy nation* — *goy qadosh* in the Hebrew, *ethnos hagion* in the Greek of the LXX. The set-apartness is named to the children of Yashar'el (Israel), to a specific people gathered out of Mitsrayim (Egypt) and drawn to the mountain. *Hagios* enters the Greek scriptures already carrying that bond. When Kepha (Peter) writes to the scattered of the diaspora, he reaches for the same line without altering a syllable of its substance:

> *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light.* (1 Peter 2:9)

Kepha (Peter) is not handing the Sinai vocabulary to a new self-selected class. He is naming the scattered seed of Yashar'el (Israel) as what they were before the foundation of the world and what they are being restored to now — *which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). That is Hosea 1's Lo-Ammi line — *not my people, now my people* — quoted by an apostle into the ears of the lost sheep coming home. The *hagioi* of his letter are the gathered remnant of the scattered tribes, not a religious category open by confession.

Sha'ul (Paul) writes to the same people. When his letters open *to the saints which are at Ephesus,* *to the saints which are at Rome,* *unto the assembly of Elohim (God) which is at Corinth, to them that are sanctified in the Messiah (Christ) Yahusha (Jesus), called to be saints,* he is not addressing pagan converts who confessed the right formula and were thereby spliced into a metaphorical Yashar'el (Israel). He is addressing the scattered seed living as Gentiles among the nations — the lost sheep of the house of Yashar'el (Israel) to whom he was sent (Matthew 15:24; Romans 11:13–14; Acts 13:46–47). The *hagioi* in the address line are the called-out coming home through the Spirit-written new covenant the prophets had named:

> *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The Ruach HaKodesh (Holy Spirit) who writes the *torah* on the inward parts is the same Spirit who set apart the people at Sinai. He does not set apart a new self-selected community by stripping the covenant lineage out and installing belief in its place. He sets apart the covenant lineage the Father has been gathering all along, and he writes the *torah* he himself spoke at the mountain on the hearts of those he is bringing home. The set-apartness *hagios* names is the work of the same Spirit on the same people across both Testaments. The Christian gospel of *the hagioi are those who confessed,* which lifts the word out of its *qadosh* register and re-mounts it as a credential of inclusion, is the false inclusion gospel under another costume — and it erases the gathering by replacing the called-out people with a community of self-selection.

The cause-and-effect runs the way the Father set it. *My sheep hear my voice* (John 10:27). The hearing does not make a person *hagios*; the hearing reveals what was already true. The one set apart hears because he is set apart, named from the foundation of the world, sealed by the Spirit who set the people apart at Sinai and now writes the covenant on the heart of the gathered. *Hagios* is the word for that bond — the Father's claim on his own, the substance Sinai named, the inheritance the prophets promised, the gathering the apostles addressed by letter. Restore *hagios* to its *qadosh* register and the *hagioi* of the apostolic letters come back into view as what they always were: a kingdom of priests, an holy nation, the called-out gathered home.$callout$,
    ARRAY['1','3','5','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G0065_agrielaios.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G0065',
    'agrielaios',
    'Lexicons gloss wild olive tree / branch grafted in by faith',
    $callout$The lexicons gloss *agrielaios* as *wild olive tree,* and the inherited pulpit hangs the whole inclusion gospel on the gloss. Romans 11:17–24 gets collapsed into a single picture: the natural Yahudi (Jewish) branches were broken off in unbelief, and non-Yashar'el (non-Israelite) Gentiles were spliced into the covenant tree by faith-confession in their place. The wild olive, in that reading, is the believing nations grafted into a Yahudi (Jewish) root by the act of believing. The whole architecture of *the church as the new Israel* rests on the lexicons' silent assumption that *agrielaios* names an outsider.

The word does not name an outsider. The wild olive is olive. It is the same species — the same tree — grown wild because it was uncultivated, separated from the root, left to the elements of the field. Paul's olive metaphor stays inside its own botany. Both branches on the tree are Yashar'el (Israel). The natural branches are the covenant lineage of the patriarchs — the line of Adam carried through Avraham (Abraham), Yitschaq (Isaac), and Ya'aqov (Jacob) into the twelve tribes — and they were broken off when both houses fell into unbelief and were scattered. The wild olive branches are the living descendants of those broken-off — the seed of Yashar'el grown wild among the nations through the Assyrian exile of 722 BCE, the very *Lo-Ammi* people Hosea named:

> *Yet the number of the children of Yashar'el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

No non-olive branch is grafted into the tree by mere faith-confession. The wild olive comes home through the journey the prophets named: *gathered out of the nations* (Ezekiel 37:21), *brought under the rod* (Ezekiel 20:37) where the rod sifts and *purges out the rebels* (Ezekiel 20:38), *brought into the bond of the new covenant* (Jeremiah 31:31), and then — at the end of the journey, not at its doorway — grafted into the natural root of the fathers:

> *For if thou wert cut out of the olive tree which is wild by nature, and wert graffed contrary to nature into a good olive tree: how much more shall these, which be the natural branches, be graffed into their own olive tree?* (Romans 11:24)

The verse says *their own olive tree.* The wild olive descendants are coming home to the root their own forefathers were broken off from. They are not strangers being adopted into a tree that was never theirs; they are seed being grafted back into the lineage that was always theirs. The lexicons' *grafted in by faith* hides what *grafted into their own olive tree* names. Restore the word to the gathering it actually names, and the false inclusion gospel collapses with it.$callout$,
    ARRAY['11']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G0932_basileia.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G0932',
    'basileia',
    'Lexicons gloss kingdom / royal power / sovereignty',
    $callout$The lexicons gloss *basileia* as *kingdom, royal power, sovereignty,* and the entry hands the word over to whatever the reader's inherited tradition has already done with it. In the Christian register that means one of two things: a present spiritual abstraction the believer enters at conversion (the kingdom is *within you,* read as inwardness), or a heaven-after-death destination that quietly replaces the prophetic kingdom altogether. Both readings dissolve the geography, dissolve the throne, dissolve the gathered remnant, and dissolve the priestly office the prophets named. The word the gospels put on Yahusha's (Jesus's) lips loses every concrete edge it carried.

The kingdom the prophets named is not an inwardness and not a deferred heaven. It is the reign of the Messiah on the earth, with a gathered people serving as kings and priests in the land of promise. Exodus 19:6 names the office at Sinai — *and ye shall be unto me a kingdom of priests, and an holy nation* — and Isaiah 61:6 names the destination of the gathered remnant after the dreadful day. Revelation closes the canon with the same office, named again as the destination of the redeemed:

> *And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth.* (Revelation 5:10)

Reign. On the earth. The geography the lexicons drop, the prophets keep. The destination of the journey home — gathered out of the nations, sifted in the wilderness, brought under the rod, brought into the bond of the new covenant, brought into the land — is a kingdom of priests under the reign of Yahusha (Jesus) on a real mountain in a real land, with the nations left alive after the day receiving priestly instruction from the gathered seed. That is *basileia.* Not a present-tense inwardness, not a sky-above replacement, but the literal reign the prophets named and the apostles confirmed.

Restore the word and the gospel sentences sharpen. *Repent: for the kingdom of heaven is at hand* is not an invitation to a private spiritual state; it is the herald's announcement that the long-promised reign is closing in. *Thy kingdom come* is not a prayer for inwardness; it is the prayer that the prophetic gathering would complete and the throne would stand on the earth. The lexicons' generic gloss lets the inherited reading float free of geography. The framework's reading anchors it back to the mountain, the land, the gathered, and the throne.$callout$,
    ARRAY['1','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G1343_dikaiosune.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G1343',
    'dikaiosune',
    'Lexicons gloss righteousness / justification with the Reformation forensic register often hanging on the entry',
    $callout$The lexicons gloss *dikaiosune* as *righteousness* or *justification,* and the Reformation's forensic register often hangs on the entry — *imputed righteousness, the alien righteousness credited to the believer's account, the legal verdict pronounced over the sinner who has done nothing to earn it.* That register is one Reformation lens read back through a sixteenth-century courtroom; it is not the word's settled meaning. *Dikaiosune* is the Greek the LXX reaches for when it renders *tsedek* and *tsedeqah* on the Hebrew side — the covenant-rightness the prophets gave the word, the substance the Father puts his own name to:

> *In his days Yahudah (Judah) shall be saved, and Yashar'el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah-Tsidkenu (the LORD our Righteousness).* (Jeremiah 23:6)

The righteousness named there is not a verdict transferred to a passive account-holder. It is the Father's own covenant-rightness made the inheritance of the gathered remnant — Yahuah-Tsidkenu, *Yahuah our Righteousness,* the name worn by the King who reigns over the restored house of Yashar'el and the restored house of Yahudah. *Dikaiosune* carries that weight when Paul writes it. *For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by his faith* (Romans 1:17) — and the *faith* Habakkuk names is *emunah,* covenant-faithfulness, not the bare belief the Reformation read back into it.

Yahusha (Jesus) himself names the active register the word carries:

> *Blessed are they which do hunger and thirst after righteousness: for they shall be filled.* (Matthew 5:6)

You do not hunger and thirst after a forensic transaction already complete in your account. You hunger and thirst after a way of life — the Torah-shaped covenant-rightness the Father gives by his Spirit to the new heart, the inheritance worked out in walking with him. Justification before the Father is by faith and by promise; the covenant life of the justified is *dikaiosune* lived — Spirit-empowered Torah, the same instruction now written on the inward parts (Jeremiah 31:33). The two questions are different and they never compete. What the lexicons collapse into a single Reformation slot the framework holds apart, and the word lands where the prophets always had it: on the gathered seed walking in the rightness of the Father whose name is Yahuah-Tsidkenu.$callout$,
    ARRAY['5','11']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G1484_ethne.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G1484',
    'ethne',
    'Lexicons gloss Gentiles / nations / heathen and collapse the term to the Jew-vs-Gentile binary',
    $callout$The lexicons gloss *ethne* as *Gentiles, nations, heathen,* and the inherited pulpit flattens the word into one side of a two-category world: Yahudim (Jews) on one side, everybody else on the other. Once that binary is in the reader's hand, every Pauline *ethne* automatically reads as *non-Yashar'el (non-Israelite) outsiders being brought into the covenant by faith.* The whole prophetic gathering of the twelve tribes disappears behind a word the lexicons rendered without ever asking who the apostle was actually writing to.

The word itself names a category in the world — *the nations* — and Paul's mission ran into that category looking for a specific people inside it. Hosea had named them long before: scattered through the Assyrian exile, lost to their language, lost to their Torah, lost to the covenant identity they had been born to, indistinguishable on the surface from the peoples among whom they had been dispersed. *Lo-Ammi* — *not my people.* Yet the same prophet who spoke their unmaking spoke their gathering in the next breath:

> *Yet the number of the children of Yashar'el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

Paul quoted that verse at his audience. Not at theoretical Gentiles being told about Yashar'el (Israel) from the outside — at the people in front of him, telling them who they really were:

> *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved. And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God).* (Romans 9:25–26)

The Lo-Ammi reversal is not the inclusion of unrelated peoples. It is the gathering of scattered seed. The apostle who quoted Hosea 1:10 at his *ethne* audience was telling the lost sheep of the house of Yashar'el (Israel) — living as Gentiles, walking as Gentiles, having forgotten they were ever anything else — that the *not my people* condition was being undone in them, because they had been seed all along. Restore the word from the binary and the lexicons' *Gentiles* gives back what it has been hiding: the prophetic gathering Paul was sent to.$callout$,
    ARRAY['1']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G1577_ekklesia.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G1577',
    'ekklesia',
    'Lexicons gloss church / assembly / congregation with the institutional-Christian church hanging on the entry',
    $callout$The lexicons gloss *ekklesia* as *church, assembly, congregation,* and the institutional-Christian *church* hangs on the entry — the building down the street, the denomination on the sign, the seven-centuries-old institution the Reformation inherited from Rome without ever examining the inheritance. That gloss reads back into the Greek New Testament a structure that did not exist when the word was written. *Ekklesia* in the apostolic writings is the called-out assembly of Yashar'el — the gathered people Yahuah is calling home — and the word's plainest definition is given by Stephen at his trial:

> *This is he, that was in the church (ekklesia) in the wilderness with the angel which spake to him in the mount Sinai, and with our fathers: who received the lively oracles to give unto us.* (Acts 7:38)

The first *ekklesia* the New Testament names is the congregation at Sinai — the gathered tribes who heard the voice of Yahuah and received the Torah. That is the substance the word carries. When Yahusha (Messiah / Jesus) says *I will build my ekklesia* (Matthew 16:18), he is naming the continuation of the Sinai assembly — the gathered remnant of all twelve tribes, called out of the nations, brought under the rod, brought into the bond of the new covenant. The *ekklesia* of the Greek New Testament is the called-out seed; it is never the horn's institution of Daniel 7.

The Hebrews writer names the same gathering by its destination:

> *But ye are come unto mount Tsion (Zion), and unto the city of the living Elohim (God), the heavenly Yerushalayim (Jerusalem), and to an innumerable company of angels, to the general assembly and church (ekklesia) of the firstborn, which are written in heaven, and to Elohim the Judge of all, and to the spirits of just men made perfect.* (Hebrews 12:22–23)

The *ekklesia of the firstborn* is the gathered remnant whose names were written in the Book of Life from the foundation of the world — the sons of Adam called out of every nation, the wheat sifted in the wilderness of the people, the kingdom of priests prepared for the millennial reign. The institution that calls itself *the church* today stood up at Constantine's Sunday Law in 321 AD and the Council of Laodicea in 363 AD — the antichrist seat downstream of Daniel 7:25, the horn that thinks to change times and seasons. The Reformation walked out of Rome's house but carried Rome's *church* out the door without looking at the word. The *ekklesia* of the apostles is not the building down the street; the *ekklesia* of the apostles is the gathered firstborn of Yashar'el coming home to the Father whose name they bear.$callout$,
    ARRAY['9']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G2041_erga.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G2041',
    'erga',
    'Lexicons gloss works / deeds / labor and collapse erga nomou into Torah-observance broadly',
    $callout$The lexicons gloss *erga* as *works / deeds / labor,* and the inherited reading takes Paul's phrase *erga nomou* — *works of the law* — and flattens it into Torah-keeping in general. Once the flattening is in the reader's hand, every Pauline rebuke of *works of the law* reads as a rebuke of Sabbath-keeping, of feast-keeping, of the dietary commandments, of any obedience to the covenant instruction at all. The pulpit then reaches for Galatians as the proof that the Torah-life Yahuah commanded is the bondage the Messiah delivered the believer from. The flattening is the whole engine of the antinomian gospel, and it lives inside a lexicon gloss that never asked what the agitators in Galatia were actually preaching.

What the agitators were preaching is on the page of Acts. *Except ye be circumcised after the manner of Mosheh (Moses), ye cannot be saved* (Acts 15:1). The error is not *add Torah to faith.* The error is *ritual conversion confers covenant standing* — be circumcised, become a Yahudi (Jew), and you are in the saved community. *Erga nomou* is the technical name for that flesh-credential system: the circumcision party's gospel that the rite makes the man. Paul argued against it the whole length of Galatians, and the verse the pulpit reads as anti-Torah is in fact anti-flesh-credential-as-doorway:

> *Knowing that a man is not justified by the works of the law, but by the faith of Yahusha (Jesus) the Messiah, even we have believed in Yahusha (Jesus) the Messiah, that we might be justified by the faith of the Messiah, and not by the works of the law: for by the works of the law shall no flesh be justified.* (Galatians 2:16)

The same Paul who wrote that verse walked into the Temple a chapter past the council and bodily refuted the slander that he taught the Yahudim (Jews) to forsake Mosheh:

> *Do therefore this that we say to thee: We have four men which have a vow on them; them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law... Then Paul took the men, and the next day purifying himself with them entered into the temple.* (Acts 21:23–26)

Paul paid for four men's Nazarite-vow offerings in the Temple. He walked the Torah he was being accused of abolishing. Galatians does not contradict Acts 21, because Galatians is not against the Torah. Galatians is against the flesh-credential gospel of the agitators — be circumcised, become a Yahudi (Jew), then you are saved. Restore *erga nomou* from *Torah-keeping in general* to the circumcision party's flesh-performance system, and Paul stops contradicting himself and starts agreeing with the prophets, with Yahusha (Jesus), and with the covenant life he kept until the day he died.$callout$,
    ARRAY['4','5']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G2098_euangelion.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G2098',
    'euangelion',
    'Lexicons gloss good news / gospel',
    $callout$The lexicons gloss *euangelion* as *good news, gospel,* and the entry hands the word over to whatever the inherited tradition has already decided the good news is about. In the Reformation register the word now means a doctrinal summary — *you are a sinner, Yahusha (Jesus) died for your sins, believe and be saved by grace through faith alone* — a justification-by-faith-alone formula the Reformers carved out of Paul's letters and then read backward into the gospels as if it were what Yahusha (Jesus) himself had been preaching. The substance the Messiah called *the gospel* gets quietly replaced by a sentence the Messiah never spoke.

Yahusha (Jesus) named his own gospel, and he named its audience in the same breath. The audience was not the world in general and not the nations as a category. The audience was a specific lost people the prophets had been promising would be gathered home:

> *But he answered and said, I am not sent but unto the lost sheep of the house of Yashar'el (Israel).* (Matthew 15:24)

The content of the proclamation matched the audience. The gospel Yahusha (Jesus) carried through the towns of Galilee was not a Reformation atonement-formula but the announcement that the prophetic kingdom was at hand and the gathering of the scattered seed had begun:

> *And Yahusha (Jesus) went about all Galilee, teaching in their synagogues, and preaching the gospel of the kingdom, and healing every sickness and every disease among the people.* (Matthew 4:23)

The gospel of the kingdom is the gospel of the gathering. Lost sheep coming home. Twelve tribes being made one stick in the Father's hand (Ezekiel 37). The Messiah taking the throne the prophets named. The remnant entering the land as a kingdom of priests. That is what the apostles carried after Pentecost, that is what Paul carried into the synagogues and out among the *ethne* where the scattered seed was living as Gentiles, and that is the news the lexicons' generic *good news / gospel* has been quietly emptied of. Restore the word to what Yahusha (Jesus) called it — *the gospel of the kingdom* — and the proclamation stands again as the news of the gathering home, with the Reformation's truncated formula no longer occupying the space the prophetic announcement was meant to fill.$callout$,
    ARRAY['1','10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G2222_zoe.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G2222',
    'zoe',
    'Lexicons gloss life / eternal life / vitality',
    $callout$The lexicons gloss *zoe* as *life, eternal life, vitality,* and the inherited evangelical reading has shrunk those words down to a single thin idea: *escape from hell.* *Eternal life* in the modern pulpit means *fire-insurance* — a transaction completed at a single moment of belief, a stamped ticket guaranteeing a future destination, with the years between the stamp and the death untouched by the gift. The Greek *zoe* and the Hebrew register behind it carry nothing of that truncation. *Zoe* is the abundant covenant life lived now, lived under the rod of Ezekiel 20:37, lived through the gathering, lived into the millennial reign of HaMashiach (Christ) on the earth, and lived on into the new heavens and the new earth without break.

Yahusha (Jesus) named the substance of *zoe* in one of the most quoted and least heard sentences in the gospels:

> *The thief cometh not, but for to steal, and to kill, and to destroy: I am come that they might have life (zoe), and that they might have it more abundantly.* (John 10:10)

*Life, and that more abundantly.* Not a deferred ticket. A present substance — covenant life flowing now through the new heart, the Spirit-empowered walking that the prophets said the gathering would bring. The Reformation truncation reads *zoe* as the noun on the ticket; the framework reads *zoe* as the life the shepherd is feeding his sheep with on the way home.

The Hebrew register underneath is Yechezqel (Ezekiel) 36, the same chapter the new-covenant promise sits in, and the chapter the inherited reading walks past without ever asking what the new heart is *for*:

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The new heart is given so the covenant people walk in the statutes. The Spirit is poured out so the judgments are kept. *That* is the *zoe* the gospel of Yochanan (John) is talking about — the covenant life Yahuah is restoring to the gathered remnant, lived from the inside instead of the outside, in this present age and on into the reign and on into the new heavens. The Reformation's fire-insurance gospel made *zoe* into a stamped ticket the believer carries while the days between now and death are spent however the flesh wants to spend them; the prophets named *zoe* as the very life the new heart was given to walk. Restore the abundant covenant life Yahusha (Jesus) named, restore the new heart underneath the Greek, and *zoe* stops being a ticket the believer holds and becomes the life the believer is finally able to live — now, into the millennial reign with HaMashiach (Christ) on the earth, and into the new heavens and the new earth where the gathered remnant dwells with the Father forever.$callout$,
    ARRAY['5','10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G2453_ioudaios.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G2453',
    'Ioudaios',
    'Lexicons gloss Jew / Jewish / Judean',
    $callout$The lexicons gloss *Ioudaios* as *Jew, Jewish, Judean,* and the gloss sits inside a two-category world the entry itself does not name out loud — Yahudi (Jew) on one side, Gentile on the other, the whole of the covenant collapsed into the first slot and everyone else swept into the second. Once that binary is in the reader's hand, the rest of the New Testament is read through it: every *Ioudaios* a sealed-off ethnic-religious identity, every *ethnos* an outsider being brought in, the prophetic gathering of all twelve tribes nowhere on the page. The word that should have named one house of a two-house covenant people has been made to swallow the covenant whole.

The Greek *Ioudaios* is *Yahudi* — the singular and adjectival form of *Yahudah,* the southern house, the tribe with portions of Levi and Benjamin who stayed when the kingdom split. They kept their language. They kept the Torah in some form. They came back from Babylon and they carry an identifiable lineage to this day. They are not the enemy. They are also the lost sheep the prophets named — beloved, traced, gathered. They are *one house* of the covenant. The other house — the northern ten tribes, the scattered seed of Ephraim and Yosef — was divorced through the Assyrian captivity, dispersed among the nations, lost to language and identity, and is the other side of the prophetic gathering. Both houses are coming home.

The prophets show the gathering as two sticks made one in the Father's hand, gathered out of every nation under heaven:

> *Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Yoseph (Joseph), which is in the hand of Ephrayim (Ephraim), and the tribes of Yashar'el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand. And the sticks whereon thou writest shall be in thine hand before their eyes. And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar'el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land: and I will make them one nation in the land upon the mountains of Yashar'el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* (Ezekiel 37:19–22)

Two sticks, two houses, one gathering. The Yahudim (Jews) are one stick. The scattered seed is the other. The Jew-and-Gentile binary the lexicons hang on *Ioudaios* erases the second stick from the page and calls Yahuah a liar for having promised it. Restore the word — *Yahudi* — to one house of two, and the prophetic architecture stands again. The Yahudim are not the whole covenant; they are not outside it either; they are the southern house in a gathering the Father is bringing home in full.$callout$,
    ARRAY['1','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G2962_kyrios.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G2962',
    'kyrios',
    'Lexicons gloss Lord / master / sir',
    $callout$The lexicons gloss *kyrios* as *Lord, master, sir,* and every one of those glosses is a flattening. The English *Lord* already hides whether the Hebrew underneath was the name Yahuah pronounced over his people or the human title *adonai* spoken to a man on the road; the Greek *kyrios* carries the same flattening forward. When the seventy translators of the LXX reached for *kyrios,* they used the same word for the tetragrammaton and for an ordinary master, and the lexicon entry hands that ambiguity over to the reader without ever telling the reader which substance is underneath any given mention.

The framework restores what the gloss buried. Where the LXX rendered the tetragrammaton as *kyrios,* the Hebrew underneath is the name Yahuah; where the underlying was *adonai* spoken of a human title, the Hebrew underneath is *adonai.* The voice-skill source-echo convention surfaces both, every mention, every time — Yahuah (LORD) when the name is on the page, Adonai (Lord) when the human title is on the page — so the reader can see which substance the apostles were pointing at without having to know the underlying language. The English *Lord* in the inherited New Testament is a covering. The framework lifts the covering.

The substance matters most when Yahusha (Jesus) is named *kyrios.* The Hebrew underneath in those moments is the tetragrammaton — Yahuah himself — because *Yahusha* means *Yahuah saves,* and the apostles' confession was that the Formed cloud-rider of Daniel 7, the One who lorded over Yashar'el (Israel) through the wilderness and spoke from the fire, had taken on flesh and walked among them. Paul's hymn in Philippians lays the substance on the page:

> *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: that at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth; and that every tongue should confess that Yahusha (Jesus) HaMashiach (Christ) is Yahuah (Lord), to the glory of Elohim (God) the Father.* (Philippians 2:9–11)

Peter's Pentecost sermon names the same identification in one breath:

> *Therefore let all the house of Yashar'el (Israel) know assuredly, that Elohim (God) hath made that same Yahusha (Jesus), whom ye have crucified, both Yahuah (Lord) and HaMashiach (Christ).* (Acts 2:36)

The confession *Yahusha is kyrios* is not the confession that a teacher from Galilee has been awarded an honorific. It is the confession that the One the apostles followed is the Formed expression of the formless Father — the same Yahuah who walked in the cool of the garden, wrestled with Ya'aqov (Jacob), led the camp through the wilderness, and now reigns at the right hand of the Father in heaven. Restore the Hebrew underneath the Greek, restore the source-echo every mention, and *kyrios* stops being a generic honorific and becomes what the apostles were actually saying: the name above every name is the name the prophets always named, and the One who bore it in flesh is the One the gathered remnant is coming home to.$callout$,
    ARRAY['1']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G3551_nomos.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G3551',
    'nomos',
    'Lexicons gloss law / Mosaic law / legal system',
    $callout$The lexicons gloss *nomos* as *law / Mosaic law / legal system,* and the inherited pulpit takes those three weights and builds the whole *grace-against-law* gospel on top of them. Once *nomos* reads as *legal system,* every Pauline mention of it reads as the bondage the believer was delivered from; every contrast Paul draws between flesh-credential and promise gets re-aimed at the covenant instruction itself; and the gospel becomes the cancellation of the very Word the prophets said would be written on the new heart. The Reformation's *grace-not-law* sentence is the antichrist sentence at the very root of institutional Christianity's pulpit, and it is built on a lexicon entry that never asked what word the LXX translators were rendering when they reached for *nomos*.

The word *nomos* is the Greek that the seventy translators of the LXX used when they rendered *torah.* Same word, same instruction, same inheritance. When Paul writes *nomos,* he is writing the Greek of the Tanakh his audience read; he is naming what the prophets named — the covenant instruction Yahuah pointed out to his people as the way of life. He is not naming a different substance the Messiah came to abolish. He is naming the substance the prophets said would move from the stone tablet to the inward part:

> *But this shall be the covenant that I will make with the house of Yashar'el (Israel); After those days, saith Yahuah, I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

> *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

The new covenant is not the cancellation of *nomos.* The new covenant is *nomos* written on the heart by the Ruach HaKodesh (Holy Spirit) — the same Spirit who spoke at Sinai, causing the walking in statutes from the inside instead of the outside. The Reformation grammar that pits grace against law calls Yahuah a liar by erasing what Jeremiah and Ezekiel said the gathering would bring; the framework restores *nomos* to the inheritance the prophets named and lets Paul stand as the Torah-observant Yashar'eli (Israelite) of the tribe of Benjamin he always was. Where the lexicons collapse *nomos* into the system the believer escaped, the framework restores it as the *torah* of the living Elohim, the covenant the Father is writing on the new heart in this very age.$callout$,
    ARRAY['4','5']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G3807_paidagogos.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G3807',
    'paidagogos',
    'Lexicons gloss tutor / schoolmaster / pedagogue and treat the paidagogos as the Torah the believer graduated out of',
    $callout$The lexicons gloss *paidagogos* as *tutor / schoolmaster / pedagogue,* and the inherited pulpit reads Galatians 3:24–25 as the verse that retires the Torah from the believer's life. *Wherefore the law was our schoolmaster to bring us unto the Messiah... but after that faith is come, we are no longer under a schoolmaster.* In the inherited hand, the *schoolmaster* is the Torah, and *no longer under a schoolmaster* means the Torah has been outgrown — the believer has graduated from the covenant instruction into the freedom of faith. That reading is the engine of the *Torah-as-bondage* gospel, and it lives inside a lexicon gloss that quietly equates *paidagogos* with the covenant instruction Yahuah gave from Sinai.

The *paidagogos* in the Greco-Roman household was not the teacher you graduated from. He was the slave who walked the child to and from the actual teacher — a custodial escort, often harsh, who supervised the child during the season of immaturity until the child came into full sonship. Paul reaches for that figure to name the system the Galatians were being told they needed in order to belong: the agitators' flesh-credential schoolmaster, the circumcision party's *be-this-and-you-are-saved* gospel that was walking the believers in Galatia toward a salvation by ritual that was no salvation at all. Hear the verses with the schoolmaster restored to the agitators' system rather than to the Torah Yahuah gave:

> *Wherefore the law was our schoolmaster to bring us unto the Messiah, that we might be justified by faith. But after that faith is come, we are no longer under a schoolmaster. For ye are all the children of Elohim (God) by faith in the Messiah Yahusha (Jesus).* (Galatians 3:24–25)

Exiting the *paidagogos* is exiting the period of external supervision and entering full sonship — and the inheritance the son walks into includes the Torah. The new heart of Ezekiel does not erase the covenant instruction; it receives it from the inside:

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The son who comes of age is not the son who walks away from his Father's house. He is the son who finally lives in it. The Torah is what the new heart receives; the *paidagogos* is the agitators' substitute the Galatians were being told they needed in order to belong. Restore the word to the system Paul actually argued against, and the verse the pulpit weaponized against the Sabbath, the feasts, and the dietary commandments turns into the very verse that walks the son home to the Father's instruction, written now on the heart by the Ruach HaKodesh (Holy Spirit) who spoke it at Sinai.$callout$,
    ARRAY['4','5']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G4102_pistis.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G4102',
    'pistis',
    'Lexicons gloss faith/belief; Reformation built sola-fide on the gloss, collapsing covenant-faithfulness to mental assent',
    $callout$The lexicons hang three weights on *pistis*: faith, belief, trust. The Reformation took the second of the three, ran a Latin wire through it, and built the *sola fide* gospel on a credential the Greek word never named. *Pistis* in that reading becomes mental assent — the inward act of agreeing that the proposition is true — and the believer is justified by holding the proposition. The word is severed from the covenant life the prophets had been naming for centuries, pitted against the Torah the Spirit was given to write on the heart, and handed back to the reader as the half-sentence the Reformation kept while cutting the rest. *Pistis* is not mental assent. *Pistis* is the Greek-side rendering of *emunah* — the covenant-faithfulness of the prophets, the steady-walking the Father called his people to, the substance of a life that responds when Yahuah (God) calls.

When Paul reaches for the foundational verse of his whole argument, he reaches for Habakkuk:

> *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4)

The Hebrew word under *faith* is *emunah*. Paul quotes that verse at Romans 1:17, at Galatians 3:11, and the Hebrews writer quotes it at Hebrews 10:38 — three times the apostolic writing reaches back into the prophet's Hebrew to ground the gospel, and three times the underlying word is the same covenant-faithfulness the prophets had been naming for centuries before Paul ever wrote a letter. The apostle is not introducing a new credential over the prophets' heads. He is naming what they already named, in Greek, for the lost sheep of the house of Yashar'el (Israel) who had forgotten the Hebrew through long scattering among the nations. Same word. Same substance. Same covenant-keeping faithfulness.

The seam sharpens further at Galatians 2:16. The Reformation's inherited reading hears it as *justified by faith in Yahusha HaMashiach (Jesus Christ)* — the believer's inward assent to the proposition about him. The Greek runs the genitive the other direction. *Pisteos Iesou Christou* — *the faith of Yahusha HaMashiach (Jesus Christ).* It is the Messiah's own covenant-faithfulness — the *emunah* he walked, the obedience unto the tree, the faithfulness of the Son to the Father — and the believer is justified by being brought into that faithfulness, not by manufacturing a credential of his own. The door home was opened by his faithfulness; the one who enters walks the same Way he walked, in the same Spirit who empowered him. *In* the Messiah's *pistis*, not *by* a mental assent the Reformation invented and named with his word.

Ya'aqov (James) names the same substance, in the same Greek, and the inherited pulpit treats him as Paul's corrective when in fact he is Paul's confirmation:

> *What doth it profit, my brethren, though a man say he hath faith, and have not works? can faith save him? . . . Even so faith, if it hath not works, is dead, being alone.* (James 2:14, 17)

The word is *pistis* in every line. Ya'aqov (James) is not naming a different faith than Paul named; he is refusing to let the Reformation's later truncation be read backward into the apostolic writing. *Pistis* that does not walk is not the Greek word the apostles used and not the Hebrew word the prophets gave; it is the inherited Latin credential calling itself by their name. The walking is not added to the faith. The walking is the faith. *Emunah* in Hebrew, *pistis* in Greek, one substance the whole canon names consistently.

The Reformation read Paul through Latin and severed *pistis* from the covenant life *emunah* lived inside. *Sola fide* in standalone register pulls the word out of its covenant home, makes it a credential rather than a walking, and pits it against the very statutes the Father said the Spirit would write on the heart:

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The Ruach HaKodesh (Holy Spirit) who lives in the believer is the same Spirit who spoke at Sinai. He does not lead away from the Father's instruction; he causes the walking in it. *Pistis* is the Spirit-given walking that new heart was made to do. It is not faith *against* the statutes; it is the faithfulness *by which* the statutes are finally kept — the *emunah* of the prophets, in Greek, in the mouth of an apostle writing to the scattered seed coming home.

This is why no Christian doctrine built on the truncated half-sentence can stand as load-bearing in the framework's reading. The truest pulpit *sola fide* — the one that means it most sincerely, that preaches it most carefully, that hedges it most kindly — still rests on the Reformation's severing of *pistis* from *emunah* and so still hands the reader a credential where the prophets and the apostle named a walking. The framework completes the sentence the Reformation cut. Justification is the free gift of the Father, opened by the *pistis* of Yahusha HaMashiach (Jesus Christ), entered by the *emunah* the Spirit causes the willing heart to walk, lived in the statutes the new heart was made for. The apostle, the prophet, and the brother of the Master are naming one substance. *Pistis* is what *emunah* always was. The framework rejoins what the Reformation cut and hands the reader back the whole sentence the canon spoke.$callout$,
    ARRAY['2','5','10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G4151_pneuma.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G4151',
    'pneuma',
    'Lexicons gloss spirit / breath / wind, with the Spirit-vs-Torah Reformation reading threaded through the spirit-of-the-law / letter-of-the-law glosses',
    $callout$The lexicons gloss *pneuma* three ways at the surface — spirit, breath, wind — and then thread the Reformation's *spirit-of-the-law versus letter-of-the-law* reading through the entry as if Paul were pitting the indwelling Spirit against the Torah the Spirit himself spoke at Sinai. He was not. *Pneuma* in the Greek of the apostolic writings is the LXX's standing translation of *ruach* — the same Spirit, the same breath, the One who hovered at creation, the One who fell on the prophets, the One Yahuah (the LORD) promised to pour out on all flesh.

The promise the prophet carried names the substance the New Testament *pneuma* delivers:

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The Spirit indwells *and causes the believer to walk in the statutes.* That is the covenant logic the prophet laid down and the apostles inherited. Pentecost is that promise opening in the Greek register — *pneuma* poured out on all flesh, the *ruach* of the prophets falling on the gathered remnant:

> *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams.* (Acts 2:17)

Paul names what the Spirit-empowered life produces:

> *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* (Romans 8:4)

The Spirit's work is the Torah's fulfillment in the new heart, not its abolition. Where the lexicons let *pneuma* drift into the Reformation's *spirit-against-letter* grammar, the framework restores the line the prophets and the apostles held together: the Ruach HaKodesh (Holy Spirit) who spoke at Sinai is the same Spirit who indwells the believer, and he leads home to the way Yahuah (the LORD) laid down — never away from it.$callout$,
    ARRAY['6']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G4561_sarx.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G4561',
    'sarx',
    'Lexicons gloss flesh / body / human nature with dualistic Greek-philosophy reading',
    $callout$The lexicons gloss *sarx* as *flesh / body / human nature,* and the dualistic Greek-philosophy reading hangs quietly on the entry: the body is the seat of sin, the spirit is the escape from the body, and Paul's *flesh-versus-spirit* contrasts get pulled into a frame where the material is evil and the immaterial is good. That frame is Plato's, not Paul's. The Hebrew thought-world the apostles wrote from did not treat the body Yahuah (God) formed as evil. The opening of the canon names the body as the Father's own forming:

> *And Yahuah Elohim (the LORD God) formed Adam of the dust of the ground, and breathed into his nostrils the breath of life; and Adam became a living soul.* (Genesis 2:7)

The verdict over the whole creation including that body was *very good.*

The *sarx* Paul argues against in Galatians is not the body the Father formed. It is the flesh-credential gospel — the circumcision party's teaching that the cut in the foreskin, the bodily mark, the performed Jewish identity, was what made a man covenant. Paul's whole contention is that the credential-system, not the body, is what the Spirit-life replaces. Read the question Paul actually asks:

> *Are ye so foolish? having begun in the Spirit, are ye now made perfect by the flesh?* (Galatians 3:3)

The Galatians had begun in the Spirit — the Ruach HaKodesh (Holy Spirit) given to them as the seed of Yashar'el (Israel) returning to covenant life. The agitators were teaching that the beginning in the Spirit had to be completed by the flesh-credential — *get circumcised, become a Jew, then you are saved.* That is the *sarx* Paul rejects. The Reformation lifted Paul's language out of its argument with the circumcision party and pressed it into service against Torah itself, and the dualistic frame from the lexicons made the misreading sound natural: if *flesh* is the body and the body is evil, then *the works of the flesh* must be the things the body does, and Torah-keeping (a bodily practice) must therefore be of the flesh. The conclusion is exactly inverted from the argument.

Paul names the *sarx* in its Pauline register again in Romans:

> *For what the law could not do, in that it was weak through the flesh, Yahuah (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh: that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* (Romans 8:3–4)

The destination is *the righteousness of the law fulfilled in us* — Torah lived out in the Spirit-empowered new heart. Walking after the Spirit is walking in Torah, not away from it. The Spirit who lives in the believer is the Spirit who spoke at Sinai; he is not at war with the word he spoke. *Sarx* is the credential-system the Spirit replaces. The body Yahuah (God) formed is the temple the Spirit fills. The lexicons collapse the distinction; the framework restores it.$callout$,
    ARRAY['4','5']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G5485_charis.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G5485',
    'charis',
    'Lexicons gloss grace / unmerited favor in standalone register',
    $callout$The lexicons gloss *charis* as *grace, unmerited favor,* and the Reformation took the gloss and built a stand-alone gospel-summary on it: *saved by grace through faith.* True words — and a sentence cut in half. The pulpit then preached the half it kept as the whole, and the half it left out — *brought home to him and to his ways* — became the very thing the half-sentence was used to argue against. *Charis* against *nomos.* Grace against Torah. The gift turned into a wedge between the saved and the covenant the prophets said the saved would walk in. The grandmother who heard *saved by grace through faith* loved the Father; the system that handed her a truncated gospel is what the framework dismantles.

Scripture never sets grace against the Way. Scripture sets grace as the means of return to it. The prophet Ezekiel names the anchor — the gathering is not for the people's record, it is for the sake of Yahuah's own name:

> *Therefore say unto the house of Yashar'el (Israel), Thus saith the Adonai Yahuah; I do not this for your sakes, O house of Yashar'el (Israel), but for mine holy name's sake, which ye have profaned among the heathen, whither ye went.* (Ezekiel 36:22)

And the apostle's own summary of what *charis* does in the believer's life puts the second half of the sentence back on the page:

> *For the grace of Elohim (God) that bringeth salvation hath appeared to all men, teaching us that, denying ungodliness and worldly lusts, we should live soberly, righteously, and godly in this present world.* (Titus 2:11–12)

*Charis* teaches the Way. *Charis* is the bridge that returns the scattered to the Father and to the covenant life the prophets named — the Spirit poured out, the new heart given, the statutes walked in from the inside. The fix is not to delete the grace-language. The fix is to complete the sentence the Reformation cut in half: by grace, brought home — to him, and to his ways. The consequences of walking off the Way are still real because the Way is still real, and the same Father who opened the door home wrote the Way that home runs on. *Charis* is the homecoming. The cross is the door. The Way is what the homecoming returns the willing to. Restore *charis* from a stand-alone formula to the bridge the prophets named, and the gospel stops being the cancellation of the covenant and becomes what it always was — the means by which the Father is gathering his family back into the life he made them for.$callout$,
    ARRAY['10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- G5547_christos.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'G5547',
    'Christos',
    'Lexicons gloss Christ / Messiah / anointed one',
    $callout$The lexicons gloss *Christos* as *Christ, Messiah, anointed one,* and the English *Christ* has been so thoroughly absorbed into the institutional-Christian title that most readers no longer hear a Hebrew word underneath at all. *Christ* sounds like a surname. It is not. It is the Greek translation of a Hebrew word the prophets used for the promised Branch of the house of David — *Mashiach,* with the article *HaMashiach,* *the Anointed One* — and the word the prophets used carries a covenant lineage the inherited gloss has emptied out.

The framework restores *Mashiach / HaMashiach* underneath the Greek every mention, and with it restores the figure the prophets actually named. Yirmeyahu (Jeremiah) gave the Branch his name in eight words that the inherited reading walks past:

> *Behold, the days come, saith Yahuah, that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth. In his days Yahudah (Judah) shall be saved, and Yashar'el (Israel) shall dwell safely: and this is his name whereby he shall be called, THE LORD OUR RIGHTEOUSNESS (Yahuah-Tsidkenu).* (Jeremiah 23:5–6)

The Branch is *Yahuah-Tsidkenu* — Yahuah our righteousness — because he is the One in whose days the two houses come home. Yahudah (Judah) is saved; the scattered seed of the northern house dwells safely. *HaMashiach* is not an institutional title hung on a religious office. *HaMashiach* is the Branch of David who carries the divine Name as his own name because he is the Formed expression of the formless Father — the One who proceeded from the Father before the foundation of the world and entered creation as the Word that spoke all things.

Dani'el (Daniel) saw him receiving the kingdom in vision, and the text preserves the kaph-comparative that lets the reader watch the incarnation and the cloud-riding in the same line:

> *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him. And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:13–14)

The figure is *like* the Son of Adam because he took on flesh, and the everlasting, indestructible kingdom belongs to him alone. Read in isolation the comparative appears to leave the identification open; read with the whole canon harmonized the alternatives collapse and the figure lands as Yahusha (Jesus) himself — the Formed cloud-rider, the Branch of Yirmeyahu (Jeremiah) 23, the Anointed One the prophets pointed to from Mosheh (Moses) forward. Restore *Mashiach / HaMashiach* underneath the Greek, restore the kaph the text preserves, and *Christos* stops being an institutional surname and becomes what the prophets always named — the Branch of David who bears the Father's own Name because he is the Formed One the Father drew from himself before time began.$callout$,
    ARRAY['12']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H0120_adam.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H0120',
    'adam',
    'Lexicons gloss man / mankind / human being',
    $callout$The lexicons gloss *adam* as *man / mankind / human being* — a generic for the species, the whole of humanity collapsed under a single term. The flattening is quiet and it is load-bearing for every system that needs the seed of promise to be a metaphor. If *adam* is *humanity in general,* then *thy seed* is *all who believe,* and the prophetic gathering of a specific paternal blood remnant has nowhere to land. The English translators reached for *man* because the antichrist reading needed *man* — a category open to anyone, attached to no one in particular.

The word does not name the species. *Adam* is *Adam* — a named figure with a body Yahuah (God) formed from the dust, a wife brought forth from his own side, and a seed-line carried forward from his loins. Genesis opens with two creation accounts the inherited reading harmonizes into one, and the harmonization hides the architecture. Genesis 1 names the peoples Yahuah created on the sixth day, male and female, blessed and told to fill the earth. Genesis 2 names Adam formed separately, set in the garden to tend it, given a woman drawn from his own body rather than taken from the nations already in the earth:

> *And Yahuah Elohim (the LORD God) formed Adam of the dust of the ground, and breathed into his nostrils the breath of life; and Adam became a living soul.* (Genesis 2:7)

From the beginning, two groups: the peoples of the earth, and the seed of Adam. *Adam* is the second group — the specific paternal blood-line through which every covenant promise runs. The *thy seed* spoken to Avraham (Abraham), to Yitschaq (Isaac), to Ya'aqov (Jacob), and through them into the twelve tribes of Yashar'el (Israel) hangs on *adam* carrying its specific weight. Strip the lineage out and *thy seed* becomes *all who confess,* the gathering becomes a metaphor, and the prophets become liars. The framework holds the lineage because the text does.

Paul reads Adam the same way:

> *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned... Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam's transgression.* (Romans 5:12, 14)

Adam is the federal head of a specific seed-line under whose head death reigned and through whose lineage the second Adam — Yahusha (Jesus), the Son of Adam — comes to undo what the first did. The whole of Romans 5 collapses if *adam* is *humanity in general.* Restore the word to the lineage it names, and the substance the framework rests on stands up where the lexicons buried it.$callout$,
    ARRAY['7','12']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H0530_emunah.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H0530',
    'emunah',
    'Lexicons gloss faithfulness / steadiness; Christian grammar collapses to mental-assent faith',
    $callout$The lexicons hang three weights on *emunah* — faithfulness, steadiness, firmness — and the lexicons themselves are not wrong to. The root *aman* (H0539) means *to be firm, to be steady, to be the kind of thing that holds.* *Emunah* is the noun-shape of that holding — the covenant-steadiness of one who keeps the bond. It is the substance the Father himself displays toward Yashar'el (Israel) — *a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4) — and the substance he asks of his people in return. The Reformation reached past the lexicons, picked the thinnest possible English gloss for the Greek seam, and installed it back over the Hebrew: *faith* as bare mental assent, *faith* as belief set against works, *faith* as the standalone credential that does the saving on its own and is broken if anything is asked of the one who holds it. The Hebrew word the prophets wrote meant *the steady walking of the covenant-keeper* before it ever meant *the inward agreement of the believer* in the Reformation's Latin.

Habakkuk is where the Reformation pitched its flag, and Habakkuk is where the framework restores the prophet's voice:

> *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4)

The Hebrew under *faith* is *emunah*. The prophet is standing on the watchtower with the Chaldean storm coming and Yahuah (God) has just told him the vision is for an appointed time and will not lie though it tarry. The contrast in the verse is between the proud one whose soul is lifted up — who will not hold when the storm comes — and the just one whose life is held together by *emunah,* by covenant-steadiness, by the long faithful walking-with-Yahuah that keeps on walking through the day of trouble. *The just shall live by his emunah* is the prophet's call to covenant-loyalty in the face of judgment. It is not the Reformation's proof-text for stand-alone belief severing the believer from covenant life. The verse is a witness *to* covenant life, not a release *from* it.

The apostle Ya'aqov (James) reads the word the way the prophets did:

> *What doth it profit, my brethren, though a man say he hath faith, and have not works? can faith save him?... For as the body without the spirit is dead, so faith without works is dead also.* (James 2:14, 26)

Ya'aqov is not contradicting Paul. He is naming the same *emunah* Habakkuk named, carried into the Greek as *pistis* — the very word the LXX used to translate *emunah* a century before the apostles wrote. *Pistis* and *emunah* name one substance: the covenant-keeping faithfulness scripture asks of the people because it is the substance the Father himself displays. The faithfulness that lives is the faithfulness that walks; the *faith* that does not walk is not the *emunah* the prophets carried and not the *pistis* the apostles wrote. It is a different thing wearing the same English word.

Justification and covenant-walking are two questions the prophets and the apostles never confused, and the framework keeps them separate the way scripture keeps them separate. A man is justified by the promise — Avraham (Abraham) counted righteous at Genesis 15:6 before he was circumcised in Genesis 17, the Messiah's atoning work the ground of every counted-righteous since. A justified man lives by *emunah* — the Spirit-empowered, covenant-steady walking-home that Ezekiel 36:26-27's new heart was given to do. The Reformation collapsed the two questions into one and answered both with bare mental assent, and the *emunah* of the prophet became the *sola fide* of the pulpit. The fix is not to delete the word *faith* from the verse. The fix is to let *emunah* mean what *emunah* means — the steady, Spirit-held walking-home the just have lived by since before Habakkuk wrote the line — and to let the gospel sentence the Reformation cut in half finish itself the way scripture wrote it. *Emunah* is the substance the new heart of the willing is given to carry, and the carrying is the life.$callout$,
    ARRAY['5','10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H1121_ben-adam.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H1121',
    'ben-adam',
    'Lexicons gloss son of man / mortal / human being',
    $callout$The lexicons gloss *ben adam* as *son of man / mortal / human being* — a Hebrew idiom for *a person,* a generic honorific, a poetic way of saying *one of the species.* The flattening hides what the construction actually says. *Ben* is *son of.* *Adam* is Adam — the named figure of Genesis 2, the head of a specific paternal blood-line. *Ben adam* is *son of Adam,* the lineage weight the English translators rendered into a generic the framework's whole reading of the Messiah depends on restoring.

The construction runs through the whole canon as a single substance. Ezekiel is addressed as *son of Adam* in nearly every chapter of his prophecy — not because Ezekiel is *a mortal* in the lexicons' generic sense, but because the address names him as one of the seed-line whom Yahuah (God) is speaking to about the seed-line. Psalm 8:4 names mortal-Adam as the one Yahuah (God) visits — *what is mortal man, that thou art mindful of him? and the son of Adam, that thou visitest him?* — and the visiting is the Father's own care for the seed he formed. And Yahusha (Jesus) takes the title for himself again and again in the gospels: not as *a human being among others,* but as *the Son of Adam,* the seed of promise made flesh, the One the prophets pointed to. Strip *adam* out and the Messianic title evaporates with it.

The kaph-comparative at Daniel 7:13 is where the title meets the incarnation, and the text's own move must be preserved:

> *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13)

The Aramaic is *kbar enash* — *like a son of mortal-man.* The text does not say *the Son of Adam came;* it says *one like the Son of Adam came.* Read in isolation, the comparative appears to leave the figure's identity open — and past commentary has reached for openings the text technically allows. But when the canon is brought to bear, the alternatives collapse and the figure lands as Yahusha (Jesus) himself: v.14's everlasting, indestructible kingdom belongs to him alone, the counterfeit's dominion is never everlasting, and the cloud-riding imagery of scripture (Psalm 104:3, Isaiah 19:1, Nahum 1:3, Revelation 1:7) is consistently the divine Son's own riding. The kaph is not identity-opening when scripture is allowed to harmonize. The kaph is incarnation-honoring. The figure resembles a son of mortal-man because he took on flesh, while remaining the Formed cloud-rider, the One who rides Yahuah's (God's) clouds.

The same kaph holds at Revelation 1:13 and Revelation 14:14 — *like the Son of Adam,* the named Standard preserved while the resemblance to flesh is named, both substances in view at once. The *Son of Man* of the gospels is not the inherited *human being* honorific. He is the Son of Adam, the seed of promise made flesh, the Formed cloud-rider who took on flesh and remains who he was, is, and is to come. Restore the lineage the translators flattened, preserve the kaph the canon preserves, and the Messianic title stands up where the gloss buried it.$callout$,
    ARRAY['12']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H1285_brit.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H1285',
    'brit',
    'Lexicons gloss covenant / pact / agreement as general bilateral instrument',
    $callout$The lexicons render *brit* as a general bilateral instrument — *covenant, pact, agreement, treaty.* The picture is two parties striking a deal, each carrying obligations, each holding the other to terms. That picture is borrowed from the courtroom and the marketplace, and it flattens what the prophets named. *Brit* in the prophets is not a contract negotiated between equals. It is the bond Yahuah brings his gathered remnant into after he has sifted them — the destination of the journey home, not the doorway and not the deal.

Read what Yahuah says he will do with the seed he gathers out of the nations:

> *And I will bring you out from the people, and will gather you out of the countries wherein ye are scattered, with a mighty hand, and with a stretched out arm, and with fury poured out. And I will bring you into the wilderness of the people, and there will I plead with you face to face... And I will cause you to pass under the rod, and I will bring you into the bond of the covenant.* (Ezekiel 20:34–37)

The bond of the covenant is what the gathered come into *after* the rod passes over them — after the post-harvest sifting in the wilderness of the people, after the rebels are purged out from among them. *Brit* names that bond. It is the inheritance the prophets promised the scattered seed of Yashar'el, not a contract anyone strikes with Yahuah by hand-raising or by signing on. The wild olive descendants do not enter the bond by faith-confession; the wild olive descendants come home through the journey — gathered out of the nations, brought under the rod, sifted, and *then* brought into the bond.

And where does the bond land when the gathering is finished? Yahuah names that too:

> *Behold, the days come, saith Yahuah, that I will make a new covenant with the house of Yashar'el (Israel), and with the house of Yahudah (Judah)... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:31, 33)

The bond is Torah written on the new heart by the Ruach HaKodesh (Holy Spirit) — the same instruction the Father gave at Sinai, now interior, now empowered, now kept from the inside out. *Brit* is the marriage of the gathered remnant to the Father whose name they bear. Not a deal. Not a transaction. The inheritance the prophets named, restored to the people the prophets named, on the heart Yahuah promised to write it on.$callout$,
    ARRAY['7','11']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H1471_goy.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H1471',
    'goy / goyim',
    'Lexicons gloss nation / Gentile / heathen generically',
    $callout$The lexicons gloss *goy* generically — *nation, Gentile, heathen* — and the entry sits flat on the page as if the word were simply a demographic term. The flattening matters because once *goy* is read as *anyone outside Yahudah (Judah),* the inherited pulpit can quietly fold the scattered ten tribes into the *goyim* (nations) category and treat the Romans 11 olive tree as room for the *goyim* to be grafted in by faith. The Hebrew word has been used to erase the very people it stands in distinction from.

The Hebrew distinction is clean. *Goy* names *the nations* — the peoples Yahuah (God) created in Genesis 1, the families of the earth out of which Avraham (Abraham) was called and set apart. The covenant people are not *the goyim;* they are *am Yahuah,* the people of Yahuah, formed out of Avraham's loins through Yitschaq (Isaac) and Ya'aqov (Jacob) into the twelve tribes. The nations are a category in the world, with their own histories, their own kings, their own destinies. They are not grafted into the olive tree of Yashar'el (Israel) by faith-confession in this age, and the prophets never promised they would be.

The nations do have a destination, and the prophets named it. After the dreadful day of Yahuah (God), after the burning of the counterfeit in the land and abroad, after the wheat is gathered and sifted in the wilderness of the people, the seed of promise enters the land as a kingdom of priests to the nations left alive — and the nations come up for instruction:

> *But ye shall be named the Priests of Yahuah (the LORD): men shall call you the Ministers of our Elohim (God): ye shall eat the riches of the Gentiles, and in their glory shall ye boast yourselves.* (Isaiah 61:6)

That is when the priestly relationship between the seed and the nations begins. Not now. Now is the gathering — the proclamation going out broadly because the citizens of the kingdom are scattered and we do not know them by sight. The nations are not the gathered, and the gathered are not the nations. *Goy* in the Hebrew preserves the distinction the prophets maintain through the restoration; the lexicons' generic gloss erases it. Restore the word and the directional structure of the prophetic story stands again.$callout$,
    ARRAY['1','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H1616_ger.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H1616',
    'ger',
    'Lexicons gloss stranger / sojourner / proselyte',
    $callout$The lexicons gloss *ger* as *stranger, sojourner, proselyte,* and the inherited pulpit reaches for Isaiah 56 as the prooftext: here, it is said, are the heathen being added to Yashar'el (Israel) by faith and Torah-keeping, the Old Testament foreshadow of the church-age inclusion of the nations. *Ger* becomes the entry-credential for anyone willing to attach themselves; the passage becomes the foundation for the false inclusion gospel in Hebrew clothing. The word the lexicons hand back has already been bent toward the conclusion the inherited system needs.

The Hebrew carries no such bend. *Ger* names one who lives *estranged from his own*, dwelling among a people not his own, holding no land of his own — and that condition is exactly the condition the exile produced in the scattered seed of Yashar'el. Both houses fell. The northern kingdom was divorced through the Assyrian captivity and scattered into the nations until they lost their language, their Torah, their covenant identity, their very name as Yashar'el. They became strangers — *gerim* — in the lands of their scattering, estranged from the covenant body they had been born to. The *sons of the stranger* who join themselves to Yahuah (the LORD) in Isaiah 56 are these — the lost sheep coming home, the *Lo-Ammi* condition reversing into *Ammi* under the call the prophets named:

> *Also the sons of the stranger, that join themselves to Yahuah (the LORD), to serve him, and to love the name of Yahuah (the LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant; even them will I bring to my holy mountain, and make them joyful in my house of prayer: their burnt offerings and their sacrifices shall be accepted upon mine altar; for mine house shall be called an house of prayer for all people.* (Isaiah 56:6–7)

Hosea heard the same gathering and named it as the seed of Yashar'el being called by their own name again:

> *Yet the number of the children of Yashar'el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

The *ger* of Isaiah 56 is the scattered being brought to the Father's holy mountain, brought back into the house of prayer, brought back into the identity the exile took from them. Not random pagan converts being credentialed in. Restore the word to the journey home it actually names, and the prophets stand again as the gathering-prophets they are.$callout$,
    ARRAY['1','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H2617_chesed.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H2617',
    'chesed',
    'Lexicons gloss mercy / kindness / loyalty in standalone register',
    $callout$The lexicons hang three weights on *chesed*: mercy (a soft-hearted disposition), kindness (a generic warmth), and loyalty (a contractual reliability). All three are real in the gloss; all three are unhooked from the covenant substance the word actually carries. *Chesed* is not Yahuah being nice. *Chesed* is Yahuah keeping the bond he swore to keep — covenant-faithfulness anchored in his own name, the steady-love that holds the homecoming sure when the people break and break and break again.

The prophet Ezekiel names the anchor plainly. The bond is not held for the sake of the people's record; it is held for the sake of Yahuah's name:

> *Therefore say unto the house of Yashar'el (Israel), Thus saith the Adonai Yahuah; I do not this for your sakes, O house of Yashar'el (Israel), but for mine holy name's sake, which ye have profaned among the heathen, whither ye went.* (Ezekiel 36:22)

Daniel prays the same way. He does not appeal to the merit of Yahudah (Judah); he appeals to the *chesed* of Yahuah on the strength of the name:

> *O my Elohim (God), incline thine ear, and hear; open thine eyes, and behold our desolations, and the city which is called by thy name: for we do not present our supplications before thee for our righteousnesses, but for thy great mercies. O Adonai, hear; O Adonai, forgive; O Adonai, hearken and do; defer not, for thine own sake, O my Elohim (God): for thy city and thy people are called by thy name.* (Daniel 9:18–19)

This is the substance the Reformation truncated when it severed grace from covenant and built a stand-alone formula on the cut-off half. *Saved by grace through faith* was lifted out of its sentence and called the whole gospel; the covenant the grace was returning the scattered to was quietly erased. But *chesed* is the substance behind every promise Yahuah ever made to gather what was scattered, and *chesed* is the substance the new heart of Ezekiel 36:26–27 will then live out from the inside. The grace is not the cancellation of the Way. The grace is the means of return to him *and* to his ways — the bond that carries the broken home, not a release from the homecoming itself.

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The cross stands in this same substance. Yahusha (Jesus) bore the curse on the tree to open a way home *through* it for the scattered seed who had walked into the curse by walking contrary to him — the door opened, the way made, the homecoming sure because the bond holds. The cross did not cancel the consequence-system the same Father wrote into the covenant; it opened the door back to the Way the curse was defending all along. *Depart from me, ye that work iniquity* (Matthew 7:23) is not the failure of *chesed*; it is *chesed* in its other direction — mercy toward those who said with their walk they did not want him, releasing the unwilling rather than chaining them to a house they spent their lives refusing to call home. One love, two directions, one bond.

Where the lexicons reduce *chesed* to mercy-in-standalone, the framework restores the seam: the mercy is real, and the mercy is the covenant-keeping faithfulness of the One whose name is the anchor. The bond holds because he holds it. The homecoming is sure because his name is sure. The new heart is given because the *chesed* that carried the people across the distance their breaking made is the same *chesed* that finally writes the Way into them from the inside, so the people can walk in the bond he has kept on their behalf the whole way through.$callout$,
    ARRAY['5','10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H3548_kohen.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H3548',
    'kohen',
    'Lexicons gloss priest; Christian register narrows to Levitical-fulfilled-away, leaves believer with metaphor of access',
    $callout$The lexicons gloss *kohen* as *priest* and the inherited Christian register narrows the word twice over. First it collapses *kohen* into the Levitical priesthood — one tribe, one tabernacle, one age — and then it teaches that priesthood as fulfilled-away in the Messiah, leaving the believer with *priesthood of all believers* as a metaphor of inner access. Two cuts on the same word: the office is shrunk to a sealed-off Levitical specialty, and then the sealed-off specialty is dissolved into a feeling of nearness. What the prophets actually named — *kohen* as the destination of the gathered covenant people serving as priests to the nations left alive on the earth — is erased between the two cuts.

The architecture is laid down at the foot of Sinai before the tribes are even sorted by their service:

> *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar'el (Israel).* (Exodus 19:6)

A kingdom of priests — the whole covenant people, set apart for a priestly relationship to those outside the covenant body. The Levitical priesthood that came after Sinai was a service-order *within* that kingdom; it was never the ceiling the word *kohen* pointed at. Yeshayahu (Isaiah) picks the same architecture up at the restoration and lays it down as the destination of the gathered:

> *But ye shall be named the Priests of Yahuah (the LORD): men shall call you the Ministers of our Elohim (God): ye shall eat the riches of the Gentiles, and in their glory shall ye boast yourselves.* (Isaiah 61:6)

And the Revelation of Yahusha (Jesus) closes the canon on the same word at the same destination, naming where the gathered will be when the office is taken up:

> *And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth.* (Revelation 5:10)

On the earth. Not in a metaphorical heaven, not as an interior posture, not as the dissolution of priesthood into a felt access to the Father. The gathered remnant of the covenant people, reigning with the Messiah as kings and priests on the earth, ministering to the nations left alive after the dreadful day of Yahuah (the LORD). That is the office the word *kohen* names at its destination.

The prophets map the journey the gathered take to reach that office. The wheat is *gathered out of the nations* where Yahuah (God) scattered them:

> *And I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land.* (Ezekiel 36:24)

The gathered are then *brought under the rod* in the wilderness of the people, where the chaff is sifted from the kernel and the rebels are purged out:

> *And I will cause you to pass under the rod, and I will bring you into the bond of the covenant: And I will purge out from among you the rebels, and them that transgress against me.* (Ezekiel 20:37–38)

And the sifted are brought into the bond of the new covenant Yirmeyahu (Jeremiah) named, with the Torah written on the heart:

> *Behold, the days come, saith Yahuah (the LORD), that I will make a new covenant with the house of Yashar'el (Israel), and with the house of Yahudah (Judah).* (Jeremiah 31:31)

The covenant people who pass through that journey — gathered, sifted under the rod, brought into the bond — are the *kohanim* (priests) the prophets named. The office is the destination, not the doorway. It is taken up by the sifted remnant in the millennial reign, on the earth, for the nations left alive who did not pass through the wheat-sifting because they were never wheat. The gathered minister to them as priests in that age. *That* is when any priestly relationship between the seed and the nations begins.

The Levitical priesthood was a service-order pointing at a higher order all along. The higher order is named when Avraham (Abraham) returns from the slaughter of the kings and is met by a priest-king:

> *And Melek Tsadiq (Melchizedek) king of Shalem brought forth bread and wine: and he was the priest of El Elyon (most high God).* (Genesis 14:18)

Priest and king together in one figure, before Levi was born, before Sinai, before the tabernacle. The Psalmist names the order as the Messiah's own:

> *Yahuah (the LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4)

And the writer to the Hebrews carries the same order through the resurrection of the Messiah:

> *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Hebrews 7:17)

The Melek Tsadiq (Melchizedek) order sits over the Levitical order. The Messiah carries the priest-king pattern — *kohen* and king at once, on the earth, forever. The gathered who reign with him as kings and priests on the earth (Revelation 5:10) are sifted into *that* order, not into a Levitical office fulfilled-away and not into a metaphor of access. The inheritance is the priest-king office the Messiah himself wears.

The inherited reading reduces *kohen* to a sealed-off tribe in a sealed-off age and then turns the believer's portion into an inner feeling. The prophets named *kohen* as the millennial office of the gathered seed of Yashar'el (Israel), reigning with the Messiah on the earth in the Melek Tsadiq (Melchizedek) order, serving as priests to the nations left alive after the dreadful day. The word is destination-language. Restore it and the journey home opens out into the kingdom of priests the Father set the seed apart for from Sinai forward.$callout$,
    ARRAY['1','7','11']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H4941_mishpat.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H4941',
    'mishpat',
    'Lexicons gloss judgment / justice / ordinance as generic legal proceeding',
    $callout$The lexicons gloss *mishpat* as *judgment, justice, ordinance, legal decision* — the language of a court issuing rulings, a magistrate handing down a verdict, a generic legal proceeding among the affairs of nations. That register flattens what the prophets named. *Mishpat* in Ezekiel is not a courtroom abstraction; it is the rod itself — the sifting Yahuah lays across his gathered people in the wilderness, the sorting that separates the wheat from the chaff and the goats from the sheep among the very ones he has brought home.

Hear Yahuah name what the rod does to the gathered:

> *And I will cause you to pass under the rod, and I will bring you into the bond of the covenant: And I will purge out from among you the rebels, and them that transgress against me: I will bring them forth out of the country where they sojourn, and they shall not enter into the land of Yashar'el (Israel): and ye shall know that I am Yahuah.* (Ezekiel 20:37–38)

The rod is *mishpat.* The harvest pulls the wheat out of the field of the nations, and the gathered wheat then passes under the rod — the post-harvest sifting that purges the rebels from among the gathered. *Many will say to me in that day, Lord, Lord... and then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:22–23) is spoken to wheat that did not bear fruit, never to tares. The judgments of Yahuah are the way he sorts his people into the kingdom and into the kingdom-of-priests inheritance — Spirit-empowered Torah on the new heart, fruit borne by the gathered, the rebels removed so the bond of the covenant is what it says it is.

This is why *mishpat* shows up in the prophets joined to *tsedeqah* over and over (Isaiah 1:27; Jeremiah 9:24; Amos 5:24) — covenant-rightness and covenant-sifting walk together as one motion of one Father. The rod and the bond are not opposed; the rod is what makes the bond what it is. The gathered who bear fruit enter the land as a kingdom of priests; the gathered who refuse the fruit are purged at the threshing floor. *Mishpat* is not a generic legal proceeding among the affairs of nations. It is the way the Shepherd sorts his own sheep, in the wilderness of the people, before he leads them home.$callout$,
    ARRAY['5','11']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H5971_am.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H5971',
    'am',
    'Lexicons gloss people generically',
    $callout$The lexicons gloss *am* as *people* in a generic register — any people, any grouping — and the entry sits flat as if the word carried no covenant weight at all. The flattening matters because the Hebrew text uses *am* with deliberate precision against its plural *amim* (peoples, nations). *Am* is the covenant people; *amim* is the nations of the earth. The prophets do not lose that distinction, and when the lexicons collapse it into a single generic gloss, the whole architecture of *my people* versus *the peoples* disappears behind a word the entry never explains.

Hosea is where the architecture stands clearest. The northern house is named *Lo-Ammi* — *not my people* — divorced and scattered. The same prophet who pronounces the unmaking pronounces the gathering, with the same word reversed:

> *Yet the number of the children of Yashar'el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

Same word, reversed verdict. The *am* that was unmade is the *am* the Father is gathering, in the very place where the unmaking happened — among the nations where they were scattered. The Christian reading that takes this verse and hands it to unrelated peoples being adopted in by faith-confession has missed the architecture: *Lo-Ammi → Ammi* is the gathering of seed that was always seed, not the inclusion of those who were never seed. The apostle himself read it that way:

> *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved. And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God).* (Romans 9:25–26)

Paul quoted Hosea 1:10 at his audience because his audience was the *am* whose verdict was being reversed. Restore *am* to the covenant register the Hebrew gives it — *my people,* the seed of promise, the gathered remnant — and *amim* is restored to its own register as the nations of the earth, and the prophetic story stands again as a gathering of a named people the Father said *not mine* and now says *mine* in the same place.$callout$,
    ARRAY['1','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H6662_tsadiq.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H6662',
    'tsadiq',
    'Lexicons gloss just / righteous / pious',
    $callout$The lexicons hang three weights on *tsadiq*: just, righteous, pious. All three are real Hebrew range. None of them carry what the word names where it sits inside the compound the canon preserves. *Tsadiq* is the second half of *Melek Tsadiq* (Melchizedek) — the priest-king of Salem who walks across Genesis 14, gets named by oath in Psalm 110, and stands as the order of priesthood Yahusha (Jesus) is named after in Hebrews. The English *Melchizedek* flattens what the Hebrew preserves: *melek* (king) plus *tsadiq* (righteous), the compound naming the priestly architecture the Messiah enters.

The figure walks onto the page without genealogy, blesses Avraham (Abraham), and receives a tenth from him:

> *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the most high Elohim (God). And he blessed him, and said, Blessed be Avram (Abram) of the most high Elohim (God), possessor of heaven and earth: and blessed be the most high Elohim (God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* (Genesis 14:18–20)

The oath in the psalm fixes the line forever:

> *Yahuah (the LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4)

This is the priestly line the Hebrews writer walks the reader into — a priesthood older than Levi, sworn by oath rather than carried by tribal descent, *king of righteousness* and *king of peace* preserved in the very compound of the name (Hebrews 7:1–3). When the lexicons flatten *tsadiq* to *just / righteous / pious* and leave the compound unmarked, the priestly architecture disappears from the entry. The English *Melchizedek* hides what the Hebrew was carrying the whole time: the named figure whose order Yahusha (Jesus) was sworn into, the *tsadiq* who blessed Avraham (Abraham) and received the tithe of all, the priest-king of Salem standing in the canon as the figure the Messiah's priesthood is named after. The word restored to its compound restores the line.$callout$,
    ARRAY['5','11']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H6664_tsedek.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H6664',
    'tsedek',
    'Lexicons gloss righteousness; Reformation collapsed to imputed legal-fiction credit',
    $callout$The lexicons gloss *tsedek* as righteousness, justice, rightness — and on top of that gloss the Reformation hung a forensic ledger: *imputed righteousness*, a legal credit applied to the believer's account at the moment of confession, the credential that lets the sinner stand uncondemned while conduct is left untouched. That is not what the prophets named when they put *tsedek* in the Messiah's name and on the girdle of the Branch. *Tsedek* is the rightness of one who walks the Way the covenant defines — the covenant-aligned uprightness Yahuah (the LORD) names as the substance of his own throne, and the substance the gathered remnant is brought home to wear.

Yirmeyahu (Jeremiah) holds the whole framework in eight words:

> *In his days Yahudah (Judah) shall be saved, and Yashar'el (Israel) shall dwell safely: and this is his name whereby he shall be called, THE LORD OUR RIGHTEOUSNESS (Yahuah-Tsidkenu).* (Jeremiah 23:6)

The Messiah's name is Yahuah-Tsidkenu — *Yahuah (the LORD) our righteousness* — because he is the one in whose days the two houses come home. Yahudah (Judah) is saved; Yashar'el (Israel) — the scattered seed of the northern house — dwells safely. *Tsedek* in that verse is not a ledger entry transferred to a heavenly account. *Tsedek* is the rightness of the people Yahuah (the LORD) brings home, the covenant-rightness of the gathered remnant walking in his ways. The same verse repeats with the name on Yerushalayim (Jerusalem) herself at Jeremiah 33:16: *and this is the name wherewith she shall be called, Yahuah-Tsidkenu*. The city restored carries the name because the city restored is what *tsedek* names.

Yeshayahu (Isaiah) shows the same substance worn by the Branch who does the gathering:

> *And righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins.* (Isaiah 11:5)

The chapter is the chapter of the second recovery — Yahuah (the LORD) setting his hand again the second time to gather the remnant of his people from the four corners of the earth (Isaiah 11:11–12). The Branch wears *tsedek* as the girdle of his loins because *tsedek* is the rightness of the gathering itself, the rightness of a people walking the Way with him at their head.

The substance the prophets named is the substance the new covenant writes from the inside. Yechezqel (Ezekiel) names the equipment:

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The new heart is not a credit posted to an account that leaves the walk unchanged. The new heart is what makes the walk possible. The Ruach (Spirit) within causes the keeping; *tsedek* is what the keeping looks like from the outside. Yirmeyahu (Jeremiah) names the same substance from the inward side: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). *Tsedek* is the covenant on the inside, lived on the outside, by the people the prophets named coming home.

When *dikaiosune* shows up in the Greek of the apostolic writings and the lexicons gloss it as *righteousness / justification*, the same flattening waits at the Greek-side seam. *Dikaiosune* is the LXX's Greek for *tsedek* — same word, same substance, same covenant-aligned walking the prophets named. *Blessed are they which do hunger and thirst after righteousness (dikaiosune): for they shall be filled* (Matthew 5:6) — hunger for the walk, not for a credit. *The kingdom of Elohim (God) is... righteousness (dikaiosune), and peace, and joy in the Ruach HaKodesh (Holy Spirit)* (Romans 14:17) — the substance of the kingdom, lived by those gathered into it.

The Reformation cut *tsedek* loose from the covenant life of the restored remnant and reissued it as a one-time legal transfer — a credit applied to the account, conduct quietly removed from the question. That is the imputation grammar that puts a period where scripture wrote a colon, the same truncation that collapses *saved by grace through faith* into a freedom-from-Torah formula. *Tsedek* is the casualty: severed from the new heart, severed from the walk, severed from the Way the Spirit causes the gathered to keep. Where the lexicons follow the Reformation in collapsing *tsedek* into imputed credit, the framework restores the seam. *Tsedek* is covenant-rightness — the homecoming-life the new covenant writes on the heart, the rightness of a people walking home with Yahuah-Tsidkenu at their head, wearing the new heart that finally keeps the statutes, becoming the kingdom of priests the prophets always promised the gathering would become.$callout$,
    ARRAY['5','10']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H6918_qadosh.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H6918',
    'qadosh',
    'Lexicons gloss holy/set-apart; Christian register softens to moral-purity, decouples from covenant-specific set-apart-ness',
    $callout$The lexicons hang three weights on *qadosh* — *holy, sacred, set apart* — and the pulpits downstream of those weights soften the word into two collapses the Hebrew never carried. The Christian register collapses *qadosh* into *morally pure* or *spiritually elevated* — a quality of the inner life that floats free of any people and any covenant, a sanctity available to anyone who believes the right things. The legalist register collapses *qadosh* into the opposite — a set-apart-ness *earned* by behavior, by ritual exactness, by the right keeping of the right practices. Both collapses leave the partner with the same shape underneath: a *qadosh* the believer or the keeper produces in himself. Neither carries what the word actually names. *Qadosh* is not a moral quality produced from inside, and it is not a credential earned from outside. It is the substance of a bond — Yahuah's own bond — into which his people are drawn because his name carries the substance and his name is on them.

The prophets do not name *qadosh* as a generic religious quality first. They name Yahuah as the substance the word points at:

> *Cry out and shout, thou inhabitant of Tsion (Zion): for great is the Holy One of Yashar'el (Israel) in the midst of thee.* (Isaiah 12:6)

The repeated Isaiah formula — *the Holy One of Yashar'el (Israel)* — is not Yahuah described by an attribute he happens to possess. It is Yahuah named by the substance that makes him who he is. The set-apart-ness is *his.* The people are *of* it because they are *his.* The covenant the patriarchs were given did not make a previously-unsanctified people *qadosh* by their performance. The covenant drew a specific paternal blood-seed *into* the set-apart-ness Yahuah's name already carried, and named them with the name that carries it:

> *For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (the LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth.* (Deuteronomy 14:2)

The order is the substance. *He* set them apart. *He* chose them. *He* drew them out of the nations into the bond his own name carries. The people did not vote themselves into it by belief and they did not earn their way into it by works. They were set apart *from* the nations BY the covenant, kept set apart *through* the covenant by his hand and his ways, and the prophets name them gathered home AS the set-apart remnant at the end of the journey.

Ezekiel names the anchor plainly. When the people walked contrary to the covenant and brought the exile-judgment of Deuteronomy 28 on themselves — when their walk profaned the name that had been put on them among the nations they were scattered to — what brings them home is not their repentance and not their fitness. It is the name itself:

> *Therefore say unto the house of Yashar'el (Israel), Thus saith Adonai Yahuah (the Lord GOD); I do not this for your sakes, O house of Yashar'el (Israel), but for mine holy name's sake, which ye have profaned among the heathen, whither ye went.* (Ezekiel 36:22)

The set-apart-ness is *his name's*. The gathering is *for his name's sake*. The remnant comes home because Yahuah's own substance — the *qadosh* that makes him the Holy One of Yashar'el (Israel) — does not let the seed his name was put on stay scattered. The covenant-set-apart-ness is restored where it was first given: anchored in him, carried by his name, kept by his hand, gathered to his mountain in the journey home the prophets named.

The same architecture surfaces at the Sinai-promise and at Kepha's (Peter's) restatement to the scattered:

> *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar'el (Israel).* (Exodus 19:6)

> *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light.* (1 Peter 2:9)

*Qadosh goy* in the one place, *hagios ethnos* in the other — the Greek of Kepha (Peter) carries the same substance the Hebrew gave at Sinai. The Greek-side lexicons gloss *hagios* (G0040) in the same softened register the Hebrew got — *holy, sacred, set apart* in the generic Christian sense — and the same collapses follow: a *hagios* of the inner life, a *hagios* of the practice. Both seams flatten the same substance. *Qadosh* and *hagios* are not two different words pointing at two different sanctifications; they are one substance named in two languages, and the people Kepha (Peter) is writing to are not a new spiritual category replacing the old. They are the scattered seed of the same set-apart people the prophets promised would be gathered — coming home into the bond the name has carried from the beginning.

Hold the substance against what scripture rules out. Set-apart-ness is not *moral purity produced by the believer's inner life,* which would make justification a function of covenant conduct and dissolve the gift into the walk. Set-apart-ness is not *a credential earned by keeping the right practices,* which would make the bond a wage and the name something the keeper acquires. And set-apart-ness is not a *spiritual category open to anyone who self-selects into it by belief or practice* — replacing the paternal blood-seed the prophets named with a different group standing in their place. *Qadosh* belongs to Yahuah's name and to the seed his name was put on; the gathering home is the destination the prophets promised, not a sanctification the partner manufactures in himself or a credential he produces by performance. Restore *qadosh* to set-apart-unto-Yahuah-by-his-name-and-bond, and the architecture the lexicons soften comes back into view — the Holy One of Yashar'el (Israel) gathering the set-apart remnant home into the substance his own name has always carried.$callout$,
    ARRAY['5','7']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H7307_ruach.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H7307',
    'ruach',
    'Lexicons gloss spirit / breath / wind',
    $callout$The lexicons gloss *ruach* as *spirit / breath / wind,* and the gloss is technically correct as far as it reaches — but the inherited reading reaches further and hides what the further reach does. The pulpit's *Spirit-versus-Torah* frame treats the Ruach HaKodesh (Holy Spirit) as the believer's release from the Torah, the one who supersedes the old covenant of stone and frees the heart from the burden of the commandments. That frame severs the Spirit from the word he spoke at Sinai, and severing the Spirit from his own word is the antichrist reading at its Hebrew root.

The Ruach HaKodesh who lives in the believer is the Ruach who spoke at Sinai. Same Spirit. Same word. Same Yahuah (God). And the new-covenant architecture the prophets named puts the Spirit and the Torah in the same motion, not on opposite sides of the believer's life:

> *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26–27)

The Spirit is put within the believer *and cause you to walk in my statutes.* The causing-to-walk is the Spirit's work. The walking is Torah. The Spirit does not lead the believer out of the statutes; the Spirit causes the believer to walk in them. Any reading that pits Spirit-life against Torah-life is reading against the architecture Ezekiel named.

Pentecost is the same Spirit poured out on the same people for the same purpose:

> *And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions: and also upon the servants and upon the handmaids in those days will I pour out my spirit.* (Joel 2:28–29)

Peter quotes that passage at Acts 2:17 as the explanation for what the gathered seed of Yashar'el (Israel) is witnessing on the day. The Spirit at Sinai gave the Torah; the Spirit at Pentecost wrote the same Torah on the heart of the gathered. One Spirit. Two events. One inheritance.

The lexicons' three-word gloss does not name what the inherited reading does to the term. Restore *ruach* to the Ruach HaKodesh who spoke at Sinai and writes on the heart of the gathered, and the Spirit-versus-Torah severance collapses where it stands.$callout$,
    ARRAY['6']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H7676_shabat.md  (claude-under-voice-skill-load-framework-deep, S162)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H7676',
    'shabat',
    'Lexicons gloss Sabbath/rest; Christian system declared abolished, moved observance to Sunday',
    $callout$The inherited reading hangs three weights on *shabat*: *sabbath* (a religious observance), *cessation* (a generic rest), *Jewish rest day* (a category-marker that pins the word to one people in one age). On top of those three the Christian pulpit hangs a fourth, heavier weight: *abolished at the cross, moved to the first day, no longer binding on the believer.* All four weights are inherited; none of them are what the Hebrew carries. *Shabat* is the day Yahuah hallowed at the beginning, before there was a Yahudi (Jew), before there was a Yashar'eli (Israelite), before there was a covenant cut in flesh. The day is the Father's, and the Father did not move it.

The prophets named it as the everlasting sign:

> *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* (Genesis 2:3)

> *Wherefore the children of Yashar'el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant. It is a sign between me and the children of Yashar'el (Israel) for ever.* (Exodus 31:16–17)

The day was set apart at creation. It was not invented at Sinai as a Yahudi (Jewish) distinctive; it was confirmed there as the sign of a covenant Yahuah had already woven into the seventh day of the week he made. *Perpetual.* *For ever.* *A sign between me and the children of Yashar'el (Israel).* The Father did not give the sign in order to take it back. The Ruach HaKodesh (Holy Spirit) who lives in the believer is the Spirit who spoke at Sinai — and the Spirit does not lead in two directions. Where the lexicons collapse *shabat* into a category that fulfilled away, the framework restores the day as what the Spirit walks the new heart back into. *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The statute that opens the Ten begins *Remember the sabbath day, to keep it holy* (Exodus 20:8). The Spirit causes the keeping. The Spirit does not cause the breaking.

Then the prophet Daniel saw a horn rise out of the fourth beast and named what it would attempt:

> *And he shall speak great words against the most High, and shall wear out the saints of the most High, and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25)

*Think to change times and laws.* The horn cannot change them in the Father's reckoning — the seventh day is what Yahuah hallowed and it stays hallowed — but the horn can move them in the eyes of the people sitting under his pulpit. Constantine's Sunday Law of 321 AD and the Council of Laodicea of 363 AD are the historical record of the move. The day Yahuah blessed was set aside in the institution that rose out of the fourth beast, and the first day of the week was installed in its place. The day Yahusha (Jesus) kept and called himself Master of (Mark 2:28) was renamed Yahudi (Jewish) and severed from the believer; the day no commandment ever named was renamed *the Lord's day* and bolted onto the calendar.

This is the institutional Christianity move on *shabat,* and it is the second blade of the same architecture the Pharisees carried in their own age. The Pharisees voided the Torah they claimed to enforce by *addition* — burying it under Sabbath fences that forbade healing and feeding. The horn voided it by *subtraction* — declaring it abolished outright. The grandmother who keeps the first day loves the Father; she was handed the day by sincere teachers who were handed it by sincere teachers before them. The system that handed her that day — the horn Daniel saw moving times and laws — is the architecture the framework is naming.

And the prophet Isaiah closes the canon's vision of the new heavens and the new earth on the same day Yahuah hallowed at the beginning:

> *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (the LORD).* (Isaiah 66:23)

*All flesh.* New heavens, new earth, the gathering of the covenant people brought home — and the day they gather on is *shabat.* The day at Genesis 2:3, the day at Sinai, the day Yahusha (Jesus) kept and called himself Master of, the day the horn tried to move and could not actually move, the day the gathered remnant comes home to in the new heavens. One day, from creation to consummation. The principle the framework holds: *torah* is the inheritance of the children of Yahuah, not the curse they were saved out from under; the new covenant is the same *torah* written on the heart by the same Spirit (Jeremiah 31:33); the Spirit-led life IS the Torah-life, because the Spirit who leads is the Spirit who spoke the commandment. Where any of those three is severed, the inherited pulpit's reading collapses; where the three stand together, the Father's hallowed day stands again where the horn tried to install another. The pulpit told you it was abolished. The prophets say all flesh will gather on it. Come home to the day he hallowed.$callout$,
    ARRAY['4','5','6']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

-- H8451_torah.md  (claude-under-voice-skill-load, S160)
INSERT INTO lexicon_callouts (
    strong_number, term_display, gloss_error_summary,
    body_md, red_lines_cited, last_reviewed_at
) VALUES (
    'H8451',
    'torah',
    'The lexicons gloss law / burden / system of statutes',
    $callout$The inherited reading hangs three weights on *torah*: law (a binding statute), burden (something heavy to carry), and system (an externalized code one operates under). All three weights are in the lexicons; all three are unhooked from what the word actually carries in Hebrew. The root *yarah* (H3384) means *to point out, to teach, to direct the way*. *Torah* is the instruction the Father pointed out — the way of life Yahuah laid down for the people he set apart. Not the curse, not the bondage, not the rulebook strapped to the back of those who would later be told they were saved out from under it.

The prophets named it as the inheritance:

> *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

> *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

The Father did not give covenant instruction to take it back. The Ruach HaKodesh (Holy Spirit) who lives in the believer is the Spirit who spoke at Sinai. The curse of the Deuteronomy 28 exile-judgment came on covenant-breaking — not on the *torah* itself. *Torah* is what the curse defended; the curse was never *torah*. Where the lexicons collapse the two, the framework restores them as separate substances. The principle the framework holds: never present *torah* as the curse. The curse is the exile judgment of Deuteronomy 28. *Torah* is the covenant instruction of the living Elohim. *Torah* is the inheritance.

When *nomos* shows up in the Greek of Paul and the lexicons gloss it as *law / Mosaic law / legal system*, the same flattening happens at the Greek-side seam. *Nomos* is the LXX's Greek translation of *torah* — same word, same instruction, same inheritance. The Reformation's *grace-against-law* reading is the antichrist reading of the same word the prophets gave as the inheritance. The covenant the Father is writing on the new heart is the covenant the lexicons here call *law*.$callout$,
    ARRAY['4','5']::TEXT[],
    TIMESTAMP WITH TIME ZONE '2026-05-29 04:23:17+00'
)
ON CONFLICT (strong_number) DO UPDATE SET
    term_display        = EXCLUDED.term_display,
    gloss_error_summary = EXCLUDED.gloss_error_summary,
    body_md             = EXCLUDED.body_md,
    red_lines_cited     = EXCLUDED.red_lines_cited,
    last_reviewed_at    = EXCLUDED.last_reviewed_at,
    updated_at          = NOW();

DO $verify$
DECLARE
    actual_count INTEGER;
    hebrew_count INTEGER;
    greek_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO actual_count FROM lexicon_callouts;
    SELECT COUNT(*) INTO hebrew_count FROM lexicon_callouts WHERE strong_number LIKE 'H%';
    SELECT COUNT(*) INTO greek_count  FROM lexicon_callouts WHERE strong_number LIKE 'G%';
    IF actual_count < 34 THEN
        RAISE EXCEPTION 'S162 callout migration verify failed: % rows present, % expected',
                        actual_count, 34;
    END IF;
    IF hebrew_count <> 16 OR greek_count <> 18 THEN
        RAISE EXCEPTION 'S162 callout migration verify failed on hebrew/greek split: actual H=% G=%, expected H=16 G=18',
                        hebrew_count, greek_count;
    END IF;
    RAISE NOTICE 'S162 callout migration verified: % rows (% H + % G).',
                 actual_count, hebrew_count, greek_count;
END
$verify$;

COMMIT;
