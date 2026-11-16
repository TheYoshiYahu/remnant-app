-- =====================================================================
-- Session 503c migration — summaries sweep — thread 10 `his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance`: title + summary rewritten (slug kept); 13 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance` from canon__genesis (1), canon__mark (2), canon__matthew (14). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session506_his-blood-be-on.sql
-- =====================================================================
\echo 'session503c — his-blood-be-on starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(3135,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','matthew',23,34,$n$*All these things shall come upon this generation.*$n$,$n$Matthew 23:34 — *Wherefore, behold, I send unto you prophets, and wise men, and scribes: and some of them ye shall kill and crucify; and some of them shall ye scourge in your synagogues, and persecute them from city to city:* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) Yahusha (Jesus) is speaking to the scribes and the rulers, and he says some of the ones he sends they will *kill and crucify*. The crowd in Pilate's court taking the blood on itself is the same hand he was already naming. The charge sits on the system that kills the sent ones, not on a people.$n$,10,$n$*All these things shall come upon this generation.*$n$,$n$Matthew 23:34 — *some of them ye shall kill and crucify.* Yahusha (Jesus) names who will kill and crucify the ones he sends: the scribes and rulers he is addressing.$n$),
(3136,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','matthew',23,37,$n$The substantial-lament + *blessed is he that cometh in the name of Yahuah.*$n$,$n$Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) He weeps over the city and says how often he would have gathered her children. Those children are the ones he wanted under his wings, so the cry about *our children* cannot be a curse on them. The killers he names are the rulers; the children are the lost sheep he came for.$n$,10,$n$The substantial-lament + *blessed is he that cometh in the name of Yahuah.*$n$,$n$Matthew 23:37 — *how often would I have gathered thy children together.* The children he longed to gather are the ones the crowd names, so they are the ones he sought, not the ones he cursed.$n$),
(3137,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','matthew',24,1,$n$The substantial-Temple-destruction-prophecy.$n$,$n$Matthew 24:1 — *And Yahusha (Jesus) went out, and departed from the temple: and his disciples came to him for to shew him the buildings of the temple.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) Right after the charge on the rulers, Yahusha (Jesus) leaves the temple, and what he says next is its ruin. The fall comes on the house and its keepers, the court that owned the blood, in the city that stood in it. It lands on the place, not on the children of Yahudah (Judah) as a people.$n$,10,$n$The substantial-Temple-destruction-prophecy.$n$,$n$Matthew 24:1 — *went out, and departed from the temple.* Yahusha (Jesus) walks out of the temple, and what follows is the fall of that house, which is where the blood comes to rest.$n$),
(3138,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','acts',4,25,$n$The substantial-substance-of-the-Yashar'el-and-the-nations-gathered against-the-Father's-anointed.$n$,$n$Acts 4:25 — *Who by the mouth of thy servant David hast said, Why did the heathen rage, and the people imagine vain things?* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) The apostles pray David's words over what happened in Pilate's court. The raging and the vain imagining belong to those gathered against the Father's anointed: Herod and Pilate, the rulers, and the crowd they drew in. It is a court's doing, and they pray it as a charge against the powers, not a curse on a people.$n$,10,$n$The substantial-substance-of-the-Yashar'el-and-the-nations-gathered against-the-Father's-anointed.$n$,$n$Acts 4:25 — *Why did the heathen rage, and the people imagine vain things.* David's words about the raging gathering are what the apostles say was happening against Yahusha (Jesus), a gathering of rulers and the crowd they moved.$n$),
(3140,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','jeremiah',26,15,$n$*Ye shall surely bring innocent blood upon yourselves.*$n$,$n$Jeremiah 26:15 — *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) Jeremiah told the men who wanted him dead that killing him would bring *innocent blood upon yourselves*, and upon the city. The weight falls on the ones who do it. In the next breath the people themselves say he is not worthy to die. The cry in Pilate's court is the rulers' charge being taken up, the same one Jeremiah named.$n$,10,$n$*Ye shall surely bring innocent blood upon yourselves.*$n$,$n$Jeremiah 26:15 — *ye shall surely bring innocent blood upon yourselves.* The prophet puts the innocent blood on the men who would kill him, not on the whole nation.$n$),
(3141,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','jonah',1,14,$n$*Lay not upon us innocent blood.*$n$,$n$Jonah 1:14 — *Wherefore they cried unto Yahuah (LORD), and said, We beseech thee, O Yahuah (LORD), we beseech thee, let us not perish for this man’s life, and lay not upon us innocent blood: for thou, O Yahuah (LORD), hast done as it pleased thee.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) Sailors from the nations knew what innocent blood was. Before they threw Jonah in, they begged Yahuah (LORD) not to *lay* it on them. Pilate washes his hands and the court takes the blood on itself, which is the Torah's weight turned around. The old prayer was always that it not be laid on anyone's charge.$n$,10,$n$*Lay not upon us innocent blood.*$n$,$n$Jonah 1:14 — *lay not upon us innocent blood.* Men who knew blood was a charge asked that none be laid on them, the plain background to the cry in Pilate's court.$n$),
(3142,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','deuteronomy',21,1,$n$The substantial-hand-washing-Tanakh-procedural-substance.$n$,$n$Deuteronomy 21:1 — *If one be found slain in the land which Yahuah Elohayka (the LORD thy God) giveth thee to possess it, lying in the field, and it be not known who hath slain him:* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) A man is found slain and no one knows who did it. The Torah does not blame the people at large. The elders and judges of the nearest city answer for the blood, and they pray that it not be laid on Yashar'el (Israel). So blood is a charge on the court and its keepers, which is where Pilate's crowd and rulers stand.$n$,10,$n$The substantial-hand-washing-Tanakh-procedural-substance.$n$,$n$Deuteronomy 21:1 — *lying in the field, and it be not known who hath slain him.* A slain man whose killer is unknown puts the blood on the nearest city's elders, which is how the Torah treats innocent blood.$n$),
(3143,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','genesis',4,10,$n$*The voice of thy brother's blood crieth unto me.*$n$,$n$Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) Abel's blood cried out, and it cried against his brother. Yahuah (LORD) asks the killer, *What hast thou done?* Blood speaks against the hand that shed it, never against a people. Pilate's court is that kind of case, with the weight on the ones who shed it or let it be shed.$n$,10,$n$*The voice of thy brother's blood crieth unto me.*$n$,$n$Genesis 4:10 — *the voice of thy brother’s blood crieth unto me from the ground.* Blood that cries from the ground cries against the killer, and here the killer is Cain, one man, not a people.$n$),
(3145,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','zechariah',12,10,$n$*They shall look upon me whom they have pierced.*$n$,$n$Zechariah 12:10 — *And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) The house that pierced him is the house that mourns him. Yahuah (LORD) pours out *the spirit of grace* on the house of David and the people of Jerusalem, and they look on him and mourn as for an only son. That is what becomes of the same people, so the blood cannot end as their curse.$n$,10,$n$*They shall look upon me whom they have pierced.*$n$,$n$Zechariah 12:10 — *they shall look upon me whom they have pierced.* The ones who pierced him are the ones who look on him and mourn, so the blood ends in grace on that house, not a curse.$n$),
(3146,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','zechariah',13,8,$n$The substantial-surviving-third-substance per §V.$n$,$n$Zechariah 13:8 — *And it shall come to pass, that in all the land, saith Yahuah (LORD), two parts therein shall be cut off and die; but the third shall be left therein.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) Two parts cut off and one third left. The judgment on the land is hard, but it is not the end, and a remnant is kept. Read beside the blood, the cost falls on the many who stood in the system, while the house that is left is still the house that mourns him.$n$,10,$n$The substantial-surviving-third-substance per §V.$n$,$n$Zechariah 13:8 — *two parts therein shall be cut off and die; but the third shall be left therein.* Two parts are cut off but a third is left, so the judgment is not the end of the people.$n$),
(3147,'canon','matthew',27,25,$n$Then answered all the people, and said, His blood be on us, and on our children.$n$,'canon','isaiah',53,5,$n$*With his stripes we are healed* — the substantial-blood-of-the-Cross-redemption-substance.$n$,$n$Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* *Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25) The one the court shed blood of was *wounded for our transgressions*. The same blood the rulers took on themselves is borne for the ones who went astray, the lost sheep of Yashar'el (Israel). So the blood of this just person was not aimed at the people. It was carried for them.$n$,10,$n$*With his stripes we are healed* — the substantial-blood-of-the-Cross-redemption-substance.$n$,$n$Isaiah 53:5 — *the chastisement of our peace was upon him; and with his stripes we are healed.* His stripes bring healing to the ones he bled for, which turns the blood in Pilate's court into peace for the people.$n$),
(5335,'canon','mark',15,15,$n$And so Pilate, willing to content the people, released Barabbas unto them, and delivered Yahusha (Jesus), when he had scourged him, to be crucified.$n$,'canon','leviticus',16,21,$n$thread:his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance | *Pilate willing to content the people.* The Yom-Kippur blood-substance (Vayikra/Leviticus 16:21-22) reads through Mark's compressed account.$n$,$n$Leviticus 16:21 — *And Aaron shall lay both his hands upon the head of the live goat, and confess over him all the iniquities of the children of Yashar'el (Israel), and all their transgressions in all their sins, putting them upon the head of the goat, and shall send him away by the hand of a fit man into the wilderness:* *And so Pilate, willing to content the people, released Barabbas unto them, and delivered Yahusha (Jesus), when he had scourged him, to be crucified.* (Mark 15:15) On the Day of Atonement two are taken. One is sent away into the wilderness with the people's sins on its head, and one is given up. Pilate sets two before the crowd as well, Barabbas let go and Yahusha (Jesus) delivered. The sins are confessed over the goat, so the guilt has a named place to rest.$n$,10,$n$*Pilate willing to content the people.* The Yom-Kippur blood-substance (Vayikra/Leviticus 16:21-22) reads through Mark's compressed account.$n$,$n$Leviticus 16:21 — *confess over him all the iniquities of the children of Yashar'el (Israel).* On the day of atonement the sins are confessed over the live goat that is sent away, as Barabbas is sent away and Yahusha (Jesus) is delivered.$n$),
(5336,'canon','mark',15,15,$n$And so Pilate, willing to content the people, released Barabbas unto them, and delivered Yahusha (Jesus), when he had scourged him, to be crucified.$n$,'canon','isaiah',53,5,$n$thread:his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance | *He was wounded for our transgressions* (Yeshayahu/Isaiah 53:5).$n$,$n$Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* *And so Pilate, willing to content the people, released Barabbas unto them, and delivered Yahusha (Jesus), when he had scourged him, to be crucified.* (Mark 15:15) Pilate delivers Yahusha (Jesus) when he has scourged him, and Isaiah had said it long before: *with his stripes we are healed*. The scourging is the wounding for the transgressions of the people. He bears it, and it is not laid on them.$n$,10,$n$*He was wounded for our transgressions* (Yeshayahu/Isaiah 53:5).$n$,$n$Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities.* Isaiah names the wounding and bruising that Pilate's scourging carries out, and says it is borne for the people's sins.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (10, 'his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance', $n$His blood be on us, and on our children — the court that owned the blood, and the house that mourns him (Deuteronomy 21; Acts 5; Zechariah 12)$n$, $n$His blood be on us, and on our children — the court that owned the blood, and the house that mourns him (Deuteronomy 21; Acts 5; Zechariah 12)$n$, $n$It ain't new. Pilate washes his hands and the crowd in his court takes the blood on itself:

*When Pilate saw that he could prevail nothing, but that rather a tumult was made, he took water, and washed his hands before the multitude, saying, I am innocent of the blood of this just person: see ye to it.* (Matthew 27:24)

*Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25)

This has been read for seventeen centuries as a curse a whole people laid on its own children. Read what the words were in the Torah. Innocent blood is a charge against the ones who shed it or let it be shed, and the elders of the nearest city answered for it; the prayer was that it not be laid to the people's charge:

*Be merciful, O Yahuah (LORD), unto thy people Yashar'el (Israel), whom thou hast redeemed, and lay not innocent blood unto thy people of Yashar'el's (Israel’s) charge. And the blood shall be forgiven them.* (Deuteronomy 21:8)

Jeremiah said the same to the men who wanted him dead, and the men, not the nation, would carry it:

*But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* (Jeremiah 26:15)

The rulers knew whose charge the blood was. Weeks later, in the same city, they said so to the apostles:

*Saying, Did not we straitly command you that ye should not teach in this name? and, behold, ye have filled Jerusalem with your doctrine, and intend to bring this man’s blood upon us.* (Acts 5:28)

*Upon us*: the council that tried him. Yahusha (Jesus) had already set the blood where it belonged, on the ones who killed the prophets and would kill him, the rulers of the city, in the same breath that he wept over her:

*That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zechariah son of Barachias, whom ye slew between the temple and the altar.* (Matthew 23:35)

*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37)

*How often would I have gathered thy children*. The children are the ones he wanted to gather, not the ones cursed. The blood that cries from the ground was Abel's, and it cried against his brother, not against a people:

*And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* (Genesis 4:10)

And this blood speaks differently from Abel's:

*And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* (Hebrews 12:24)

The prophets say what the house that pierced him does with his blood at the end. It mourns him, the same house, and a third of it is left:

*And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn.* (Zechariah 12:10)

*And it shall come to pass, that in all the land, saith Yahuah (LORD), two parts therein shall be cut off and die; but the third shall be left therein.* (Zechariah 13:8)

The blood fell on the court that owned it and on the city that stood in it forty years later. It is not a curse on the people of Yahudah (Judah) or on their children. The same people are the house of David that looks on him whom they pierced and mourns.$n$, $n$It ain't new. Pilate washes his hands and the crowd in his court takes the blood on itself:

*When Pilate saw that he could prevail nothing, but that rather a tumult was made, he took water, and washed his hands before the multitude, saying, I am innocent of the blood of this just person: see ye to it.* (Matthew 27:24)

*Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25)

This has been read for seventeen centuries as a curse a whole people laid on its own children. Read what the words were in the Torah. Innocent blood is a charge against the ones who shed it or let it be shed, and the elders of the nearest city answered for it; the prayer was that it not be laid to the people's charge:

*Be merciful, O Yahuah (LORD), unto thy people Yashar'el (Israel), whom thou hast redeemed, and lay not innocent blood unto thy people of Yashar'el's (Israel’s) charge. And the blood shall be forgiven them.* (Deuteronomy 21:8)

Jeremiah said the same to the men who wanted him dead, and the men, not the nation, would carry it:

*But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* (Jeremiah 26:15)

The rulers knew whose charge the blood was. Weeks later, in the same city, they said so to the apostles:

*Saying, Did not we straitly command you that ye should not teach in this name? and, behold, ye have filled Jerusalem with your doctrine, and intend to bring this man’s blood upon us.* (Acts 5:28)

*Upon us*: the council that tried him. Yahusha (Jesus) had already set the blood where it belonged, on the ones who killed the prophets and would kill him, the rulers of the city, in the same breath that he wept over her:

*That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zechariah son of Barachias, whom ye slew between the temple and the altar.* (Matthew 23:35)

*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37)

*How often would I have gathered thy children*. The children are the ones he wanted to gather, not the ones cursed. The blood that cries from the ground was Abel's, and it cried against his brother, not against a people:

*And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* (Genesis 4:10)

And this blood speaks differently from Abel's:

*And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* (Hebrews 12:24)

The prophets say what the house that pierced him does with his blood at the end. It mourns him, the same house, and a third of it is left:

*And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn.* (Zechariah 12:10)

*And it shall come to pass, that in all the land, saith Yahuah (LORD), two parts therein shall be cut off and die; but the third shall be left therein.* (Zechariah 13:8)

The blood fell on the court that owned it and on the city that stood in it forty years later. It is not a curse on the people of Yahudah (Judah) or on their children. The same people are the house of David that looks on him whom they pierced and mourns.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 10 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 10 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (his-blood-be-on) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — his-blood-be-on done.'
