-- =====================================================================
-- Session 503c migration — summaries sweep — thread 23 `trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid`: title + summary rewritten (slug kept); 17 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid` from canon__mark (4), canon__matthew (19). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session506_trinitarian-baptism-formula-and.sql
-- =====================================================================
\echo 'session503c — trinitarian-baptism-formula-and starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(3187,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','acts',8,16,$n$*They were baptized in the name of the Lord Yahusha.*$n$,$n$Acts 8:16 — *(For as yet he was fallen upon none of them: only they were baptized in the name of the Lord Yahusha (Lord Jesus).)* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The charge says to baptize in the name of the Father, the Son and the Ruach HaKodesh (Holy Spirit), and here the people of Samaria are baptized *in the name of the Lord Yahusha*. The name is given as one, and the Son's name is the Father's name carried. Nobody is setting the charge aside. This is the charge being done.$n$,23,$n$*They were baptized in the name of the Lord Yahusha.*$n$,$n$Acts 8:16 — *they were baptized in the name of the Lord Yahusha (Lord Jesus).* The people of Samaria are baptized in the one name, and it is given as the Son's name.$n$),
(3188,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','acts',10,48,$n$*He commanded them to be baptized in the name of the Lord.*$n$,$n$Acts 10:48 — *And he commanded them to be baptized in the name of Yahusha (Lord). Then prayed they him to tarry certain days.* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) Peter does not hesitate over the words. He commands baptism *in the name of Yahusha*, and he does it for people who have already received the Ruach HaKodesh (Holy Spirit). The charge named the Father, the Son and the Spirit and called it one name, and Peter gives that one name.$n$,23,$n$*He commanded them to be baptized in the name of the Lord.*$n$,$n$Acts 10:48 — *he commanded them to be baptized in the name of Yahusha (Lord).* Peter commands baptism in the name of Yahusha (Jesus), the one name the charge speaks of.$n$),
(3189,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','acts',19,5,$n$*They were baptized in the name of the Lord Yahusha.*$n$,$n$Acts 19:5 — *When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus).* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) These men had known only John's baptism. Once they heard of the one who came after him, they were baptized *in the name of the Lord Yahusha*. The apostles did not read the charge as a list of three names. They read it as one name, and this is the one they used.$n$,23,$n$*They were baptized in the name of the Lord Yahusha.*$n$,$n$Acts 19:5 — *they were baptized in the name of the Lord Yahusha (Lord Jesus).* Men who knew only John's baptism are baptized in the one name of Yahusha (Jesus).$n$),
(3190,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','romans',6,3,$n$*Baptized into Yahusha HaMashiach.*$n$,$n$Romans 6:3 — *Know ye not, that so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death?* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Son's part in the charge is the part Paul spells out here. Baptism takes a person *into his death*, into Yahusha (Jesus) himself. It is the same baptism the charge speaks of, said another way, and it is joined to the Son by name.$n$,23,$n$*Baptized into Yahusha HaMashiach.*$n$,$n$Romans 6:3 — *so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death.* Baptism in the name is baptism into Yahusha (Jesus) and into his death.$n$),
(3191,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','galatians',3,27,$n$*Baptized into Messiah (Christ) have put on Messiah.*$n$,$n$Galatians 3:27 — *For as many of you as have been baptized into Messiah (Christ) have put on Messiah (Christ).* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) Baptism is called a putting on here. Those baptized *into Messiah (Christ)* have *put on Messiah (Christ)*, wearing the name they were baptized into. It is the Son's name worn by the ones who went into the water in it, the one name the charge speaks of.$n$,23,$n$*Baptized into Messiah (Christ) have put on Messiah.*$n$,$n$Galatians 3:27 — *For as many of you as have been baptized into Messiah (Christ) have put on Messiah (Christ).* Those baptized into Messiah (Christ) wear him, the name they were baptized into.$n$),
(3194,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','matthew',3,16,$n$The substantial-baptism-substance + the Father-Son-Spirit-substance.$n$,$n$Matthew 3:16 — *And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him:* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Father, the Son and the Ruach HaKodesh (Holy Spirit) named in the charge are all at the water. Yahusha (Jesus) comes up out of it, *the heavens were opened*, and the Spirit of Elohim (God) comes down on him, while the Father's voice sounds in the next verse. All three are there, and the name is one.$n$,23,$n$The substantial-baptism-substance + the Father-Son-Spirit-substance.$n$,$n$Matthew 3:16 — *he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him.* At his baptism the Son comes up from the water and the Spirit of Elohim (God) comes down on him.$n$),
(3195,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','matthew',17,1,$n$The substantial-transfiguration-substance per `transfiguration-formless-formed-nature-of-god-visible`.$n$,$n$Matthew 17:1 — *And after six days Yahusha (Jesus) taketh Peter, James, and John his brother, and bringeth them up into an high mountain apart,* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The charge names the Father, the Son and the Ruach HaKodesh (Holy Spirit). Here Yahusha (Jesus) brings Peter, James and John up *an high mountain apart* to see him as he is, and a few lines on Moses and Elijah are talking with him. The Formed one stands before witnesses.$n$,23,$n$The substantial-transfiguration-substance per `transfiguration-formless-formed-nature-of-god-visible`.$n$,$n$Matthew 17:1 — *Yahusha (Jesus) taketh Peter, James, and John his brother.* Yahusha (Jesus) takes three witnesses up the mountain apart to see him transfigured.$n$),
(3196,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','john',14,16,$n$The substantial-Comforter-substance — Father-Son-Spirit.$n$,$n$John 14:16 — *And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever;* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Son asks and the Father gives. Yahusha (Jesus) says he will pray the Father, and the Father gives *another Comforter*. One prays, one gives, one is given, and the charge puts all three under a single name, because the name they share is one.$n$,23,$n$The substantial-Comforter-substance — Father-Son-Spirit.$n$,$n$John 14:16 — *And I will pray the Father, and he shall give you another Comforter.* The Son prays, the Father gives, and the Comforter is given, each kept distinct.$n$),
(3197,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','john',14,26,$n$The Ruach-substance-comes-in-the-name-of-the-Son.$n$,$n$John 14:26 — *But the Comforter, which is the Ruach HaKodesh (Holy Spirit), whom the Father will send in my name, he shall teach you all things, and bring all things to your remembrance, whatsoever I have said unto you.* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) Here is the one name that all three carry. The Father sends the Comforter, who is the Ruach HaKodesh (Holy Spirit), and he sends him *in my name*, the Son's name. So when the charge says to baptize in the name of the Father, the Son and the Spirit, the Spirit is already in that name, sent in it.$n$,23,$n$The Ruach-substance-comes-in-the-name-of-the-Son.$n$,$n$John 14:26 — *whom the Father will send in my name.* The Father sends the Ruach HaKodesh (Holy Spirit) in the Son's name, so the Spirit comes in the one name.$n$),
(3198,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','john',17,5,$n$The substantial-substance-of-the-substantial-relational-substance.$n$,$n$John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Son asks the Father for the glory he *had with thee before the world was*. He speaks as one who was with the Father, so he is a Son with a Father and not the Father himself. The name in the charge covers both, the Father who is the source and the Son who was with him.$n$,23,$n$The substantial-substance-of-the-substantial-relational-substance.$n$,$n$John 17:5 — *the glory which I had with thee before the world was.* The Son was with the Father before the world, so he has a Father and is not him.$n$),
(3199,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','john',17,11,$n$The substantial-substance-of-the-substantial-relational-substance.$n$,$n$John 17:11 — *And now I am no more in the world, but these are in the world, and I come to thee. Holy Father, keep through thine own name those whom thou hast given me, that they may be one, as we are.* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Son prays to the Father and asks him to keep them *through thine own name*. The name is the Father's, and the Son hands them into it, asking that they be one as the two of them are. The charge says name, singular, and this prayer shows what that singular is.$n$,23,$n$The substantial-substance-of-the-substantial-relational-substance.$n$,$n$John 17:11 — *Holy Father, keep through thine own name those whom thou hast given me.* The Son asks the Father to keep his own through the Father's name.$n$),
(3200,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','john',17,21,$n$The substantial-substance-of-the-substantial-relational-substance.$n$,$n$John 17:21 — *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Son prays to the Father as one who was sent, *thou hast sent me*, and still says the Father is in him and he in the Father. Both are held at once: a Father who sends and the oneness they share. The one name in the charge does not blur them into each other.$n$,23,$n$The substantial-substance-of-the-substantial-relational-substance.$n$,$n$John 17:21 — *as thou, Father, art in me, and I in thee.* The Father is in the Son and the Son in the Father, yet one sends and one is sent.$n$),
(3202,'canon','matthew',28,19,$n$Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):$n$,'canon','philippians',2,6,$n$The substantial-substance-of-the-incarnation-substance + the substantial-name above-every-name-substance.$n$,$n$Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* *Go you therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19) The Son is called Elohim (God) here in plain words. He was *in the form of Elohim (God)*, and the form is the point. The Father is the source without form, and the Son is the one who has the form and appeared. He is Elohim (God) and still has a Father, which the charge says by naming the Father first.$n$,23,$n$The substantial-substance-of-the-incarnation-substance + the substantial-name above-every-name-substance.$n$,$n$Philippians 2:6 — *being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God).* The Son is Elohim (God), in the form of Elohim (God), while the charge still names the Father first.$n$),
(5379,'canon','mark',16,16,$n$He that believes and is baptized shall be saved; but he that believes not shall be damned.$n$,'canon','matthew',28,19,$n$thread:trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid | *He that believeth and is baptized shall be saved.* The believing-and-being-baptized is the response of the seed-of-promise hearing the call.$n$,$n$Matthew 28:19 — *Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* *He that believes and is baptized shall be saved; but he that believes not shall be damned.* (Mark 16:16) Believing and being baptized in Mark gets its words here. The baptism is *in the name*, and the name is one, though the Father, the Son and the Ruach HaKodesh (Holy Spirit) are all named. The one who believes is baptized into that name.$n$,23,$n$*He that believeth and is baptized shall be saved.* The believing-and-being-baptized is the response of the seed-of-promise hearing the call.$n$,$n$Matthew 28:19 — *baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit).* The baptism Mark speaks of is given its words: one name, with the Father, Son and Spirit named.$n$),
(5380,'canon','mark',16,16,$n$He that believes and is baptized shall be saved; but he that believes not shall be damned.$n$,'canon','acts',2,38,$n$thread:trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid | Acts 2:38's baptism-in-the-name-of-Yahusha.$n$,$n$Acts 2:38 — *Then Peter said unto them, Repent, and be baptized every one of you in the name of Yahusha HaMashiach (Jesus Christ) for the remission of sins, and ye shall receive the gift of the Ruach HaKodesh (Holy Spirit).* *He that believes and is baptized shall be saved; but he that believes not shall be damned.* (Mark 16:16) When the crowd asks what to do, Peter says to be baptized, the baptism Mark joins to believing. He gives it as *in the name of Yahusha HaMashiach (Jesus Christ)*, spoken to the house of Yashar'el (Israel), and the gift of the Ruach HaKodesh (Holy Spirit) comes with it.$n$,23,$n$Acts 2:38's baptism-in-the-name-of-Yahusha.$n$,$n$Acts 2:38 — *be baptized every one of you in the name of Yahusha HaMashiach (Jesus Christ) for the remission of sins.* Peter gives the baptism in the one name of Yahusha (Jesus), with the gift of the Ruach HaKodesh (Holy Spirit).$n$),
(5381,'canon','mark',16,16,$n$He that believes and is baptized shall be saved; but he that believes not shall be damned.$n$,'canon','acts',8,16,$n$thread:trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid | Acts 8:16's baptism-in-the-name pattern.$n$,$n$Acts 8:16 — *(For as yet he was fallen upon none of them: only they were baptized in the name of the Lord Yahusha (Lord Jesus).)* *He that believes and is baptized shall be saved; but he that believes not shall be damned.* (Mark 16:16) Mark says the one who believes is baptized. In Samaria they had heard the word and were baptized, but only *in the name of the Lord Yahusha*, and the apostles came down to pray that they might receive the Ruach HaKodesh (Holy Spirit). The baptism in the name came first, and the gift followed.$n$,23,$n$Acts 8:16's baptism-in-the-name pattern.$n$,$n$Acts 8:16 — *they were baptized in the name of the Lord Yahusha (Lord Jesus).* Samaria's believers were baptized in the name of Yahusha (Jesus) before the gift came.$n$),
(5382,'canon','mark',16,16,$n$He that believes and is baptized shall be saved; but he that believes not shall be damned.$n$,'canon','romans',6,3,$n$thread:trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid | Romans 6:3-4's baptism-into-his-death architecture.$n$,$n$Romans 6:3 — *Know ye not, that so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death?* *He that believes and is baptized shall be saved; but he that believes not shall be damned.* (Mark 16:16) Mark says the baptized one shall be saved. Paul says what that baptism is: *baptized into Yahusha HaMashiach (Jesus Christ)*, and so into his death. The one who believes and goes into the water goes into the Son's death with him.$n$,23,$n$Romans 6:3-4's baptism-into-his-death architecture.$n$,$n$Romans 6:3 — *so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death.* Paul says the baptism Mark speaks of takes a person into Yahusha (Jesus) and into his death.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (23, 'trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid', $n$Baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit) — one name, Yah, and the apostles baptizing in it (Psalm 68; Acts 2; John 17)$n$, $n$Baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit) — one name, Yah, and the apostles baptizing in it (Psalm 68; Acts 2; John 17)$n$, $n$It ain't new. The charge names three and says *name*, not names:

*Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19)

There is one name that the Father, the Son and the Spirit all carry. The psalm sings it short, the name the translators left as JAH:

*Sing unto Elohim (God), sing praises to his name: extol him that rideth upon the heavens by his name JAH, and rejoice before him.* (Psalm 68:4)

Yah. It is in the Father's name, Yahuah (the LORD). It is in the Son's name, Yahusha (Jesus), which Matthew opened his gospel with and told the meaning of:

*And she shall bring forth a son, and thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins.* (Matthew 1:21)

*Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* (Matthew 1:23)

*Yahusha (JESUS)*, Yah saves; *Emmanuel*, Elohim (God) with us. The Spirit is sent in the same name:

*But the Comforter, which is the Ruach HaKodesh (Holy Spirit), whom the Father will send in my name, he shall teach you all things, and bring all things to your remembrance, whatsoever I have said unto you.* (John 14:26)

And heaven praises by it, HalleluYah, praise Yah:

*And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God):* (Revelation 19:1)

So watch what the apostles did with the charge. Every baptism in Acts is in one name, and it is the Son's name, which is the Father's name:

*Then Peter said unto them, Repent, and be baptized every one of you in the name of Yahusha HaMashiach (Jesus Christ) for the remission of sins, and ye shall receive the gift of the Ruach HaKodesh (Holy Spirit).* (Acts 2:38)

*(For as yet he was fallen upon none of them: only they were baptized in the name of the Lord Yahusha (Lord Jesus).)* (Acts 8:16)

*When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus).* (Acts 19:5)

They were not disobeying the charge; they had understood it. The Son came in his Father's name and made it known:

*I am come in my Father’s name, and ye receive me not: if another shall come in his own name, him ye will receive.* (John 5:43)

*I have manifested thy name unto the men which thou gavest me out of the world: thine they were, and thou gavest them me; and they have kept thy word.* (John 17:6)

At his own baptism all three are in the scene, and none is the other:

*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him:* (Matthew 3:16)

*And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* (Matthew 3:17)

Hear what the scriptures hold together, in their own words and no borrowed one. He is Elohim (God):

*Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* (Philippians 2:6)

And he has a Father, and the Father is the one Elohim (God):

*But to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him.* (1 Corinthians 8:6)

*Hear, O Yashar'el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4)

Both are so, and the prayer the night before he died holds both, the Father who sent and the oneness they share:

*And now I am no more in the world, but these are in the world, and I come to thee. Holy Father, keep through thine own name those whom thou hast given me, that they may be one, as we are.* (John 17:11)

*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* (John 17:21)

The Father is the source, without form, whom no man has seen. The Son is the Formed, the Word who came in the flesh, Elohim (God) and sent by his Father. The Spirit is sent in that name. The one name is Yah, borne by the Father, the Son and the Spirit alike, and that is the name the gathered are baptized into: not three who are each the whole and not one wearing three faces, but one name on all three, HalleluYah.$n$, $n$It ain't new. The charge names three and says *name*, not names:

*Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19)

There is one name that the Father, the Son and the Spirit all carry. The psalm sings it short, the name the translators left as JAH:

*Sing unto Elohim (God), sing praises to his name: extol him that rideth upon the heavens by his name JAH, and rejoice before him.* (Psalm 68:4)

Yah. It is in the Father's name, Yahuah (the LORD). It is in the Son's name, Yahusha (Jesus), which Matthew opened his gospel with and told the meaning of:

*And she shall bring forth a son, and thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins.* (Matthew 1:21)

*Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* (Matthew 1:23)

*Yahusha (JESUS)*, Yah saves; *Emmanuel*, Elohim (God) with us. The Spirit is sent in the same name:

*But the Comforter, which is the Ruach HaKodesh (Holy Spirit), whom the Father will send in my name, he shall teach you all things, and bring all things to your remembrance, whatsoever I have said unto you.* (John 14:26)

And heaven praises by it, HalleluYah, praise Yah:

*And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God):* (Revelation 19:1)

So watch what the apostles did with the charge. Every baptism in Acts is in one name, and it is the Son's name, which is the Father's name:

*Then Peter said unto them, Repent, and be baptized every one of you in the name of Yahusha HaMashiach (Jesus Christ) for the remission of sins, and ye shall receive the gift of the Ruach HaKodesh (Holy Spirit).* (Acts 2:38)

*(For as yet he was fallen upon none of them: only they were baptized in the name of the Lord Yahusha (Lord Jesus).)* (Acts 8:16)

*When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus).* (Acts 19:5)

They were not disobeying the charge; they had understood it. The Son came in his Father's name and made it known:

*I am come in my Father’s name, and ye receive me not: if another shall come in his own name, him ye will receive.* (John 5:43)

*I have manifested thy name unto the men which thou gavest me out of the world: thine they were, and thou gavest them me; and they have kept thy word.* (John 17:6)

At his own baptism all three are in the scene, and none is the other:

*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him:* (Matthew 3:16)

*And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* (Matthew 3:17)

Hear what the scriptures hold together, in their own words and no borrowed one. He is Elohim (God):

*Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* (Philippians 2:6)

And he has a Father, and the Father is the one Elohim (God):

*But to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him.* (1 Corinthians 8:6)

*Hear, O Yashar'el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4)

Both are so, and the prayer the night before he died holds both, the Father who sent and the oneness they share:

*And now I am no more in the world, but these are in the world, and I come to thee. Holy Father, keep through thine own name those whom thou hast given me, that they may be one, as we are.* (John 17:11)

*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* (John 17:21)

The Father is the source, without form, whom no man has seen. The Son is the Formed, the Word who came in the flesh, Elohim (God) and sent by his Father. The Spirit is sent in that name. The one name is Yah, borne by the Father, the Son and the Spirit alike, and that is the name the gathered are baptized into: not three who are each the whole and not one wearing three faces, but one name on all three, HalleluYah.$n$);

DO $s503c$
DECLARE r record; x record; n int;
BEGIN
  FOR r IN SELECT * FROM s503c_cards LOOP
    SELECT xr.id, xr.note, sv.text AS stext, se.slug AS sed, sb.slug AS sbook, sc.chapter_number AS sch, sv.verse_number AS svn, te.slug AS ted, tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn
      INTO x FROM cross_references xr
      JOIN verses sv ON sv.id = xr.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id JOIN editions se ON se.id = sb.edition_id
      JOIN verses tv ON tv.id = xr.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id JOIN editions te ON te.id = tb.edition_id
      WHERE xr.id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S503c: card % is gone', r.id; END IF;
    IF x.sed <> r.s_ed OR x.sbook <> r.s_book OR x.sch <> r.src_ch OR x.svn <> r.src_vn OR x.ted <> r.t_ed OR x.tbook <> r.tgt_book OR x.tch <> r.tgt_ch OR x.tvn <> r.tgt_vn THEN
      RAISE EXCEPTION 'S503c: card % no longer sits on the verse pair this was written for', r.id; END IF;
    IF x.stext <> r.src_text THEN RAISE EXCEPTION 'S503c: live text of % %:% differs from the read-back — re-dump and rebuild', r.s_book, r.src_ch, r.src_vn; END IF;
    IF x.note IS DISTINCT FROM r.old_note AND x.note IS DISTINCT FROM r.new_note THEN RAISE EXCEPTION 'S503c: the live note of card % differs from the read-back — re-dump and rebuild', r.id; END IF;
    SELECT count(*) INTO n FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id = r.thread_id AND (m.member_note IS NOT DISTINCT FROM r.old_mnote OR m.member_note IS NOT DISTINCT FROM r.new_mnote);
    IF n <> 1 THEN RAISE EXCEPTION 'S503c: card % has no member row in thread % carrying the member note this was written against', r.id, r.thread_id; END IF;
  END LOOP;
  SELECT t.* INTO x FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id AND s.slug = t.slug;
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 23 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 23 title/summary differ from the read-back — re-dump and rebuild'; END IF;
END $s503c$;

DO $s503c2$
DECLARE n_notes int; n_m int; n_t int; n_c int;
BEGIN
  SELECT count(*) INTO n_c FROM s503c_cards;
  UPDATE cross_references xr SET note = c.new_note FROM s503c_cards c WHERE xr.id = c.id AND xr.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_notes = ROW_COUNT;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM s503c_cards c WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT;
  UPDATE cross_reference_threads t SET title = s.new_title, summary_md = s.new_summary FROM s503c_thread s WHERE t.id = s.id AND t.title = s.old_title AND t.summary_md = s.old_summary AND (s.old_title <> s.new_title OR s.old_summary <> s.new_summary);
  GET DIAGNOSTICS n_t = ROW_COUNT;
  RAISE NOTICE 'S503c (trinitarian-baptism-formula-and) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — trinitarian-baptism-formula-and done.'
