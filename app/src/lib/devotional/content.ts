/**
 * devotional/content.ts — the SEED content set.
 *
 * A starter library, written to be expanded. One devotional theme of seven
 * entries walking the appointed times of Leviticus 23, and seven daily prayers
 * of the remnant. Everything here stands on core framework ground — the Sabbath
 * and the feasts the Father appointed, the restored Name, the regathering of the
 * scattered seed of all the tribes of Yashar'el (Israel) — and stays off
 * contested specifics.
 *
 * Restored sacred names with parenthetical equivalents, per the body-text
 * convention. Scripture quoted in full — come and see — so the reader meets the
 * Word on the page without leaving it. The invitations name the lie and open the
 * door home; they never hand the reader a program. What he does next is between
 * him and the Father.
 *
 * To expand: add DevotionalTheme objects to THEMES and DailyPrayer objects to
 * PRAYERS. The loader cycles whatever is here by day — nothing else changes.
 */

import type { DailyPrayer, DevotionalTheme } from "./types.ts";

// ───────────────────────────────────────────────────────────────────────
// Theme: The Appointed Times
// ───────────────────────────────────────────────────────────────────────

const APPOINTED_TIMES: DevotionalTheme = {
  id: "appointed-times",
  title: "The Appointed Times",
  subtitle: "Seven days through the feasts the Father set — and never moved.",
  description:
    "The moedim are not Yahudi (Jewish) holidays the rest of us look in on from " +
    "outside. They are the appointments Yahuah (God) wrote into the sun and the " +
    "moon at creation — His calendar, His rehearsals, His shadow of the things to " +
    "come. The pulpit told a divorced and scattered people that these days were " +
    "nailed to a cross. The prophets say all flesh will keep them in the age to " +
    "come. This is a seven-day walk back to the table the Father set for His own.",
  entries: [
    {
      id: "sabbath",
      title: "The Seventh Day",
      subtitle: "The first appointed time — rest written into creation itself.",
      passageRef: "Genesis 2:1-3",
      passageText:
        "Thus the heavens and the earth were finished, and all the host of them. " +
        "And on the seventh day Elohim (God) ended his work which he had made; and " +
        "he rested on the seventh day from all his work which he had made. And " +
        "Elohim (God) blessed the seventh day, and sanctified it: because that in " +
        "it he had rested from all his work which Elohim (God) created and made.",
      reflection:
        "Before there was a tabernacle, before there was a commandment carved in " +
        "stone, before there was a Yashar'elite (Israelite) to keep it — there was " +
        "the seventh day, blessed and set apart by the One who made the week. The " +
        "Sabbath is older than Sinai. It is not Jewish law; it is the rhythm of the " +
        "Maker stitched into the first seven days of the world. The horn moved the " +
        "day. It did not have the authority to. A council changed the calendar; the " +
        "Father never signed the order. And the grandmother who rests on the wrong " +
        "day loves Him still — she was handed the change in good faith, by teachers " +
        "who were handed it before her. The lie is not hers. But the day He hallowed " +
        "is still there, every seventh sunset, waiting.",
      invitation:
        "You do not have to earn your rest. It was finished and blessed before you " +
        "drew a breath. When the sun goes down on the sixth day, the gift is already " +
        "given — not a burden the Father laid on you, but one He lifted off. Come " +
        "home to the day He set apart, and let Him show you what it is for.",
      closing: "He rested, and He called it good. So can you.",
    },
    {
      id: "passover",
      title: "Passover",
      subtitle: "The blood on the door — and the Lamb it was always pointing to.",
      passageRef: "Exodus 12:13",
      passageText:
        "And the blood shall be to you for a token upon the houses where ye are: " +
        "and when I see the blood, I will pass over you, and the plague shall not be " +
        "upon you to destroy you, when I smite the land of Egypt.",
      reflection:
        "It was never the worthiness of the house that turned the destroyer aside. " +
        "It was the blood on the door. Egypt's firstborn and Yashar'el's (Israel's) " +
        "firstborn were equal under judgment until the lamb was slain and its blood " +
        "marked the lintel. Centuries later, on that same appointed day, Yahusha " +
        "(Jesus) — the Lamb the first one only rehearsed — was lifted up. Paul says " +
        "it plainly: \"For even Messiah (Christ) our passover is sacrificed for us\" " +
        "(1 Corinthians 5:7). This is the door home. Not the cancellation of the " +
        "Father's ways — the opening of the way back to them. The blood does not " +
        "abolish the house; it saves the house, so the redeemed can walk out of " +
        "Egypt and follow Him into the wilderness toward the mountain.",
      invitation:
        "The judgment is real and the door is open at the same time — one motion of " +
        "one love. You were not bought out of obedience; you were bought back into " +
        "the family. Stand under the blood and let it carry you out of the land of " +
        "your bondage. The Lamb has already gone before you.",
      closing: "When He sees the blood, He passes over. He always has.",
    },
    {
      id: "unleavened-bread",
      title: "Unleavened Bread",
      subtitle: "Out of Egypt in haste — and the leaven swept out of the house.",
      passageRef: "1 Corinthians 5:7-8",
      passageText:
        "Purge out therefore the old leaven, that ye may be a new lump, as ye are " +
        "unleavened. For even Messiah (Christ) our passover is sacrificed for us: " +
        "Therefore let us keep the feast, not with old leaven, neither with the " +
        "leaven of malice and wickedness; but with the unleavened bread of sincerity " +
        "and truth.",
      reflection:
        "Notice what Paul tells a people he is bringing home: \"let us keep the " +
        "feast.\" Not let us remember a feast we no longer keep — let us keep it. He " +
        "reads the leaven as the old life clinging to the redeemed: the malice, the " +
        "self-deceit, the lies swept up in the corners. Yashar'el (Israel) left " +
        "Egypt in such haste the bread had no time to rise, and the haste was mercy " +
        "— you do not linger in the house of bondage once the door is open. The same " +
        "Spirit that marked the door now searches the house. He is not looking for " +
        "perfection before He moves in; He moves in and begins to clean, room by " +
        "room, with the willing.",
      invitation:
        "You cannot purge yourself clean by striving, and you were never asked to. " +
        "The bread is already unleavened — He calls you what He is making you. Let " +
        "Him sweep the old leaven out at His pace. Sincerity and truth are not the " +
        "entrance fee; they are the house He is preparing for Himself in you.",
      closing: "A new lump — because the Baker has not finished with you.",
    },
    {
      id: "firstfruits",
      title: "Firstfruits",
      subtitle: "The first sheaf waved — the promise that the whole field is coming.",
      passageRef: "Leviticus 23:10-11",
      passageText:
        "Speak unto the children of Yashar'el (Israel), and say unto them, When ye " +
        "be come into the land which I give unto you, and shall reap the harvest " +
        "thereof, then ye shall bring a sheaf of the firstfruits of your harvest " +
        "unto the priest: And he shall wave the sheaf before Yahuah (the LORD), to " +
        "be accepted for you: on the morrow after the sabbath the priest shall wave " +
        "it.",
      reflection:
        "The first sheaf is not the harvest. It is the pledge of the harvest — the " +
        "field's promise that the rest is ripe and coming in behind it. On the morrow " +
        "after the Sabbath in the Passover week, the priest lifted the first cut grain " +
        "before Yahuah (the LORD). And on that very day Yahusha (Jesus) rose: \"But " +
        "now is Messiah (Christ) risen from the dead, and become the firstfruits of " +
        "them that slept\" (1 Corinthians 15:20). He is the first sheaf. His rising is " +
        "the Father's pledge over a whole scattered field — the lost sheep of the " +
        "house of Yashar'el (Israel) sown into every nation — that the gathering is " +
        "real and the reaping has begun.",
      invitation:
        "If you feel the pull homeward — toward the Name, the Sabbath, the Word read " +
        "plainly — that pull is not your idea. You are grain waking in a field the " +
        "Father planted before the foundation of the world. The first sheaf has " +
        "already been waved and accepted. The harvest He began, He finishes.",
      closing: "He is risen — the firstfruits — and the field is His.",
    },
    {
      id: "weeks",
      title: "The Feast of Weeks",
      subtitle: "Fifty days counted — Torah written this time on the heart.",
      passageRef: "Leviticus 23:15-16",
      passageText:
        "And ye shall count unto you from the morrow after the sabbath, from the day " +
        "that ye brought the sheaf of the wave offering; seven sabbaths shall be " +
        "complete: Even unto the morrow after the seventh sabbath shall ye number " +
        "fifty days; and ye shall offer a new meat offering unto Yahuah (the LORD).",
      reflection:
        "Count fifty. From the firstfruits to the Feast of Weeks the people number " +
        "the days, and at the mountain on that fiftieth day the Torah was given in " +
        "fire. Generations later, on that same appointed day, the Ruach HaKodesh " +
        "(Holy Spirit) fell in fire — and this was no abolishing of what was given at " +
        "Sinai. It was the same word moving from stone to flesh, exactly as He " +
        "promised: \"I will put my law in their inward parts, and write it in their " +
        "hearts\" (Jeremiah 31:33). The Spirit who came at Weeks is the Spirit who " +
        "spoke the commandments. He does not lead away from the Father's instruction. " +
        "He writes it where no horn can move it.",
      invitation:
        "You were never meant to keep His ways by gritted teeth on tablets of stone. " +
        "The new heart is the gift — His own Spirit teaching you to love what He " +
        "loves from the inside out. Count the days with Him. What was thundered from " +
        "the mountain, He wants to whisper into you.",
      closing: "The same word, the same Spirit — now in flesh that beats.",
    },
    {
      id: "trumpets",
      title: "The Day of Trumpets",
      subtitle: "A blast in the seventh month — the shout that gathers the scattered.",
      passageRef: "Leviticus 23:24",
      passageText:
        "Speak unto the children of Yashar'el (Israel), saying, In the seventh " +
        "month, in the first day of the month, shall ye have a sabbath, a memorial " +
        "of blowing of trumpets, an holy convocation.",
      reflection:
        "The spring feasts are kept; the autumn feasts still cast their shadow " +
        "forward. The first of them is a trumpet — a memorial blast over a people " +
        "scattered to the four winds. The prophets hear in it the sound of the " +
        "ingathering: \"the great trumpet shall be blown, and they shall come which " +
        "were ready to perish... and shall worship Yahuah (the LORD) in the holy " +
        "mount at Yerushalayim (Jerusalem)\" (Isaiah 27:13). The ten tribes the " +
        "world counts as lost are not lost to Him. He divorced them, scattered them " +
        "among the nations until they forgot their own name — and He swore to blow " +
        "the trumpet and bring them home. That trumpet is for them. It may be for " +
        "you.",
      invitation:
        "If your own heart has begun to stir at things you cannot fully explain — a " +
        "homesickness for a covenant you were never taught — listen. The trumpet of " +
        "the gathering is sounding over the whole earth in this season. You do not " +
        "have to make yourself His. If you hear His voice and turn, it is because you " +
        "were always His.",
      closing: "He blows the trumpet, and the scattered come home.",
    },
    {
      id: "tabernacles",
      title: "The Feast of Tabernacles",
      subtitle: "The ingathering — when He pitches His tent among His own at last.",
      passageRef: "Revelation 21:3",
      passageText:
        "And I heard a great voice out of heaven saying, Behold, the tabernacle of " +
        "Elohim (God) is with men, and he will dwell with them, and they shall be " +
        "his people, and Elohim (God) himself shall be with them, and be their " +
        "Elohim (God).",
      reflection:
        "Tabernacles is the last feast and the great ingathering — the harvest fully " +
        "come in, the people dwelling in temporary booths to remember they were " +
        "pilgrims He carried through a wilderness. Every appointed time before it has " +
        "been leading here: the Lamb slain, the leaven swept, the firstfruits raised, " +
        "the Spirit poured, the trumpet sounded, the scattered gathered — all of it " +
        "so that the end of the story is the Father moving in. Not us climbing up to " +
        "a distant heaven. Him pitching His tent in the midst of a gathered people " +
        "and never leaving again. The whole calendar is one long invitation to that " +
        "table.",
      invitation:
        "The feasts were never about the days for their own sake. They are the shape " +
        "of how He brings His own home and comes to dwell with them. Let the rehearsal " +
        "do its work in you — and let your eyes lift to the day the booths give way to " +
        "the real thing, and He tabernacles with His people forever.",
      closing: "He will dwell with them. That is where every appointed time was going.",
    },
  ],
};

// ───────────────────────────────────────────────────────────────────────
// Themes: the felt-need set (S234) — authored in Yoshi's voice via the
// yoshi-voice skill. ~30 entries each; the loader rotates whichever theme
// the reader has chosen, one entry per biblical day.
// ───────────────────────────────────────────────────────────────────────

const PEACE_FOR_THE_ANXIOUS: DevotionalTheme = {
  id: "peace-for-the-anxious",
  title: "Peace for the Anxious",
  subtitle: "Thirty days of laying the racing heart down at the Father's feet.",
  description:
    "Anxiety tells you the weight is yours to carry and the future is yours " +
    "to secure. It is an old lie wearing a modern face — the same voice from " +
    "the garden whispering that the Father is far off and cannot be trusted " +
    "with the thing that frightens you. But the One who blew the trumpet over " +
    "the scattered did not lose track of one sheep, and He does not lose track " +
    "of you. This is a thirty-day walk back to His nearness — not a program to " +
    "fix your worry, but an invitation to hand it to the only One strong enough " +
    "to hold it. The peace He gives is not the absence of the storm; it is the " +
    "presence of the Shepherd in the middle of it.",
  entries: [
    {
      id: "be-careful-for-nothing",
      title: "The Peace That Guards",
      subtitle: "Anxiety traded at the only counter that takes it — prayer.",
      passageRef: "Philippians 4:6-7",
      passageText:
        "Be careful for nothing; but in every thing by prayer and supplication " +
        "with thanksgiving let your requests be made known unto Elohim (God). " +
        "And the peace of Elohim (God), which passeth all understanding, shall " +
        "keep your hearts and minds through Messiah Yahusha (Christ Jesus).",
      reflection:
        "The world tells you to manage your anxiety — to breathe it down, to " +
        "reason it away, to white-knuckle it until it loosens its grip. Paul, " +
        "writing from a prison cell to the scattered seed coming home, says " +
        "something the self-help shelf cannot say: take it nowhere but to the " +
        "Father. Not in the abstract — in every thing, by prayer, by name, the " +
        "particular fear set down at His feet. And notice what He sends back in " +
        "exchange: not an explanation, not a guarantee that the thing you dread " +
        "will not come, but a peace that does not even make sense to the mind " +
        "doing the worrying. It passeth all understanding because it does not " +
        "come from understanding. It comes from Him. And it does not merely " +
        "soothe — it stands guard, a garrison around the heart and the mind, so " +
        "the lie cannot get back in through the gate it just left by.",
      invitation:
        "You were never meant to be the keeper of your own heart. The Father " +
        "is offering to post a guard you could never afford and never earn. " +
        "Bring Him the thing you have been turning over at two in the morning — " +
        "not cleaned up, not solved, just handed over. The peace that guards is " +
        "not a technique you master. It is a gift He gives the one who finally " +
        "stops carrying what was always His to hold.",
      closing: "Hand Him the weight, and let His peace stand watch.",
    },
    {
      id: "casting-your-care",
      title: "Cast It On Him",
      subtitle: "The weight you keep lifting was His to carry all along.",
      passageRef: "1 Peter 5:6-7",
      passageText:
        "Humble yourselves therefore under the mighty hand of Elohim (God), " +
        "that he may exalt you in due time: Casting all your care upon him; for " +
        "he careth for you.",
      reflection:
        "To cast is to throw — to fling something away from yourself with the " +
        "whole arm, not to set it gently down where you can pick it back up. " +
        "Peter writes to a people scattered through the provinces, strangers " +
        "and pilgrims in lands not their own, and he names the root under the " +
        "worry: pride. We keep the care because some part of us believes the " +
        "outcome depends on our gripping it tight enough. Humbling yourself " +
        "under His mighty hand is admitting the truth the anxious heart fights " +
        "— that you are not the one holding the world together, and you were " +
        "never asked to be. The same hand that scattered and swore to gather is " +
        "mighty enough for whatever has you afraid. And the reason He invites " +
        "the casting is the tenderest clause in the verse: he careth for you. " +
        "Not the world in general. You.",
      invitation:
        "Stop rehearsing the disaster as though watching it closely could keep " +
        "it from coming. The Father is not a distant force indifferent to your " +
        "trouble; He bends low to the one who throws her care on Him. You do " +
        "not have to carry it one more hour. Cast it — the whole weight, in one " +
        "motion — onto the One who has been waiting to catch it.",
      closing: "He careth for you. Let that be enough to let go.",
    },
    {
      id: "the-lord-is-my-shepherd",
      title: "I Shall Not Want",
      subtitle: "The Shepherd leads; the sheep need not provide for itself.",
      passageRef: "Psalm 23:1-3",
      passageText:
        "Yahuah Ra'ah (The LORD is my shepherd); I shall not want. He maketh " +
        "me to lie down in green pastures: he leadeth me beside the still " +
        "waters. He restoreth my soul: he leadeth me in the paths of " +
        "righteousness for his name's sake.",
      reflection:
        "A sheep does not lie down when it is anxious. It cannot rest while it " +
        "fears for the next meal, the next predator, the next dry stretch of " +
        "ground. So when David says the Shepherd maketh him lie down in green " +
        "pastures, he is describing a creature whose fear has been answered — " +
        "not by its own foraging, but by a Shepherd who has gone ahead and " +
        "knows where the grass is and where the water runs still enough to " +
        "drink. Anxiety is, at bottom, the sheep convinced there is no shepherd " +
        "— that provision and protection rest on its own frantic vigilance. The " +
        "psalm answers the lie not with a strategy but with a Person. He leads. " +
        "He restores. He does it for His name's sake, which means your rest is " +
        "bound up in His own honor — He will not let His sheep starve and call " +
        "Himself the Shepherd.",
      invitation:
        "You have been trying to be your own shepherd, and it is exhausting " +
        "work that was never yours. The Father is not asking you to find the " +
        "pasture; He is asking you to follow the One who already knows where it " +
        "is. Lie down. The grass is green because He led you here. The waters " +
        "are still because He stilled them.",
      closing: "The Shepherd leads. The sheep can finally lie down.",
    },
    {
      id: "consider-the-fowls",
      title: "Consider the Birds",
      subtitle: "If He feeds what does not sow, will He forget His own child?",
      passageRef: "Matthew 6:25-26",
      passageText:
        "Therefore I say unto you, Take no thought for your life, what ye " +
        "shall eat, or what ye shall drink; nor yet for your body, what ye " +
        "shall put on. Is not the life more than meat, and the body than " +
        "raiment? Behold the fowls of the air: for they sow not, neither do " +
        "they reap, nor gather into barns; yet your heavenly Father feedeth " +
        "them. Are ye not much better than they?",
      reflection:
        "Yahusha (Jesus) does not answer worry with a lecture on economics. He " +
        "points at a bird. The sparrow does not lie awake forecasting famine; " +
        "it does not sow or reap or store against the winter, and yet it is " +
        "fed, every day, by a Father who keeps account of creatures the market " +
        "values at half a farthing. The argument is from the lesser to the " +
        "greater: if the One who scattered and swore to gather His seed will " +
        "not let a sparrow fall unnoticed, how much more the child He has " +
        "called by name? Anxiety quietly recasts the Father as forgetful, " +
        "stretched thin, perhaps unable to keep up with your particular need. " +
        "The birds preach against that lie all day long. Take no thought, He " +
        "says — not because the need is unreal, but because the One who feeds " +
        "the field has not lost sight of you.",
      invitation:
        "Look up the next time a bird crosses your window. It was fed this " +
        "morning by the same Father who knows the number of hairs on your head. " +
        "You are not a burden He is struggling to carry; you are a child He " +
        "delights to provide for. Lay down the ledger of dread and let Him show " +
        "you He has been keeping the books all along.",
      closing: "He feeds the sparrow. He has not forgotten you.",
    },
    {
      id: "fear-thou-not",
      title: "Fear Thou Not",
      subtitle: "The hand that upholds you is the hand of righteousness itself.",
      passageRef: "Isaiah 41:10",
      passageText:
        "Fear thou not; for I am with thee: be not dismayed; for I am thy " +
        "Elohim (God): I will strengthen thee; yea, I will help thee; yea, I " +
        "will uphold thee with the right hand of my righteousness.",
      reflection:
        "Isaiah speaks this to a people about to be scattered, then promised " +
        "home — and the comfort is not that the trouble will pass them by, but " +
        "that they will not face it alone. Four times in one breath He stacks " +
        "His promises against their fear: I am with thee, I will strengthen, I " +
        "will help, I will uphold. Notice the order. He does not first command " +
        "them to be brave and then maybe show up. He gives the reason before " +
        "the command can sink: fear not, for I am with thee. The presence is " +
        "the cure, not the willpower. The anxious heart hears every voice but " +
        "this one — it rehearses the dismay, the worst case, the falling. And " +
        "into that noise the Father says He will hold them up with the very " +
        "hand of His righteousness, the same hand that keeps every covenant He " +
        "ever swore. That hand has never once let go.",
      invitation:
        "You do not have to manufacture courage you do not feel. The Father is " +
        "not waiting for you to be strong before He draws near; He draws near " +
        "so that you can be. Let the fear be what it is, and then let His four " +
        "promises stand over it. The hand that upholds the covenant is reaching " +
        "for you in the middle of the dread.",
      closing: "I am with thee — and that is the end of the fear.",
    },
    {
      id: "cast-thy-burden",
      title: "He Will Sustain You",
      subtitle: "The righteous are not promised no burden — only One who carries it.",
      passageRef: "Psalm 55:22",
      passageText:
        "Cast thy burden upon Yahuah (the LORD), and he shall sustain thee: he " +
        "shall never suffer the righteous to be moved.",
      reflection:
        "David wrote this while a friend's betrayal was tearing at him — he " +
        "knew the kind of anxiety that comes not from the unknown but from the " +
        "known wound that will not stop aching. And his counsel to his own " +
        "racing heart is the same the whole of scripture gives: roll the burden " +
        "off your back and onto Yahuah (the LORD). He does not promise the " +
        "burden will vanish. He promises something better — that you will be " +
        "sustained under it, held up by a strength not your own, so that the " +
        "weight that should have crushed you cannot move you off your footing. " +
        "The lie of anxiety is that you must hold steady by your own grip on " +
        "the rock. The psalm says the grip is His. He sustains. He keeps the " +
        "righteous from being moved — not by removing every storm, but by " +
        "anchoring the one who casts the burden where it belongs.",
      invitation:
        "Whatever you woke up carrying this morning was never meant to be " +
        "shouldered alone. The Father is not asking you to be unbreakable; He " +
        "is offering to be the one who holds you together. Roll it onto Him. " +
        "You will not be moved, because the One sustaining you cannot be.",
      closing: "Cast it; He sustains. You will not be moved.",
    },
    {
      id: "peace-i-leave-with-you",
      title: "Not As the World Gives",
      subtitle: "A peace the world cannot manufacture and cannot take away.",
      passageRef: "John 14:27",
      passageText:
        "Peace I leave with you, my peace I give unto you: not as the world " +
        "giveth, give I unto you. Let not your heart be troubled, neither let " +
        "it be afraid.",
      reflection:
        "The world gives a counterfeit peace — the peace of the locked door, " +
        "the full bank account, the favorable forecast, the conflict avoided. " +
        "It is a peace entirely dependent on circumstances holding steady, and " +
        "so it evaporates the moment the circumstances shift. Yahusha (Jesus) " +
        "says His peace is not that kind. He gave it to His own on the night " +
        "before the cross — the very hour when every external reason for peace " +
        "was about to collapse. That is the point. His peace does not rest on " +
        "the storm staying away; it rests on Him, the Formed Word who walked " +
        "the waters and spoke them calm. When He says let not your heart be " +
        "troubled, it is not a scolding. It is the gentle authority of the One " +
        "who has the power to make the words true in you. The world's peace is " +
        "a loan it can call back any day. His is a gift, left in your keeping, " +
        "that no circumstance can repossess.",
      invitation:
        "Stop waiting for the conditions to line up before you let your heart " +
        "rest. The peace He offers was given precisely for the night when " +
        "everything looks like it is falling apart. Receive what He left you — " +
        "not the brittle calm the world sells, but the deep stillness of the " +
        "One who holds the storm and you at the same time.",
      closing: "My peace I give you — and the world cannot take it back.",
    },
    {
      id: "he-will-not-fail-thee",
      title: "He Goes Before You",
      subtitle: "You do not walk into tomorrow first — He is already there.",
      passageRef: "Deuteronomy 31:8",
      passageText:
        "And Yahuah (the LORD), he it is that doth go before thee; he will be " +
        "with thee, he will not fail thee, neither forsake thee: fear not, " +
        "neither be dismayed.",
      reflection:
        "Mosheh (Moses) speaks this to a people standing at the edge of a " +
        "future they could not see — a wilderness behind them, a promised land " +
        "ahead, and giants in it. Anxiety lives in exactly that gap: the space " +
        "between where you stand and the unknown thing you are about to walk " +
        "into. And the answer Mosheh (Moses) gives is not a map of the future. " +
        "It is the presence of the One who already occupies it. Yahuah (the " +
        "LORD) doth go before thee — He is not behind you pushing, not beside " +
        "you keeping pace, but ahead of you, already standing in the tomorrow " +
        "you are afraid of. He will not fail. He will not forsake. The dread of " +
        "what is coming assumes you will meet it alone and unprepared. The " +
        "truth is that He has gone in first, and there is no moment of your " +
        "future He has not already entered.",
      invitation:
        "You do not have to scout the future to feel safe walking into it. The " +
        "Father is already there, in the room you dread, in the day you have " +
        "not yet lived. Step forward into tomorrow knowing the One who never " +
        "fails has gone ahead and is waiting for you there.",
      closing: "He goes before you. Tomorrow is not empty of Him.",
    },
    {
      id: "thy-comforts-delight",
      title: "When Thoughts Multiply",
      subtitle: "The racing mind met by a comfort that delights the soul.",
      passageRef: "Psalm 94:19",
      passageText:
        "In the multitude of my thoughts within me thy comforts delight my " +
        "soul.",
      reflection:
        "Anyone who has lain awake at night knows the multitude of thoughts — " +
        "the way one worry breeds another, branching and multiplying until the " +
        "mind is a crowd of voices all talking at once. The psalmist does not " +
        "pretend he is above it; he names it plainly, the multitude within him. " +
        "But he does not stop at the diagnosis. He sets one thing against the " +
        "crowd: thy comforts. Not his own reasoning, not a trick to silence the " +
        "thoughts, but the Father's comforts arriving from outside the spiral " +
        "and doing what no amount of self-talk can do — they delight the soul. " +
        "The crowd is loud, but the Comforter is louder, and His comfort is not " +
        "grim endurance. It is delight, the deep gladness of a child who " +
        "remembers, in the middle of the noise, whose he is. The thoughts " +
        "multiply; the comfort outweighs them.",
      invitation:
        "When the thoughts crowd in tonight and multiply faster than you can " +
        "answer them, you do not have to win the argument with your own mind. " +
        "Turn instead toward the One whose comforts come from beyond the " +
        "spiral. Let Him speak the one word that quiets the crowd, and let His " +
        "comfort be the delight that carries you down into rest.",
      closing: "The thoughts are many; His comfort is more.",
    },
    {
      id: "perfect-peace",
      title: "The Stayed Mind",
      subtitle: "Peace kept perfect not by control, but by where the mind rests.",
      passageRef: "Isaiah 26:3",
      passageText:
        "Thou wilt keep him in perfect peace, whose mind is stayed on thee: " +
        "because he trusteth in thee.",
      reflection:
        "Notice that the peace here is not something the anxious person " +
        "produces. It is something the Father keeps — He is the one doing the " +
        "keeping, and the peace is perfect because the Keeper is. The only " +
        "thing asked of the trembling heart is where it stays its mind. The " +
        "anxious mind stays itself on the threat: it returns, again and again, " +
        "to the thing it fears, rehearsing it, circling it, feeding it. Isaiah " +
        "names a different resting place. To stay the mind on Him is to keep " +
        "turning the gaze back to the One who scattered and gathers, who keeps " +
        "every covenant, who has never lost a single sheep — and the result is " +
        "not a peace you manufacture but a peace He maintains. The verse even " +
        "gives the hinge: because he trusteth in thee. The peace follows the " +
        "trust the way the harvest follows the rain. You do not strain for it; " +
        "you stay your mind, and He keeps you.",
      invitation:
        "You cannot force your mind to be still by command, but you can choose " +
        "what it stays on. Each time the fear pulls your gaze back to itself, " +
        "turn it again, gently, toward the Father — not to a technique, but to " +
        "Him. The keeping is His work. Your part is only to keep looking His " +
        "way.",
      closing: "Stay your mind on Him; He keeps the peace.",
    },
    {
      id: "come-unto-me",
      title: "Rest for the Weary",
      subtitle: "The yoke He offers is the easing of the one you are under.",
      passageRef: "Matthew 11:28-29",
      passageText:
        "Come unto me, all ye that labour and are heavy laden, and I will give " +
        "you rest. Take my yoke upon you, and learn of me; for I am meek and " +
        "lowly in heart: and ye shall find rest unto your souls.",
      reflection:
        "There is a kind of exhaustion that sleep cannot touch — the weariness " +
        "of a soul that has been laboring under a load it was never built to " +
        "carry. Yahusha (Jesus) calls precisely that person: not the rested, " +
        "not the strong, but the heavy laden. And the rest He offers comes " +
        "wrapped in a strange image — a yoke. The pulpit has often read this as " +
        "a swap of one burden for an easier one, but hear what He actually " +
        "says: take my yoke, learn of me. The yoke is the Father's way, His " +
        "instruction, the path the meek and lowly One Himself walked. The world " +
        "told a scattered people that His ways were the heavy load; He says the " +
        "opposite — that His yoke is the rest, because under it you finally " +
        "stop pulling against the grain of how you were made. The anxiety of " +
        "carrying everything alone is the load. Walking yoked to Him is the " +
        "rest.",
      invitation:
        "You have been pulling a weight that has worn you down to the bone, " +
        "and He is not asking you to pull harder. He is asking you to come — " +
        "just as you are, just as tired as you are — and let Him take the yoke " +
        "alongside you. Learn His pace. Rest is not on the far side of more " +
        "effort. It is on the near side of coming to Him.",
      closing: "Come, all who are weary. The rest is in Him.",
    },
    {
      id: "be-still",
      title: "Be Still and Know",
      subtitle: "The striving stops when you remember who is still on the throne.",
      passageRef: "Psalm 46:10",
      passageText:
        "Be still, and know that I am Elohim (God): I will be exalted among " +
        "the heathen, I will be exalted in the earth.",
      reflection:
        "This command for stillness is spoken into a psalm full of upheaval — " +
        "mountains shaking, waters roaring, nations raging, the earth itself " +
        "melting. It is not a quiet meditation for a calm day. It is a word " +
        "spoken over chaos. Be still does not mean pretend the trouble is not " +
        "real; it means cease your frantic striving and remember who is still " +
        "Elohim (God) while the ground heaves. Anxiety is, at its core, the " +
        "soul forgetting who reigns — believing for a moment that the throne is " +
        "empty and the outcome rests on its own shoulders. The verse answers " +
        "with a fact that does not depend on your feelings: I am Elohim (God), " +
        "and I will be exalted. He will gather the scattered, He will set the " +
        "world right, He will be lifted up over every raging nation — and none " +
        "of it waits on your worry to come true. The stillness flows from the " +
        "knowing.",
      invitation:
        "Loosen your grip on the controls you were never actually holding. The " +
        "Father is not anxious about your circumstance, because He is the one " +
        "thing the chaos cannot shake. Be still — not because nothing is wrong, " +
        "but because the One on the throne is unmoved, and He is yours.",
      closing: "Be still; the throne is not empty, and it is His.",
    },
    {
      id: "his-compassions-fail-not",
      title: "New Every Morning",
      subtitle: "Tomorrow's mercy is already made and waiting at the dawn.",
      passageRef: "Lamentations 3:22-23",
      passageText:
        "It is of Yahuah's (the LORD's) mercies that we are not consumed, " +
        "because his compassions fail not. They are new every morning: great " +
        "is thy faithfulness.",
      reflection:
        "Lamentations is a book of grief — Yerushalayim (Jerusalem) in ruins, " +
        "the people scattered, every visible comfort stripped away. And right " +
        "in the middle of that wreckage, the prophet says something defiant: " +
        "His compassions fail not. Anxiety is often a thing about tomorrow — " +
        "the fear that when the next morning comes, the mercy will have run " +
        "dry, the strength will not be there, the Father will have moved on. " +
        "The verse forecloses that fear. The mercies are new every morning, " +
        "freshly made, never the leftover scraps of yesterday's supply. You " +
        "cannot exhaust them by needing too much, and you cannot use up " +
        "tomorrow's by spending today's. The reason you are not consumed by the " +
        "very worry pressing on you is that He has been renewing the mercy " +
        "underneath you all along. Great is thy faithfulness — not because the " +
        "circumstances were kind, but because He is.",
      invitation:
        "The grace you will need tomorrow is not yours to manufacture tonight, " +
        "and you do not have to. It is being prepared by a Father whose mercies " +
        "have never once failed to arrive at the dawn. Let go of the dread that " +
        "you will run out. You will wake to a mercy already new, already enough, " +
        "already there.",
      closing: "His mercies are new every morning. Tomorrow is already supplied.",
    },
    {
      id: "trust-in-the-lord",
      title: "Lean Not on Your Own Understanding",
      subtitle: "The path you cannot map is directed by the One who can.",
      passageRef: "Proverbs 3:5-6",
      passageText:
        "Trust in Yahuah (the LORD) with all thine heart; and lean not unto " +
        "thine own understanding. In all thy ways acknowledge him, and he " +
        "shall direct thy paths.",
      reflection:
        "So much anxiety is the mind trying to think its way to certainty — " +
        "running the scenarios, calculating the outcomes, leaning the whole " +
        "weight of the future on its own ability to figure things out in " +
        "advance. The proverb does not insult the understanding; it simply " +
        "names its limit. You were not given a mind large enough to hold " +
        "tomorrow, and the strain of trying to is the very thing wearing you " +
        "down. To trust with all the heart is to take the weight off the " +
        "overworked mind and set it on the One who actually sees the path from " +
        "end to end. He scattered the seed across the nations and knows exactly " +
        "where every grain lies and how each one comes home; He is not " +
        "improvising your life. Acknowledge Him in the way, and the directing " +
        "is His responsibility, not yours. The promise is not that you will " +
        "understand the path. It is that He will direct it.",
      invitation:
        "Set down the exhausting project of figuring it all out before it " +
        "happens. You were never meant to carry the future in your own head. " +
        "Trust the One who holds the whole path, acknowledge Him in the step in " +
        "front of you, and let the directing be His. The way will open as you " +
        "walk it, not before.",
      closing: "Trust Him with the path; He sees what you cannot.",
    },
    {
      id: "i-sought-the-lord",
      title: "Delivered From All Fears",
      subtitle: "The sought Father answers — not with advice, but with deliverance.",
      passageRef: "Psalm 34:4",
      passageText:
        "I sought Yahuah (the LORD), and he heard me, and delivered me from " +
        "all my fears.",
      reflection:
        "David wrote this after a terrifying escape, having feigned madness to " +
        "survive among enemies — he knew real fear, the kind that comes when " +
        "your life is genuinely at stake. And his testimony is simple and " +
        "complete: I sought, He heard, He delivered. Notice He does not say the " +
        "Father delivered him from all his enemies, though He could have. He " +
        "says delivered me from all my fears. The enemies may remain; the fear " +
        "is what He lifts. That is the deeper rescue — not always the removal " +
        "of the threat, but the breaking of the threat's grip on the heart. " +
        "Anxiety insists that no one is listening, that the cry disappears into " +
        "an empty sky. David's three short verbs answer the lie: He heard. The " +
        "seeking was not into the void. The same Father who hears the scattered " +
        "sheep when they call hears you, and the hearing is the beginning of " +
        "the deliverance.",
      invitation:
        "You do not have to wrestle your fears into submission on your own. The " +
        "Father who heard David in his terror is bent toward your cry right now. " +
        "Seek Him — not with the right words, just with the honest ones — and " +
        "let Him do what only He can: not merely calm the fear, but deliver you " +
        "from it.",
      closing: "Seek Him; He hears; He delivers from all your fears.",
    },
    {
      id: "he-will-rest-in-his-love",
      title: "He Quiets You With Love",
      subtitle: "The Mighty One in the midst of you sings over your fear.",
      passageRef: "Zephaniah 3:17",
      passageText:
        "Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he " +
        "will save, he will rejoice over thee with joy; he will rest in his " +
        "love, he will joy over thee with singing.",
      reflection:
        "This is one of the tenderest pictures in all the prophets, and it " +
        "comes at the end of a book of judgment — spoken over the very remnant " +
        "the Father swore to gather from their scattering. He is in the midst " +
        "of thee, the verse says: not watching from a height, not waiting at " +
        "the end of the road, but here, present, mighty to save. And then the " +
        "image turns astonishing. The One who flung the stars rejoices over you " +
        "with joy. He rests in His love for you. He joys over you with singing " +
        "— the Maker of heaven and earth humming over His own child the way a " +
        "parent sings over a frightened little one in the dark. Anxiety paints " +
        "the Father as stern, distant, perhaps disappointed. Zephaniah paints " +
        "Him singing. The fear says you are too much, too far gone, too small " +
        "to be loved like that. The Word says He is in the midst of you, and He " +
        "is glad.",
      invitation:
        "Picture it the next time the dread rises in the dark — not a distant " +
        "judge, but the Mighty One right there beside you, quieting you with " +
        "His love, singing over you with joy. You do not have to earn the song; " +
        "it is already being sung. Let the One who is in the midst of you do " +
        "what He delights to do, and rest.",
      closing: "He is in the midst of you, singing. Let Him quiet your heart.",
    },
    {
      id: "when-thou-passest-through-the-waters",
      title: "Through the Waters",
      subtitle: "Not over, not around — through, and not alone.",
      passageRef: "Isaiah 43:1-2",
      passageText:
        "But now thus saith Yahuah (the LORD) that created thee, O Ya'aqov " +
        "(Jacob), and he that formed thee, O Yashar'el (Israel), Fear not: for " +
        "I have redeemed thee, I have called thee by thy name; thou art mine. " +
        "When thou passest through the waters, I will be with thee; and through " +
        "the rivers, they shall not overflow thee: when thou walkest through " +
        "the fire, thou shalt not be burned; neither shall the flame kindle " +
        "upon thee.",
      reflection:
        "Read carefully what the Father does and does not promise the scattered " +
        "seed He calls by name. He does not say there will be no waters and no " +
        "fire. He says when — when you pass through the waters, when you walk " +
        "through the fire — as though the hard passage is a given, not a " +
        "maybe. The promise is not a life without deep water; it is His " +
        "presence in the deep water, so that the rivers do not overflow and the " +
        "flame does not consume. Anxiety begs for a route around the trouble " +
        "and panics when no detour appears. The Word offers something the " +
        "detour never could: I will be with thee, in it, all the way through. " +
        "And the ground under the promise is the strongest ground there is — I " +
        "have redeemed thee, I have called thee by thy name; thou art mine. The " +
        "One who formed you and bought you back does not lose His own in the " +
        "current.",
      invitation:
        "Stop straining to find the way around the thing you are dreading. The " +
        "Father has not promised you an easy passage, but He has promised " +
        "something far more solid — Himself, with you, in the middle of the " +
        "water and the fire. You are His, called by name, redeemed. Walk into " +
        "it knowing the flame cannot have you.",
      closing: "Through the waters, He is with you. You are His.",
    },
    {
      id: "i-will-lift-up-mine-eyes",
      title: "My Help Comes From Him",
      subtitle: "The Keeper who watches over you does not sleep.",
      passageRef: "Psalm 121:1-3",
      passageText:
        "I will lift up mine eyes unto the hills, from whence cometh my help. " +
        "My help cometh from Yahuah (the LORD), which made heaven and earth. He " +
        "will not suffer thy foot to be moved: he that keepeth thee will not " +
        "slumber.",
      reflection:
        "This is a song for the road — sung by pilgrims on the way up to the " +
        "appointed feasts, climbing through terrain where bandits hid in the " +
        "hills and a turned ankle could end the journey. The traveler lifts his " +
        "eyes to those very hills, the place of danger, and asks where help " +
        "comes from. The answer pulls his gaze higher still: not from the hills " +
        "themselves, but from the One who made heaven and earth. And here is " +
        "the line that speaks straight to the sleepless: He that keepeth thee " +
        "will not slumber. Anxiety is the night watch you keep over your own " +
        "life, certain that if you stop scanning the dark for threats, " +
        "something will slip past. The psalm relieves you of the post. You can " +
        "close your eyes because the Keeper never does. He does not nod off on " +
        "the watch. He does not need you to cover the gap, because there is no " +
        "gap in His watching.",
      invitation:
        "You have been keeping a watch that was never yours to keep, scanning " +
        "the dark long after you should have slept. The Father is already " +
        "awake, already watching, already guarding the very thing you fear to " +
        "leave unguarded. Lift your eyes to Him and let your hands fall. The " +
        "Keeper is on duty, and He does not sleep.",
      closing: "He who keeps you never slumbers. You may rest.",
    },
    {
      id: "not-the-spirit-of-fear",
      title: "Not a Spirit of Fear",
      subtitle: "What the Father gave you is not the dread that has been speaking.",
      passageRef: "2 Timothy 1:7",
      passageText:
        "For Elohim (God) hath not given us the spirit of fear; but of power, " +
        "and of love, and of a sound mind.",
      reflection:
        "Paul writes this to Timothy, a young man prone to timidity, facing " +
        "real opposition and his own trembling. And he tells him to consider " +
        "the source of the fear, because it matters where a thing comes from. " +
        "The spirit of fear — the constant low hum of dread, the voice that " +
        "shrinks and second-guesses and forecasts disaster — did not come from " +
        "the Father. He does not deal in that. What He gives is power, and " +
        "love, and a sound mind: a mind whole and ordered rather than a mind " +
        "fractured by anxiety into a hundred racing pieces. This is not a " +
        "command to feel brave by trying harder. It is a reminder of what is " +
        "already true of the one He has called — that the fear is a counterfeit, " +
        "an intruder, not the native air of a child of the Most High. The same " +
        "voice that lied in the garden has only ever had one strategy: to make " +
        "the Father's child believe the dread is his own.",
      invitation:
        "The next time the dread starts speaking, ask where it came from. It " +
        "is not the Father's gift to you, and you do not have to receive it as " +
        "though it were. What He has placed in you is steadier and truer — " +
        "power, love, a sound mind. Lean into what He actually gave, and let " +
        "the intruder be named for what it is.",
      closing: "The fear is not from Him. What He gave you is sound.",
    },
    {
      id: "what-time-i-am-afraid",
      title: "What Time I Am Afraid",
      subtitle: "Fear is not the absence of trust — it is trust's invitation.",
      passageRef: "Psalm 56:3-4",
      passageText:
        "What time I am afraid, I will trust in thee. In Elohim (God) I will " +
        "praise his word: in Elohim (God) I have put my trust; I will not fear " +
        "what flesh can do unto me.",
      reflection:
        "David does not pretend the fear away. He writes what time I am afraid " +
        "— admitting plainly that the fear comes, that there are hours when it " +
        "presses in. The triumph of the verse is not that he never trembles; it " +
        "is what he does in the trembling. The very moment fear rises, he turns " +
        "it into a doorway: I will trust in thee. He does not wait for the fear " +
        "to subside before he trusts; he trusts because the fear has come. " +
        "Anxiety tells you that fear and faith cannot share a heart, that " +
        "feeling afraid means your trust has failed. David shows the opposite — " +
        "that the afraid moment is exactly when trust does its work. And notice " +
        "what he leans on: in Elohim (God) I will praise his word. He anchors " +
        "to what the Father said, not to what his nerves are screaming. Flesh " +
        "can do a great deal, but it cannot touch the one the Father has " +
        "promised to keep.",
      invitation:
        "You do not have to wait until you feel unafraid to come to Him. The " +
        "fear itself is the cue — the moment to turn, deliberately, toward the " +
        "Father and trust. Take Him at His word in the very hour the dread is " +
        "loudest. Faith was never the absence of fear; it is what you do with " +
        "the fear when it comes.",
      closing: "What time you are afraid — that is the time to trust.",
    },
    {
      id: "be-strong-and-of-good-courage",
      title: "Wherever You Go",
      subtitle: "The command to courage rests on a promise of presence.",
      passageRef: "Joshua 1:9",
      passageText:
        "Have not I commanded thee? Be strong and of a good courage; be not " +
        "afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy " +
        "God) is with thee whithersoever thou goest.",
      reflection:
        "Yahushua (Joshua) is about to lead a people into a land of walled " +
        "cities and giants, stepping into shoes Mosheh (Moses) left empty — the " +
        "weight of it would crush anyone. And the Father commands him to be " +
        "strong and of good courage. But read the whole sentence: the command " +
        "is not a demand to summon courage out of nothing. It rests on a reason " +
        "that comes right after the colon — for Yahuah Elohayka (the LORD thy " +
        "God) is with thee. The courage is not self-generated grit; it is the " +
        "natural posture of a man who knows who walks beside him. Anxiety " +
        "hears the command be not afraid and despairs, because it cannot " +
        "manufacture the feeling on demand. But the verse never asked it to. It " +
        "ties the courage to the presence — whithersoever thou goest, there He " +
        "is. There is no destination, no meeting, no hard conversation, no " +
        "dreaded day that you will enter outside His company.",
      invitation:
        "You are not being asked to be brave by yourself, and you never were. " +
        "The courage the Father commands is the kind that comes from knowing He " +
        "is with you wherever the day takes you. Walk into the thing you have " +
        "been dreading not on borrowed bravado, but on the settled fact that He " +
        "goes there with you.",
      closing: "He is with you wherever you go. That is where courage comes from.",
    },
    {
      id: "prepare-thy-soul-for-temptation",
      title: "Settled Before the Trouble",
      subtitle: "The faithful are not spared trial — they are set on the rock.",
      passageRef: "Sirach 2:1-2",
      passageText:
        "My son, if thou come to serve Yahuah (the Lord), prepare thy soul for " +
        "temptation. Set thy heart aright, and constantly endure, and make not " +
        "haste in time of trouble.",
      reflection:
        "Here is wisdom the modern ear resists: the one who comes to serve the " +
        "Father is told to prepare his soul for trial, not to expect a life " +
        "swept clear of it. Much anxiety is born from a quiet false promise — " +
        "that walking with Him should mean smooth water, and so every storm " +
        "feels like a betrayal or a sign that something has gone wrong. The " +
        "ancient counsel cuts the lie at the root. Trouble is not evidence the " +
        "Father has abandoned you; it is the weather of a real walk in a real " +
        "world still groaning toward its restoration. So set the heart aright " +
        "beforehand. Constantly endure. And then the line that speaks directly " +
        "to the anxious — make not haste in time of trouble. Anxiety is haste: " +
        "the frantic grasping for a fix, the refusal to wait, the panic that " +
        "demands the trouble resolve now. The settled soul does not rush. It " +
        "holds steady, because it was prepared, and because the One it serves " +
        "is steady.",
      invitation:
        "Stop measuring your faith by how trouble-free your life is; that was " +
        "never the promise. When the storm comes — and it will — you do not " +
        "have to make haste, scrambling to force a resolution. Set your heart " +
        "on the Father ahead of time and let it stay there. The trouble will " +
        "pass; the rock you are set on will not move.",
      closing: "Make not haste in trouble; the One you serve is steady.",
    },
    {
      id: "the-lord-is-my-light",
      title: "Whom Shall I Fear",
      subtitle: "When He is your light, the dark loses its power to threaten.",
      passageRef: "Psalm 27:1",
      passageText:
        "Yahuah (The LORD) is my light and my salvation; whom shall I fear? " +
        "Yahuah (the LORD) is the strength of my life; of whom shall I be " +
        "afraid?",
      reflection:
        "Fear thrives in the dark — in the unlit corner of the future, the " +
        "shadowed thing that might be coming, the unknown that the mind fills " +
        "with monsters. David answers the dark not by lighting a candle of his " +
        "own courage, but by naming who his light is: Yahuah (the LORD) is my " +
        "light and my salvation. When the Father Himself is the light, there is " +
        "no shadow left for the fear to hide in. And then David asks the two " +
        "questions anxiety can never answer: whom shall I fear? of whom shall I " +
        "be afraid? The questions hang there because, held up against the One " +
        "who is the strength of his life, every threat shrinks to its true " +
        "size. Anxiety inflates the danger and shrinks the Father. The psalm " +
        "reverses it — sets the living Yahuah (the LORD) in the foreground and " +
        "lets the fear be measured against Him. The danger may be real, but it " +
        "is not larger than the One who is your salvation.",
      invitation:
        "Bring the thing you are afraid of out of the shadow and set it next " +
        "to the Father. Let Him be the light it is measured against, and watch " +
        "it return to its true and smaller size. You do not have to be the " +
        "strength of your own life. He is. And no fear is bigger than He is.",
      closing: "He is your light; the dark has nowhere left to hide.",
    },
    {
      id: "the-lord-is-good-a-strong-hold",
      title: "A Stronghold in Trouble",
      subtitle: "He knows the ones who shelter in Him — by name.",
      passageRef: "Nahum 1:7",
      passageText:
        "Yahuah (The LORD) is good, a strong hold in the day of trouble; and " +
        "he knoweth them that trust in him.",
      reflection:
        "Nahum's whole book thunders with judgment, and right in the middle of " +
        "it stands this single line of mercy like a doorway in a storm wall: " +
        "Yahuah (the LORD) is good, a strong hold in the day of trouble. A " +
        "stronghold is not a feeling; it is a fortress, a place you run into " +
        "and the door shuts behind you and the thing chasing you cannot follow. " +
        "Anxiety leaves you exposed on the open plain, certain there is nowhere " +
        "safe to go. The prophet names the refuge — not a strategy, not a plan, " +
        "but a Person you can run into. And the last clause is the warmest of " +
        "all: He knoweth them that trust in Him. The One inside the fortress is " +
        "not a stranger reluctantly granting asylum. He knows you. The same " +
        "Father who knows where every scattered sheep wandered knows the ones " +
        "who run to Him in the day of trouble, and He is good to them.",
      invitation:
        "You do not have to weather the storm out in the open, bracing for the " +
        "next blow. There is a stronghold, and the door stands open, and the " +
        "One inside knows your name. Run in. He is good, and He has been " +
        "waiting for you to stop standing exposed and come into the refuge that " +
        "was always yours.",
      closing: "He is a stronghold, and He knows the ones who run to Him.",
    },
    {
      id: "souls-of-the-righteous-in-the-hand",
      title: "In the Hand of Elohim (God)",
      subtitle: "Held so securely that no torment can reach what is His.",
      passageRef: "Wisdom of Solomon 3:1",
      passageText:
        "But the souls of the righteous are in the hand of Elohim (God), and " +
        "there shall no torment touch them.",
      reflection:
        "So much of anxiety is the dread of what could happen to you — the loss, " +
        "the harm, the worst case the imagination keeps circling. This ancient " +
        "word speaks straight to that dread with a single image of staggering " +
        "security: the souls of the righteous are in the hand of Elohim (God). " +
        "Not near His hand, not watched by it from a distance, but in it — " +
        "enclosed, held, the way a child's small hand disappears inside a " +
        "father's. And the hand is the hand of the One who formed the seed and " +
        "swore to gather every grain of it home; nothing slips through His " +
        "fingers. There shall no torment touch them. The worst the world can do " +
        "is real, but it cannot reach past the hand to the soul held inside it. " +
        "Anxiety believes you are exposed and unprotected, that everything you " +
        "fear could simply happen and you would be undone. The Word answers " +
        "that the part of you that matters most is held in a grip the storm " +
        "cannot pry open.",
      invitation:
        "Let your imagination, for once, run the other direction — not toward " +
        "the worst that could happen, but toward the hand you are already held " +
        "in. The Father has closed His grip around your soul, and there is no " +
        "torment that can reach what He is holding. Rest there. You are safer " +
        "than your fear has let you believe.",
      closing: "You are in His hand; no torment can touch what He holds.",
    },
    {
      id: "nothing-shall-separate",
      title: "Nothing Can Separate",
      subtitle: "No fear on the list of things that can pull His love away.",
      passageRef: "Romans 8:38-39",
      passageText:
        "For I am persuaded, that neither death, nor life, nor angels, nor " +
        "principalities, nor powers, nor things present, nor things to come, " +
        "nor height, nor depth, nor any other creature, shall be able to " +
        "separate us from the love of Elohim (God), which is in Messiah " +
        "Yahusha (Christ Jesus) our Lord.",
      reflection:
        "Paul writes a list, and it reads almost like an inventory of " +
        "everything the anxious heart fears. Death is on it. Life — with all " +
        "its uncertainty — is on it. Things present, the trouble you can see " +
        "right now; things to come, the trouble you cannot see yet and so most " +
        "fear. Heights and depths, the powers you cannot control. He names them " +
        "one by one, the whole catalog of dread, and pronounces over every " +
        "single item the same verdict: it cannot separate you from the love of " +
        "Elohim (God). Anxiety lives almost entirely in things to come — the " +
        "not-yet, the unknown future it cannot stop rehearsing. And right " +
        "there, in the middle of Paul's list, the future is named and " +
        "disarmed. Whatever tomorrow holds, it does not hold the power to cut " +
        "you off from the One who set His love on you before the foundation of " +
        "the world. The thing you are most afraid of is already on the list of " +
        "things that cannot win.",
      invitation:
        "Take the very thing your mind keeps circling and find it on Paul's " +
        "list — things present, things to come, height, depth. It is there, and " +
        "it has already been overruled. Nothing you are afraid of can reach the " +
        "love that holds you. Let that settled fact stand between you and the " +
        "dread, and rest in a love that nothing can sever.",
      closing: "Nothing on the list can separate you from His love.",
    },
    {
      id: "he-that-dwelleth-in-the-secret-place",
      title: "The Secret Place",
      subtitle: "A shelter you do not build — you only come and abide in it.",
      passageRef: "Psalm 91:1-2",
      passageText:
        "He that dwelleth in the secret place of El Elyon (the most High) " +
        "shall abide under the shadow of El Shaddai (the Almighty). I will say " +
        "of Yahuah (the LORD), He is my refuge and my fortress: my Elohim " +
        "(God); in him will I trust.",
      reflection:
        "There is a hidden place, the psalm says — a secret place of El Elyon " +
        "(the most High), a shelter under the shadow of El Shaddai (the " +
        "Almighty). It is not a place you construct by your own striving; it " +
        "already exists, and the one thing asked of you is to dwell there, to " +
        "abide, to stay. Anxiety keeps you out on the exposed ground building " +
        "frantic little shelters of your own — the contingency plan, the saved " +
        "reserve, the controlled outcome — and none of them hold against a real " +
        "storm. The psalmist names a refuge that does: not his own fortress, " +
        "but Yahuah (the LORD) Himself. He is my refuge and my fortress. The " +
        "shelter is a Person, and abiding in Him is not a heroic feat; it is " +
        "the simple, repeated turning of the heart back to the One who is " +
        "already covering you with His shadow. The secret place is open. The " +
        "only ones who miss its shelter are those who will not come in and " +
        "stay.",
      invitation:
        "Stop building shelters that cannot hold and come into the one that " +
        "does. The secret place is already there, the shadow of the Almighty " +
        "already cast over the one who abides in Him. You do not have to make " +
        "yourself safe. You only have to dwell where the safety already is — in " +
        "Him, your refuge and your fortress.",
      closing: "Abide in the secret place; His shadow is already over you.",
    },
    {
      id: "he-hath-said-i-will-never-leave-thee",
      title: "He Will Never Leave",
      subtitle: "The promise that empties the future of its power to terrify.",
      passageRef: "Hebrews 13:5-6",
      passageText:
        "Let your conversation be without covetousness; and be content with " +
        "such things as ye have: for he hath said, I will never leave thee, nor " +
        "forsake thee. So that we may boldly say, Yahuah (the Lord) is my " +
        "helper, and I will not fear what man shall do unto me.",
      reflection:
        "The writer roots contentment — the opposite of the grasping, " +
        "fearful, never-enough posture of anxiety — in a single thing the " +
        "Father has said: I will never leave thee, nor forsake thee. So much " +
        "worry is, underneath, the fear of being left alone with the trouble — " +
        "alone with the diagnosis, the bill, the empty house, the unknown. This " +
        "promise reaches all the way down to that root and pulls it out. He " +
        "will never leave. Not in the hardest hour, not in the worst version of " +
        "tomorrow, not in the moment you are most certain you will face it by " +
        "yourself. And see what the writer says that promise makes possible: so " +
        "that we may boldly say. The boldness is not the absence of difficulty; " +
        "it is the certainty of company. Yahuah (the Lord) is my helper — " +
        "present tense, present help — and a heart sure of His presence can " +
        "look at whatever man or circumstance might do and decline to be " +
        "ruled by the fear of it.",
      invitation:
        "Whatever you are most afraid of facing alone — you will not face it " +
        "alone. The Father has said it Himself, and He does not break His word: " +
        "He will never leave you, never forsake you. Let that one promise " +
        "settle into the place where the loneliness lives, and find that you " +
        "can boldly say it too — He is my helper, and I will not fear.",
      closing: "He will never leave you. You will not face it alone.",
    },
    {
      id: "they-that-wait-shall-renew",
      title: "They That Wait",
      subtitle: "The exhausted are not told to push harder, but to wait and be renewed.",
      passageRef: "Isaiah 40:31",
      passageText:
        "But they that wait upon Yahuah (the LORD) shall renew their strength; " +
        "they shall mount up with wings as eagles; they shall run, and not be " +
        "weary; and they shall walk, and not faint.",
      reflection:
        "Anxiety is exhausting in a way few things are — the constant bracing, " +
        "the muscles that never quite unclench, the strength spent on dangers " +
        "that mostly never come. And to a people worn down by a long " +
        "scattering, Isaiah does not say try harder, dig deeper, find it within " +
        "yourself. He says wait upon Yahuah (the LORD). The renewal of strength " +
        "is not something you generate by gritting through; it is something He " +
        "supplies to the one who stops striving long enough to wait on Him. The " +
        "Hebrew picture is of strength exchanged — your spent, depleted " +
        "strength traded for His inexhaustible kind. And the order of the " +
        "promise is gentle: mount up, run, walk. He knows there are seasons for " +
        "soaring and seasons when the most you can do is put one foot in front " +
        "of the other — and He promises strength for that plodding, faint-not " +
        "walk just as surely as for the eagle's flight. The waiting is not " +
        "wasted time. It is where the strength comes from.",
      invitation:
        "You are tired in a way that more effort will only deepen. The Father " +
        "is not asking you to summon strength you do not have; He is inviting " +
        "you to wait on Him and let Him renew it. Stop, even for a moment, and " +
        "wait. The strength you need for the long walk ahead is His to give, " +
        "and He gives it to the ones who wait.",
      closing: "Wait on Him; He renews the strength you have spent.",
    },
    {
      id: "thoughts-of-peace",
      title: "Thoughts of Peace Toward You",
      subtitle: "The future you dread is held by One whose plans for you are good.",
      passageRef: "Jeremiah 29:11",
      passageText:
        "For I know the thoughts that I think toward you, saith Yahuah (the " +
        "LORD), thoughts of peace, and not of evil, to give you an expected " +
        "end.",
      reflection:
        "Yahuah (the LORD) speaks this to a people in exile — already scattered, " +
        "already living in the very disaster they had feared, with seventy more " +
        "years of it ahead. And even there, He tells them what He is thinking " +
        "toward them: thoughts of peace, and not of evil. The whole engine of " +
        "anxiety runs on a hidden assumption — that the future is a hostile " +
        "place, that what is coming is more likely bad than good, that the " +
        "Father's intentions toward you cannot quite be trusted. It is the " +
        "garden's lie in another costume: did He really say He is good? This " +
        "verse names what He is actually thinking, and it is not what the dread " +
        "insists. He thinks peace toward you. He is steering even the exile " +
        "toward an expected end — a future He has in mind and is bringing about, " +
        "the same heart that scattered the seed and never stopped intending to " +
        "gather it home. The future is not an empty hostile dark. It is held by " +
        "One whose thoughts toward you are peace.",
      invitation:
        "The dread keeps telling you the future is against you. Hear instead " +
        "what the Father says He is thinking toward you — peace, and not evil, " +
        "an expected end held in good hands. You do not have to know the whole " +
        "plan to trust the heart behind it. Lay tomorrow down before the One " +
        "whose every thought toward you is good, and let Him carry it.",
      closing: "His thoughts toward you are peace. The future is in good hands.",
    },
  ],
};

const WHEN_YOURE_AFRAID: DevotionalTheme = {
  id: "when-youre-afraid",
  title: "When You're Afraid",
  subtitle: "Thirty days of fear not — spoken by the Father who is with you.",
  description:
    "Fear is the oldest weapon turned against the covenant people, and \"fear " +
    "not\" is the word the Father speaks more than any other across the whole of " +
    "Scripture. He does not say it to people who have nothing to be afraid of. He " +
    "says it to the scattered, the cornered, the outnumbered, the grieving — and " +
    "He always says it with His presence attached. This is not a course in " +
    "positive thinking; it is thirty days of standing inside the same promise the " +
    "prophets and the patriarchs stood inside: I am with thee. The dread the " +
    "world hands you is not the last word. The One who formed you and came in the " +
    "flesh to gather you home is.",
  entries: [
    {
      id: "i-am-thy-shield",
      title: "I Am Thy Shield",
      subtitle: "The first \"fear not\" — spoken to a man with no heir and no army.",
      passageRef: "Genesis 15:1",
      passageText:
        "After these things the word of Yahuah (the LORD) came unto Abram in a " +
        "vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great " +
        "reward.",
      reflection:
        "The very first time \"fear not\" is spoken in the Word, it is spoken to a " +
        "man with everything to fear — old, childless, a stranger in a land of " +
        "kings, with a promise hanging over him that his own body could not keep. " +
        "The lie fear tells is that you are exposed and alone, that the gap between " +
        "what you were promised and what you can see is proof you were forgotten. " +
        "Yahuah (the LORD) does not answer Abram's fear with a strategy. He answers " +
        "it with Himself: I am thy shield. The protection is not a thing He gives " +
        "from a distance; it is His own presence standing between Abram and the " +
        "dark. The promise that would carry through to the twelve tribes and to the " +
        "scattered seed of all of them began here, with a frightened man being " +
        "handed not a plan but a Person.",
      invitation:
        "You do not have to manufacture the courage to stand in the gap between " +
        "the promise and what you can see. The same word that came to Abram comes " +
        "to you: I am thy shield. Stop scanning the horizon for the threat and " +
        "turn to the One already standing in front of you. Let Him be your shield " +
        "before you ask Him for anything else.",
      closing: "He is the shield. He is also the reward.",
    },
    {
      id: "he-will-not-fail-thee",
      title: "He Will Not Fail Thee",
      subtitle: "Courage handed to a people on the edge of the unknown.",
      passageRef: "Deuteronomy 31:6",
      passageText:
        "Be strong and of a good courage, fear not, nor be afraid of them: for " +
        "Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he " +
        "will not fail thee, nor forsake thee.",
      reflection:
        "Mosheh (Moses) speaks this to a whole people standing at the border of a " +
        "land full of giants and walled cities, knowing he will not cross over with " +
        "them. Fear loves a threshold — it whispers that the One who brought you " +
        "this far is about to leave you at the worst possible moment. The Father " +
        "answers the whisper directly: he it is that doth go with thee. The courage " +
        "He commands is not a feeling He demands you generate; it is the natural " +
        "result of knowing who is walking beside you. Notice He does not promise no " +
        "giants, no walls, no trouble. He promises He will not fail you, nor " +
        "forsake you in the middle of them. The going-with is the whole answer to " +
        "the being-afraid.",
      invitation:
        "Whatever border you are standing at — a diagnosis, a door closing, a road " +
        "you cannot see the end of — you are not being sent across it alone. The " +
        "command to be of good courage is really an invitation to lean your weight " +
        "on the One who is already going with you. You do not have to be brave by " +
        "yourself. You were never asked to.",
      closing: "He goes with you. He will not fail you nor forsake you.",
    },
    {
      id: "neither-be-dismayed",
      title: "Neither Be Dismayed",
      subtitle: "The same promise, now spoken over the one who must lead.",
      passageRef: "Deuteronomy 31:8",
      passageText:
        "And Yahuah (the LORD), he it is that doth go before thee; he will be with " +
        "thee, he will not fail thee, neither forsake thee: fear not, neither be " +
        "dismayed.",
      reflection:
        "Two verses earlier the people were told their Elohim (God) goes with them; now " +
        "Yehoshua (Joshua) is told their Elohim (God) goes before them. Fear has two faces. " +
        "One says you are alone where you stand; the other says you do not know " +
        "what is coming and cannot prepare for it. The Father answers both at once. " +
        "He is with you in the place you are, and He has already gone before you " +
        "into the place you dread. Dismay is fear that has given up — the heart " +
        "that has decided the future is too heavy to carry. But the future is not " +
        "yours to carry; it is His, and He is already standing in it waiting for " +
        "you to arrive. The Elohim (God) who goes before you has seen tomorrow. It did not " +
        "frighten Him.",
      invitation:
        "You cannot scout the road ahead, but He already has. The dread of what " +
        "you cannot see was never yours to bear. Hand the unknown to the One who " +
        "has already walked into it. Let \"he goes before thee\" be the thing you " +
        "lay your head on tonight instead of the thing you fear.",
      closing: "He goes before you. The future is already full of Him.",
    },
    {
      id: "be-not-afraid",
      title: "Be Not Afraid",
      subtitle: "A command that is really a promise — wherever you go.",
      passageRef: "Joshua 1:9",
      passageText:
        "Have not I commanded thee? Be strong and of a good courage; be not afraid, " +
        "neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with " +
        "thee whithersoever thou goest.",
      reflection:
        "The pulpit often reads \"be strong and of a good courage\" as a demand — " +
        "as though the Father is standing over you with arms crossed, requiring a " +
        "bravery you do not have. Read it again. The command is bolted to a reason, " +
        "and the reason is everything: for Yahuah Elohayka (the LORD thy God) is " +
        "with thee. He is not commanding Yehoshua (Joshua) to be brave in a vacuum. " +
        "He is telling a frightened man the truth about his situation — you are not " +
        "alone, therefore you can stand. The courage is not the root; the presence " +
        "is the root, and courage grows from it. And the presence is not rationed " +
        "to safe places. It is whithersoever thou goest — into the river, into the " +
        "battle, into the parts of the journey no one warned you about.",
      invitation:
        "Stop hearing \"be strong\" as a weight laid on you and start hearing it " +
        "as a fact spoken over you. He is with you wherever you go — not because " +
        "you earned it, not where you've been good enough, but everywhere, all the " +
        "way through. Let the reason carry the command. Come home to the presence " +
        "that makes courage possible.",
      closing: "Be not afraid. He is with you wherever you go.",
    },
    {
      id: "stand-still-and-see",
      title: "Stand Still and See",
      subtitle: "Sea ahead, army behind — and the word is fear ye not.",
      passageRef: "Exodus 14:13",
      passageText:
        "And Mosheh (Moses) said unto the people, Fear ye not, stand still, and see " +
        "the salvation of Yahuah (the LORD), which he will shew to you to day: for " +
        "the Egyptians whom ye have seen to day, ye shall see them again no more for " +
        "ever.",
      reflection:
        "There is no worse position than the one Yashar'el (Israel) stood in here " +
        "— the sea in front, Pharaoh's chariots closing behind, no road and no " +
        "weapon. Fear had every reason on its side. And into that exact corner " +
        "comes the word: fear ye not, stand still. The deliverance was never going " +
        "to come from their strength; their job was to stop running long enough to " +
        "watch their Elohim (God) fight. We are still a redeemed people walking out of the " +
        "house of bondage, and the enemy still rides hard at our backs. But the " +
        "Father did not bring you this far to abandon you at the water. The same " +
        "hand that marked the door with blood is the hand that opens the sea.",
      invitation:
        "When you are pinned — no way forward and the past thundering up behind " +
        "you — the first thing fear demands is frantic motion. The Father asks " +
        "something harder and kinder: stand still. Stop thrashing. Let Him be the " +
        "one who fights. The salvation you cannot manufacture is the salvation He " +
        "delights to show.",
      closing: "Stand still. The salvation is His to show, not yours to win.",
    },
    {
      id: "their-defence-is-departed",
      title: "Their Defence Is Departed",
      subtitle: "Two men who saw the same giants — and refused the fear.",
      passageRef: "Numbers 14:9",
      passageText:
        "Only rebel not ye against Yahuah (the LORD), neither fear ye the people of " +
        "the land; for they are bread for us: their defence is departed from them, " +
        "and Yahuah (the LORD) is with us: fear them not.",
      reflection:
        "Twelve men saw the same land. Ten came back with a report soaked in " +
        "dread; two came back saying fear them not. The difference was not the size " +
        "of the giants — everyone agreed the giants were real. The difference was " +
        "what Kalev (Caleb) and Yehoshua (Joshua) put in the scales beside the " +
        "giants: and Yahuah (the LORD) is with us. Fear does its worst when it " +
        "leaves the Father out of the count, weighing the threat against your own " +
        "small strength and reaching the obvious conclusion. But the obvious " +
        "conclusion is a lie of omission. The shadow over the land had already lost " +
        "its covering; the giants were bread, not gods. The faithful do not deny " +
        "the giants. They simply refuse to count them without counting Him.",
      invitation:
        "Look honestly at what frightens you — name the giant, do not pretend it " +
        "is small. Then put the one thing fear always leaves out back into the " +
        "scale: Yahuah (the LORD) is with you. The threat is real; it is also " +
        "already outmatched. Let the presence of the Father change what the " +
        "numbers mean.",
      closing: "Their defence is departed. The Father is with you.",
    },
    {
      id: "through-the-valley",
      title: "Through the Valley",
      subtitle: "Even in the shadow of death — I will fear no evil.",
      passageRef: "Psalm 23:4",
      passageText:
        "Yea, though I walk through the valley of the shadow of death, I will fear " +
        "no evil: for thou art with me; thy rod and thy staff they comfort me.",
      reflection:
        "Notice the small word that holds the whole verse together: through. David " +
        "does not say the shepherd keeps him out of the dark valley. He says he " +
        "walks through it — and comes out the other side, because the One leading " +
        "him does not abandon the flock at the entrance to the shadow. Fear insists " +
        "the valley is the end of the story, that the dark place is where the love " +
        "of the Father runs out. The shepherd says otherwise. The rod that fights " +
        "off the predator and the staff that pulls the sheep back from the edge are " +
        "not absent in the valley; they are most present there. Yahuah Ra'ah (the " +
        "LORD is my shepherd) does not hand you off to the dark. He walks you " +
        "through it.",
      invitation:
        "You may be in the valley right now — grief, illness, a fear that wakes " +
        "you in the dark. Hear what the shepherd is not saying: He is not saying " +
        "you should not be here. He is saying you are not here alone, and you are " +
        "not staying. Lean into the rod and the staff. The way out leads through, " +
        "and He is walking it with you.",
      closing: "Through the valley — for thou art with me.",
    },
    {
      id: "whom-shall-i-fear",
      title: "Whom Shall I Fear",
      subtitle: "When He is your light, the dark loses its grip.",
      passageRef: "Psalm 27:1",
      passageText:
        "Yahuah (the LORD) is my light and my salvation; whom shall I fear? Yahuah " +
        "(the LORD) is the strength of my life; of whom shall I be afraid?",
      reflection:
        "Fear is finally a question of authority — who do you believe holds the " +
        "real power over your life. David answers the question with two more " +
        "questions that have no answer: whom shall I fear? of whom shall I be " +
        "afraid? Once Yahuah (the LORD) is your light, the dark has nothing left to " +
        "hide. Once He is the strength of your life, no other strength can " +
        "ultimately threaten it. The systems of this age trade in fear because " +
        "fear keeps people manageable and small. But a man who has named the Most " +
        "High as his light cannot be governed by the dark anymore. The fear does " +
        "not disappear because David is fearless by nature; it disappears because " +
        "the question of who is in charge has been settled.",
      invitation:
        "Settle the question fear keeps reopening: who actually holds your life? " +
        "Not the diagnosis, not the threat, not the power that looms so large " +
        "tonight. Yahuah (the LORD) is your light and your salvation. Let that one " +
        "fact answer the dread the way light answers a dark room — not by arguing " +
        "with it, but by filling the space it lived in.",
      closing: "He is your light. Of whom shall you be afraid?",
    },
    {
      id: "delivered-from-all-my-fears",
      title: "Delivered From All My Fears",
      subtitle: "He sought Yahuah (the LORD), and the fears let go.",
      passageRef: "Psalm 34:4",
      passageText:
        "I sought Yahuah (the LORD), and he heard me, and delivered me from all my " +
        "fears.",
      reflection:
        "David does not say he was delivered from all the things he was afraid of. " +
        "He says he was delivered from the fears themselves. There is a difference. " +
        "Sometimes the Father removes the danger; often He leaves you in the storm " +
        "and removes the dread from your chest instead, which is the deeper rescue. " +
        "And the verse names the door: I sought Yahuah (the LORD), and he heard me. " +
        "Fear isolates — it convinces you that you are shouting into an empty sky, " +
        "that no one is listening, that you must carry the weight alone because " +
        "there is no one to carry it to. The lie is that He cannot hear you. The " +
        "truth is that the seeking is met every time. He heard me is the hinge the " +
        "whole deliverance swings on.",
      invitation:
        "You do not have to wait until the fear is well-formed or articulate to " +
        "bring it. Seek Him with it raw and unfinished. The promise is not that " +
        "every danger vanishes; it is that He hears, and that being heard by the " +
        "One who formed you begins to loosen fear's grip from the inside. Come and " +
        "be heard.",
      closing: "Seek Him. He hears, and the fears let go.",
    },
    {
      id: "a-very-present-help",
      title: "A Very Present Help",
      subtitle: "Though the earth itself gives way, we will not fear.",
      passageRef: "Psalm 46:1-2",
      passageText:
        "Elohim (God) is our refuge and strength, a very present help in trouble. " +
        "Therefore will not we fear, though the earth be removed, and though the " +
        "mountains be carried into the midst of the sea.",
      reflection:
        "The psalmist reaches for the most total collapse he can picture — the " +
        "earth itself removed, the mountains sliding into the sea — and says even " +
        "then, we will not fear. That is not bravado. It is the conclusion drawn " +
        "from the first line: Elohim (God) is a very present help in trouble. Not " +
        "a distant help you summon and wait on. A very present one — already here, " +
        "already in the trouble with you before you called. Fear builds its case on " +
        "the assumption that everything solid can fail you, and the assumption is " +
        "half true: the earth can be removed, the mountains can fall. What fear " +
        "leaves out is that the refuge is not made of earth or mountain. The refuge " +
        "is the Father Himself, and He does not move when the ground does.",
      invitation:
        "Let the things that can shake, shake. Your security was never in the " +
        "ground beneath you — it was in the One who made the ground and stands " +
        "unmoved when it gives way. Run to the refuge that cannot be carried into " +
        "the sea. He is not a help you have to go find; He is already present in " +
        "the trouble, waiting for you to notice.",
      closing: "A very present help — therefore we will not fear.",
    },
    {
      id: "what-time-i-am-afraid",
      title: "What Time I Am Afraid",
      subtitle: "Fear is not the sin — it is the turn the fear becomes.",
      passageRef: "Psalm 56:3",
      passageText:
        "What time I am afraid, I will trust in thee.",
      reflection:
        "David does not pretend he is above being afraid. What time I am afraid — " +
        "he assumes it will happen, that there will be moments the fear arrives " +
        "uninvited and real. The pulpit sometimes shames the frightened, as though " +
        "fear itself were the failure, leaving the trembling believer doubly " +
        "burdened — afraid, and ashamed of being afraid. David shows a better way. " +
        "Fear is not the sin; it is the fork in the road. The question is what you " +
        "do in the moment it comes. I will trust in thee is not the absence of " +
        "fear; it is the turn the heart makes inside the fear, toward the One who " +
        "is faithful. He is not waiting for you to stop being afraid before you " +
        "come. He is the place you come while you still are.",
      invitation:
        "You do not have to clean the fear off before you bring yourself to the " +
        "Father. The honest word is what time I am afraid — and the turn is, I " +
        "will trust in thee. Make the turn even with your heart still pounding. " +
        "Trust is not a feeling you wait for; it is a direction you lean, right in " +
        "the middle of the fear.",
      closing: "When you are afraid — trust in Him. That is the whole of it.",
    },
    {
      id: "thou-shalt-not-be-afraid",
      title: "The Terror by Night",
      subtitle: "Under His wings, the night loses its terror.",
      passageRef: "Psalm 91:5",
      passageText:
        "Thou shalt not be afraid for the terror by night; nor for the arrow that " +
        "flieth by day.",
      reflection:
        "Fear keeps different hours than the rest of life. There is a terror that " +
        "belongs to the night — the dread that comes when the house is quiet and " +
        "there is nothing left to distract you, when the thing you have been " +
        "outrunning all day finally catches up in the dark. And there is the arrow " +
        "by day — the sudden trouble that strikes in the open, when you thought you " +
        "were safe. The psalm names both because the Father knows fear works both " +
        "shifts. And the whole psalm rests on one image: he that dwelleth in the " +
        "secret place of the most High abides under the shadow of El Shaddai (the " +
        "Almighty). The night does not lose its terror because the dark gets " +
        "smaller. It loses its terror because you are under His wings while it " +
        "passes.",
      invitation:
        "When the terror comes at three in the morning and there is nothing left " +
        "to busy your hands with, you are not as exposed as the dark wants you to " +
        "feel. There is a secret place, and it is simply His presence, available " +
        "in the night as fully as the day. Crawl under the shadow of His wings and " +
        "let the night pass over a sheltered heart.",
      closing: "Under His wings, the night holds no terror.",
    },
    {
      id: "heart-fixed",
      title: "His Heart Is Fixed",
      subtitle: "No dread of evil tidings — the heart anchored before the news.",
      passageRef: "Psalm 112:7",
      passageText:
        "He shall not be afraid of evil tidings: his heart is fixed, trusting in " +
        "Yahuah (the LORD).",
      reflection:
        "So much of fear is the dread of the phone call that has not come, the " +
        "news that might arrive, the evil tidings the mind rehearses in advance. " +
        "Fear lives in the future it invents and then drags back into the present. " +
        "The psalm describes a different kind of heart — one that shall not be " +
        "afraid of evil tidings, not because the tidings will all be good, but " +
        "because the heart is already fixed before any tidings come. A heart fixed " +
        "and trusting in Yahuah (the LORD) is not bracing against the next blow; it " +
        "is resting on a foundation that the next blow cannot move. The anchor is " +
        "set ahead of time. When the news comes — and some of it will be hard — it " +
        "lands on a heart that already knows where it stands.",
      invitation:
        "You cannot control what tidings come. You can let your heart be fixed " +
        "before they do — anchored not in the hope that the news is good, but in " +
        "the One who holds you whether it is or not. Stop rehearsing the call you " +
        "dread. Fix your heart on Him today, so that whatever tomorrow brings " +
        "lands on solid ground.",
      closing: "A heart fixed on Him does not dread the news.",
    },
    {
      id: "the-lord-is-on-my-side",
      title: "The LORD Is on My Side",
      subtitle: "If He is for you, what can a mere man do?",
      passageRef: "Psalm 118:6",
      passageText:
        "Yahuah (the LORD) is on my side; I will not fear: what can man do unto " +
        "me?",
      reflection:
        "Fear of other people may be the most common fear of all — the fear of " +
        "what they will say, what they will do, what they can take from you. The " +
        "systems of this age run on exactly this fear; it is how they keep people " +
        "in line. But the psalmist asks a question that deflates it: what can man " +
        "do unto me? Not because men can do nothing — they crucified the Messiah " +
        "(Christ) — but because the worst they can do has a ceiling, and the One " +
        "on your side has none. Yahuah (the LORD) is on my side reframes every " +
        "human threat. The opinions you dread, the powers that loom, the people " +
        "who could hurt you — none of them outrank the Most High, and He has " +
        "declared which side He is on.",
      invitation:
        "Whose face are you afraid of? Whose verdict have you let sit on the " +
        "throne that belongs to the Father? Put the One who is on your side back " +
        "on that throne. The fear of man bows the moment you remember who already " +
        "stands with you. Let it bow.",
      closing: "He is on your side. What can man do unto you?",
    },
    {
      id: "fear-thou-not",
      title: "Fear Thou Not",
      subtitle: "Three reasons not to fear, all in one breath.",
      passageRef: "Isaiah 41:10",
      passageText:
        "Fear thou not; for I am with thee: be not dismayed; for I am Yahuah " +
        "Elohayka (thy God): I will strengthen thee; yea, I will help thee; yea, I " +
        "will uphold thee with the right hand of my righteousness.",
      reflection:
        "This is the verse a frightened people have clung to for thousands of " +
        "years, and the reason is its structure. Every command not to fear is " +
        "answered immediately with a reason, and every reason is the Father " +
        "Himself doing something. Fear thou not — for I am with thee. Be not " +
        "dismayed — for I am thy Elohim (God). He does not tell the scattered, the exiled, " +
        "the afraid to summon strength from within. He says I will strengthen thee, " +
        "I will help thee, I will uphold thee. The hand that holds you up is the " +
        "right hand of His righteousness — not your grip on Him, which is weak and " +
        "slips, but His grip on you, which does not. The whole weight of staying " +
        "upright was never resting on your strength. It was resting on His hand.",
      invitation:
        "Read the verse slowly and let each reason land. You are not asked to be " +
        "strong; He says I will strengthen thee. You are not asked to hold on " +
        "tight enough; He says I will uphold thee with my right hand. Loosen your " +
        "white-knuckled grip and let yourself be held. The strength you have been " +
        "trying to find is being offered to you.",
      closing: "Fear thou not — for I am with thee.",
    },
    {
      id: "i-will-help-thee",
      title: "I Will Help Thee",
      subtitle: "The Father takes your hand and says the same word again.",
      passageRef: "Isaiah 41:13",
      passageText:
        "For I Yahuah Elohayka (the LORD thy God) will hold thy right hand, saying " +
        "unto thee, Fear not; I will help thee.",
      reflection:
        "There is a tenderness here that fear cannot survive in the presence of. " +
        "The Most High, who formed the heavens and measures the seas in the hollow " +
        "of His hand, stoops to take hold of one trembling person by the right " +
        "hand — the way a parent takes the hand of a child crossing a busy street. " +
        "And while He holds it, He speaks: fear not; I will help thee. The image " +
        "is not of a distant deity issuing commands from a throne. It is of a " +
        "Father near enough to take your hand and close enough to be heard. The " +
        "help is not a thing He sends; it is Himself, hand in hand with you. This " +
        "is the Elohim (God) of the Old Testament who appeared and spoke and led — the " +
        "Formed One, who would come in the flesh to take the hand of His people " +
        "for good.",
      invitation:
        "Let yourself be small enough to have your hand held. You do not have to " +
        "be the strong one, the steady one, the one who has it together. The " +
        "Father is reaching for your right hand right now, saying the oldest and " +
        "kindest word He knows: fear not; I will help thee. Put your hand in His.",
      closing: "He holds your hand and says, fear not; I will help thee.",
    },
    {
      id: "through-the-waters",
      title: "Through the Waters",
      subtitle: "Called by name — and not abandoned to the flood or the fire.",
      passageRef: "Isaiah 43:1-2",
      passageText:
        "But now thus saith Yahuah (the LORD) that created thee, O Ya'aqov " +
        "(Jacob), and he that formed thee, O Yashar'el (Israel), Fear not: for I " +
        "have redeemed thee, I have called thee by thy name; thou art mine. When " +
        "thou passest through the waters, I will be with thee; and through the " +
        "rivers, they shall not overflow thee: when thou walkest through the fire, " +
        "thou shalt not be burned; neither shall the flame kindle upon thee.",
      reflection:
        "This is spoken to a specific people — Ya'aqov (Jacob), Yashar'el " +
        "(Israel) — the covenant seed scattered through the nations and afraid " +
        "they had been forgotten in the scattering. The Father's answer to their " +
        "fear is identity: I have redeemed thee, I have called thee by thy name; " +
        "thou art mine. Fear thrives on the dread that you are anonymous, " +
        "expendable, lost in the crowd of the world. He says He knows your name. " +
        "And He does not promise there will be no waters and no fire — He promises " +
        "the waters will not overflow and the fire will not burn, because He will " +
        "be in them with you. The same word that gathers the lost sheep of all the " +
        "tribes is the word that steadies the one soul afraid of drowning: thou " +
        "art mine.",
      invitation:
        "If you have felt nameless and forgotten — one more anxious face in a " +
        "world that does not see you — hear the One who created you and formed " +
        "you. He calls you by name. You are His. The waters may rise and the fire " +
        "may come, but you will not go through them alone, and you will not be " +
        "consumed. Come home to the One who knows your name.",
      closing: "Thou art mine — through the waters, through the fire.",
    },
    {
      id: "be-strong-fear-not",
      title: "Say to the Fearful Heart",
      subtitle: "A word spoken straight to the trembling: He will come and save.",
      passageRef: "Isaiah 35:4",
      passageText:
        "Say to them that are of a fearful heart, Be strong, fear not: behold, your " +
        "Elohim (God) will come with vengeance, even Elohim (God) with a " +
        "recompence; he will come and save you.",
      reflection:
        "The Father does not speak this to the strong. He aims it directly at " +
        "them that are of a fearful heart — the timid, the worn down, the ones " +
        "whose hands hang weak and whose knees are feeble in the verses just " +
        "before. He is not embarrassed by the fearful; He sends a word specifically " +
        "for them. And the word is not be strong on your own. It is behold, your " +
        "Elohim (God)... he will come and save you. The strength He commands rests " +
        "entirely on the coming He promises. The vengeance and the recompence are " +
        "His to carry out against everything that has held His people in dread; " +
        "your part is simply to behold — to lift your eyes off the fear and onto " +
        "the One who is coming. He will come. He will save. That is the ground the " +
        "fearful heart can stand on.",
      invitation:
        "If your heart is fearful tonight, this word was written with you in mind " +
        "— not the heroes, not the unshakeable, but the fearful. You do not have " +
        "to be strong before He comes. He comes to the weak knees and the feeble " +
        "hands and saves them. Lift your eyes. Behold your Elohim (God), and let the coming " +
        "be your strength.",
      closing: "He will come and save you. Say it to your fearful heart.",
    },
    {
      id: "who-art-thou",
      title: "Who Art Thou, That Thou Shouldest Fear",
      subtitle: "The Comforter asks why you fear a man who dies like grass.",
      passageRef: "Isaiah 51:12",
      passageText:
        "I, even I, am he that comforteth you: who art thou, that thou shouldest be " +
        "afraid of a man that shall die, and of the son of Adam which shall be made " +
        "as grass.",
      reflection:
        "The Father asks a startling question of the fearful: who art thou, that " +
        "thou shouldest be afraid? He is not mocking the frightened; He is gently " +
        "exposing the size mismatch fear depends on. We fear a man that shall die, " +
        "a son of Adam which shall be made as grass — mortal, temporary, here for a " +
        "season and gone. Fear inflates the threat to fill the whole sky and " +
        "shrinks the comforter down to nothing. The Father reverses both. I, even " +
        "I, am he that comforteth you — the Most High, eternal, formless source of " +
        "all things, leans down to comfort one trembling soul. When the comforter " +
        "is that large and the threat is grass, the fear cannot keep its " +
        "proportions. It was a man you were afraid of. It is the Maker of heaven " +
        "who comforts you.",
      invitation:
        "Let the One who comforts you be the right size in your eyes, and let the " +
        "thing you fear be its true size. The power that looms so large is grass — " +
        "real, but mortal and passing. The Comforter is El Olam (the everlasting God). Stop " +
        "trembling at grass and turn to the One who says, I, even I, am he that " +
        "comforteth you.",
      closing: "He comforts you. The thing you fear is grass.",
    },
    {
      id: "be-not-afraid-of-their-faces",
      title: "Be Not Afraid of Their Faces",
      subtitle: "A reluctant prophet, sent — and promised the Father's presence.",
      passageRef: "Jeremiah 1:8",
      passageText:
        "Be not afraid of their faces: for I am with thee to deliver thee, saith " +
        "Yahuah (the LORD).",
      reflection:
        "Yirmeyahu (Jeremiah) was young and unwilling, sent to carry a hard word " +
        "to people who would hate him for it. His fear was specific and reasonable: " +
        "their faces — the hostility, the rejection, the scorn he would have to " +
        "stand in front of. The Father does not dismiss the faces or pretend they " +
        "will be friendly. He answers the fear with His presence: for I am with " +
        "thee to deliver thee. The fear of faces is the fear of man wearing its " +
        "everyday clothes — the dread of disapproval that keeps so many from ever " +
        "speaking the truth they have been given. The Father's cure is not a " +
        "thicker skin. It is His own company. When the One who is with you " +
        "outweighs every face arrayed against you, the faces lose their power to " +
        "silence you.",
      invitation:
        "Whose face has been keeping you quiet, keeping you small, keeping you " +
        "from coming all the way home? The Father sees the faces too, and He says " +
        "the same thing He said to a frightened young prophet: I am with thee to " +
        "deliver thee. You do not have to be unafraid of them. You only have to " +
        "remember who is standing with you.",
      closing: "Be not afraid of their faces. He is with you to deliver you.",
    },
    {
      id: "from-the-first-day",
      title: "From the First Day",
      subtitle: "Heard from the moment you turned your heart to understand.",
      passageRef: "Daniel 10:12",
      passageText:
        "Then said he unto me, Fear not, Daniyel (Daniel): for from the first day " +
        "that thou didst set thine heart to understand, and to chasten thyself " +
        "before thy Elohim (God), thy words were heard, and I am come for thy " +
        "words.",
      reflection:
        "Daniyel (Daniel) had been praying and waiting for three weeks, and the " +
        "silence had begun to feel like absence — the particular fear that your " +
        "prayers are falling into a void, that the delay means you were not heard. " +
        "The messenger's first word is fear not, and then he dismantles the lie " +
        "behind the fear: from the first day... thy words were heard. Not the " +
        "twenty-first day, when the answer finally arrived. The first. The hearing " +
        "happened immediately; the journey to deliver the answer took time, and the " +
        "delay was never silence. Fear reads delay as rejection. The Father's word " +
        "reads delay as a messenger already on the way. Your prayer was heard the " +
        "moment you turned your heart to seek Him.",
      invitation:
        "If you have been waiting in a silence that has started to feel like " +
        "being ignored, hear this: you were heard from the first day. The answer " +
        "may still be on the road, but the hearing was never in question. Do not " +
        "let the delay convince you of an absence. Keep your heart set to " +
        "understand. The One who heard you on day one has not gone quiet.",
      closing: "From the first day, your words were heard.",
    },
    {
      id: "o-man-greatly-beloved",
      title: "O Man Greatly Beloved",
      subtitle: "Strength comes after the word of peace, not before it.",
      passageRef: "Daniel 10:19",
      passageText:
        "And said, O man greatly beloved, fear not: peace be unto thee, be strong, " +
        "yea, be strong. And when he had spoken unto me, I was strengthened, and " +
        "said, My lord, speak; let my lord speak; for thou hast strengthened me.",
      reflection:
        "Watch the order, because it is everything. The messenger says fear not, " +
        "peace be unto thee, be strong — and then the verse records the result: " +
        "when he had spoken unto me, I was strengthened. Daniyel (Daniel) did not " +
        "manufacture strength and then receive the word. The word came first, and " +
        "the strength followed from it. This is the opposite of how fear says it " +
        "works. Fear says, get strong, then you will be worthy of the comfort. The " +
        "Father says, here is the comfort — O man greatly beloved — and the " +
        "strength comes out of being told you are loved. The strength is not the " +
        "price of admission. It is the gift the word produces in a heart that " +
        "hears how dearly it is held.",
      invitation:
        "You do not have to find your strength before you come to the Father. " +
        "Come weak, come trembling, come greatly beloved, and let His word do what " +
        "your striving never could. Hear it spoken over you: O man greatly beloved, " +
        "fear not. The strength to stand will come from the hearing, not from your " +
        "effort to gather it first.",
      closing: "O man greatly beloved, fear not — and be strengthened.",
    },
    {
      id: "let-not-thine-hands-be-slack",
      title: "He Will Rest in His Love",
      subtitle: "The Father in your midst, singing over you with joy.",
      passageRef: "Zephaniah 3:16-17",
      passageText:
        "In that day it shall be said to Yerushalayim (Jerusalem), Fear thou not: " +
        "and to Tsion (Zion), Let not thine hands be slack. Yahuah Elohayka (the " +
        "LORD thy God) in the midst of thee is mighty; he will save, he will " +
        "rejoice over thee with joy; he will rest in his love, he will joy over " +
        "thee with singing.",
      reflection:
        "Here is a picture of the Father that fear cannot easily hold beside its " +
        "own. The pulpit has too often painted Him as the distant judge, arms " +
        "crossed, waiting for you to fail — and fear feeds on that portrait, " +
        "because a God like that is one more face to dread. But the prophet shows " +
        "Yahuah Elohayka (the LORD thy God) in the midst of thee, not at a " +
        "distance; mighty to save, and then — astonishingly — rejoicing over you, " +
        "resting in His love, joying over you with singing. The Elohim (God) who is in your " +
        "midst is not tolerating you. He is singing over you. Fear cannot survive " +
        "long in the presence of a Father who delights in His own. The fear not is " +
        "grounded in a love that is not merely willing to keep you but glad to " +
        "have you.",
      invitation:
        "Let the portrait of the Father be corrected. He is not the cold judge " +
        "fear painted for you. He is in your midst, mighty to save, and He sings " +
        "over you. Sit still long enough to hear it. The same love that gathers " +
        "the scattered home is the love that rests over you and rejoices. Fear " +
        "thou not — you are sung over.",
      closing: "He rests in His love and joys over you with singing.",
    },
    {
      id: "my-spirit-remaineth",
      title: "My Spirit Remaineth Among You",
      subtitle: "The same promise from the exodus, spoken again: fear ye not.",
      passageRef: "Haggai 2:5",
      passageText:
        "According to the word that I covenanted with you when ye came out of " +
        "Egypt, so my spirit remaineth among you: fear ye not.",
      reflection:
        "A discouraged remnant was rebuilding a temple that looked like nothing " +
        "next to the glory of what had been lost, and fear told them the best days " +
        "were behind them and the Father's presence had thinned out with the " +
        "years. He answers by pointing them back to the exodus: the covenant He " +
        "made when they came out of Egypt still stands, and so my spirit remaineth " +
        "among you. The same Ruach (Spirit) who went before them in the wilderness " +
        "had not departed. Fear loves to tell a scattered, diminished people that " +
        "the presence has moved on, that they have missed it, that what is left is " +
        "a hollow shell. The Father says His Spirit remains. The covenant did not " +
        "expire. The presence that delivered the fathers is the presence with the " +
        "children. Fear ye not.",
      invitation:
        "If you have feared that the presence has passed you by — that the glory " +
        "belonged to another generation and you arrived too late — hear the " +
        "Father: my spirit remaineth among you. The covenant He made still holds. " +
        "He has not moved on. Stop grieving a presence that never left. Fear ye " +
        "not, and build.",
      closing: "His Spirit remains among you. Fear ye not.",
    },
    {
      id: "fear-him-which-is-able",
      title: "Fear Not Them That Kill the Body",
      subtitle: "The Father knows the sparrows — and you are worth more.",
      passageRef: "Matthew 10:28-31",
      passageText:
        "And fear not them which kill the body, but are not able to kill the soul: " +
        "but rather fear him which is able to destroy both soul and body in hell. " +
        "Are not two sparrows sold for a farthing? and one of them shall not fall " +
        "on the ground without your Father. But the very hairs of your head are all " +
        "numbered. Fear ye not therefore, ye are of more value than many sparrows.",
      reflection:
        "Yahusha (Jesus) does not tell His own that nothing can harm them; He " +
        "tells them that the worst men can do reaches only the body, and there is " +
        "a part of them men cannot touch. That alone would dethrone a thousand " +
        "fears. But He does not stop at the limit of the threat — He turns to the " +
        "care of the Father, and He gets small to do it. Two sparrows, sold for a " +
        "farthing, the cheapest thing in the market, and not one of them falls " +
        "without your Father knowing. The hairs of your head are numbered. The Elohim (God) " +
        "who attends to a falling sparrow is not distracted from you. Fear says " +
        "you are too small to be noticed; the Messiah (Christ) says you are noticed " +
        "down to the count of your hair. Fear ye not therefore.",
      invitation:
        "Let the size of the Father's attention answer the size of your fear. He " +
        "marks the fall of a sparrow worth half a penny; He has numbered the hairs " +
        "you lose without thinking. You are not beneath His notice and never have " +
        "been. The One who watches the sparrows is watching you with far greater " +
        "care. Fear ye not.",
      closing: "Not one sparrow falls without your Father. Fear ye not.",
    },
    {
      id: "be-of-good-cheer",
      title: "It Is I; Be Not Afraid",
      subtitle: "The figure in the storm is not a ghost — it is the Lord.",
      passageRef: "Matthew 14:27",
      passageText:
        "But straightway Yahusha (Jesus) spake unto them, saying, Be of good cheer; " +
        "it is I; be not afraid.",
      reflection:
        "The disciples were in the dark, in the wind, fighting waves in the fourth " +
        "watch of the night, and the figure coming toward them across the water " +
        "frightened them more than the storm did — they thought it was a ghost. " +
        "Sometimes the very approach of the Lord, in a form we did not expect, " +
        "lands first as terror. Then comes the voice: be of good cheer; it is I; be " +
        "not afraid. The thing they feared in the storm was Him all along, coming " +
        "to them through the part of the night they thought they would not survive. " +
        "Fear so often mistakes His coming for one more threat. He speaks to clear " +
        "the confusion: it is I. The One walking toward you across the worst of it " +
        "is not against you. He is the help you have been crying out for, arriving " +
        "in the dark.",
      invitation:
        "When something comes toward you in the storm and your first instinct is " +
        "terror, listen for the voice before you decide what it is. It may be the " +
        "Lord Himself, coming across the very water you were sure would drown you. " +
        "Be of good cheer; it is I; be not afraid. Let Him into the boat.",
      closing: "It is I; be not afraid. He comes across the storm.",
    },
    {
      id: "fear-not-little-flock",
      title: "Fear Not, Little Flock",
      subtitle: "It is the Father's good pleasure to give you the kingdom.",
      passageRef: "Luke 12:32",
      passageText:
        "Fear not, little flock; for it is your Father's good pleasure to give you " +
        "the kingdom.",
      reflection:
        "He calls them little flock — small, vulnerable, easily scattered, exactly " +
        "the sort of thing that has every reason to be afraid. Sheep do not " +
        "survive on their own strength; they survive because of the shepherd. And " +
        "the reason He gives them not to fear is not that they will become strong " +
        "or numerous. It is the Father's good pleasure to give you the kingdom. The " +
        "kingdom is not a wage the little flock earns by becoming impressive. It is " +
        "a gift the Father delights to give — good pleasure, not grudging duty. " +
        "Fear tells the small and the few that they are too insignificant to " +
        "inherit anything, that the kingdom belongs to the strong. The Shepherd " +
        "says the opposite: the smallness is not a disqualification, and the giving " +
        "is the Father's joy.",
      invitation:
        "If you feel like one of the little flock — small, scattered, not nearly " +
        "enough on your own — that is exactly who this word is for. You are not " +
        "asked to grow large enough to deserve the kingdom. It is the Father's " +
        "good pleasure to give it. Stop fearing your own smallness and let " +
        "yourself be a sheep with a Shepherd who delights to provide.",
      closing: "Fear not, little flock. The kingdom is His pleasure to give.",
    },
    {
      id: "let-not-your-heart-be-troubled",
      title: "Peace I Leave With You",
      subtitle: "Not the world's peace — and not the world's kind of fear.",
      passageRef: "John 14:27",
      passageText:
        "Peace I leave with you, my peace I give unto you: not as the world giveth, " +
        "give I unto you. Let not your heart be troubled, neither let it be " +
        "afraid.",
      reflection:
        "The world's peace is a truce that lasts as long as the circumstances " +
        "cooperate — peace by the absence of trouble, which means no peace at all " +
        "the moment trouble returns. Yahusha (Jesus) gives a different kind: my " +
        "peace, not as the world giveth. It does not depend on the storm stopping. " +
        "He spoke this on the night before the cross, into a room full of men " +
        "about to watch their whole world come apart, and He left them peace in the " +
        "middle of it, not after it. Let not your heart be troubled, neither let it " +
        "be afraid is not a command to feel nothing. It is the offer of a peace " +
        "that can hold a troubled heart steady from the inside while the outside " +
        "shakes. His peace is a Person's presence, not a circumstance's " +
        "cooperation, and that is why it can be left with you even here.",
      invitation:
        "Stop waiting for the circumstances to settle before you let your heart be " +
        "at peace. The peace Yahusha (Jesus) gives is not the world's kind — it " +
        "does not require the trouble to leave first. Receive His peace in the " +
        "middle of the unresolved thing. Let not your heart be troubled; the One " +
        "who gives it is with you in the room.",
      closing: "My peace I give you — not as the world gives.",
    },
    {
      id: "not-the-spirit-of-fear",
      title: "Not the Spirit of Fear",
      subtitle: "What He gave you is power, and love, and a sound mind.",
      passageRef: "2 Timothy 1:7",
      passageText:
        "For Elohim (God) hath not given us the spirit of fear; but of power, and " +
        "of love, and of a sound mind.",
      reflection:
        "Paul writes this to Timotheos (Timothy), a young man prone to timidity, " +
        "facing real danger and his own faltering nerve. And he names something " +
        "important: the spirit of fear is not from the Father. It does not " +
        "originate with Him; He did not hand it to you. What He gave is power, and " +
        "love, and a sound mind — the opposite of the paralysis, the isolation, " +
        "and the racing, spiraling thoughts that fear produces. This matters, " +
        "because fear loves to disguise itself as humility or realism or even " +
        "reverence, and so it gets smuggled in as though it came from Elohim (God). It did " +
        "not. The Father's gift steadies the mind, opens the heart in love instead " +
        "of clenching it shut, and supplies a power that is His, not yours. The " +
        "spirit of fear is a counterfeit. You can hand it back.",
      invitation:
        "Name the spirit of fear for what it is — not a gift from the Father, not " +
        "a virtue, not your true self. He gave you something else: power, love, " +
        "and a sound mind. You do not have to accept the trembling as though it " +
        "came from Him. Receive what He actually gave, and let the counterfeit go.",
      closing: "Not fear — but power, and love, and a sound mind.",
    },
    {
      id: "perfect-love-casteth-out-fear",
      title: "Perfect Love Casts Out Fear",
      subtitle: "Fear has torment — but love is stronger, and it is His.",
      passageRef: "1 John 4:18",
      passageText:
        "There is no fear in love; but perfect love casteth out fear: because fear " +
        "hath torment. He that feareth is not made perfect in love.",
      reflection:
        "Yochanan (John) names the deepest fear of all — the fear that you are not " +
        "truly loved, not safe with the One who made you, that under everything He " +
        "is finally against you. Much of the dread that haunts the religious heart " +
        "is exactly this: a God to be afraid of rather than a Father to run to. " +
        "And the systems of this age have fed that fear for centuries, painting " +
        "the Most High as the one whose anger you must constantly escape. But " +
        "perfect love casteth out fear. Not your love for Him, which wavers, but " +
        "His love for you, which is perfect. Fear hath torment — it is its own " +
        "punishment, the slow misery of believing you are unwanted. The cure is " +
        "not trying harder to be unafraid. The cure is being so thoroughly loved " +
        "that the fear has nowhere left to stand. He came in the flesh to gather " +
        "you home precisely because that is the kind of love He has.",
      invitation:
        "If your fear is finally a fear of the Father Himself — that He is angry, " +
        "distant, waiting to condemn — let the truth of His love come all the way " +
        "in. Perfect love casts out fear, and the love is His, already given, " +
        "already proven. You do not have to live tormented by a God who is not " +
        "really like that. Come home and be loved until there is no room left for " +
        "the fear.",
      closing: "Perfect love casts out fear — and the love is His.",
    },
  ],
};

const HOPE_AND_ENDURANCE: DevotionalTheme = {
  id: "hope-and-endurance",
  title: "Hope & Endurance",
  subtitle: "Thirty days for the long wait — strength for the scattered on the road home.",
  description:
    "Endurance is not a Yahudi (Jewish) virtue or a Christian self-help slogan; it is " +
    "the posture of a covenant people whom Yahuah (God) divorced, scattered, and swore " +
    "to gather, who must hold fast through the day of Ya'aqov's (Jacob's) trouble until " +
    "the trumpet sounds. The pulpit told a worn-out people that the tribulation is " +
    "behind them and the curse is paid off, so suffering must mean something has gone " +
    "wrong. The prophets say the field is still being sown in tears, the wheat is still " +
    "being sifted, and the morning is coming for those who wait on Him. These thirty " +
    "days are for the weary on the long road — not a program to grit through, but the " +
    "Word laid plainly beside the wait, so the scattered can lift their heads.",
  entries: [
    {
      id: "tribulation-works-patience",
      title: "What Tribulation Is Working",
      subtitle: "The pressure is not the proof you were abandoned — it is doing something.",
      passageRef: "Romans 5:3-5",
      passageText:
        "And not only so, but we glory in tribulations also: knowing that tribulation " +
        "worketh patience; And patience, experience; and experience, hope: And hope " +
        "maketh not ashamed; because the love of Elohim (God) is shed abroad in our " +
        "hearts by the Ruach HaKodesh (Holy Spirit) which is given unto us.",
      reflection:
        "The pulpit taught a scattered people that hardship is a sign the cross did " +
        "not take. If you are still in trouble, the reasoning goes, your faith must be " +
        "thin. Paul says the opposite to a people he is bringing home. Tribulation is " +
        "not the absence of love; it is the place love does its work — pressure into " +
        "patience, patience into proven character, proven character into a hope that " +
        "will not be put to shame. The same Spirit who fell at the Feast of Weeks is " +
        "the One pouring the Father's love into the heart while the pressure is still " +
        "on. He does not wait until the trouble lifts to love you. He loves you in the " +
        "furnace, and the furnace is making something He intends to gather.",
      invitation:
        "You were never promised a road without weight. You were promised that the " +
        "weight is working, and that the One who allowed it is in it with you. Stop " +
        "reading your trouble as a verdict against you. The hope being forged in you " +
        "now is the kind that does not collapse when the next hard thing comes. Bring " +
        "the pressure to Him and let Him do with it what He said He would.",
      closing: "Hope maketh not ashamed. Hold on.",
    },
    {
      id: "not-worthy-to-be-compared",
      title: "Not Worthy to Be Compared",
      subtitle: "Weigh what is coming against what is here, and the scale tips.",
      passageRef: "Romans 8:18",
      passageText:
        "For I reckon that the sufferings of this present time are not worthy to be " +
        "compared with the glory which shall be revealed in us.",
      reflection:
        "This is not a man minimizing pain from a comfortable chair. Paul was beaten, " +
        "stoned, shipwrecked, hunted — and he still calls the suffering of this present " +
        "time light by comparison. He can say it because he knows where the story is " +
        "going. The scattered seed of Yashar'el (Israel) live in the day of trouble " +
        "now: the curse-system of Deuteronomy 28 still falls, the wounds are real, the " +
        "exile is not yet over. But the glory to be revealed is the gathering — the " +
        "first resurrection of the worthy, the wheat brought home, the kingdom of " +
        "priests in the land. The Christian habit reads the suffering as the leftover " +
        "of a problem already solved. Paul reads it as the labor pains of a deliverance " +
        "not yet arrived. The scale only tips when you can see the far end.",
      invitation:
        "You are not measuring your pain against nothing. You are measuring it against " +
        "the weight of what He has sworn to do for His own. Lift your eyes off the " +
        "ground long enough to put the glory on the other side of the scale. The " +
        "present time is real, but it is not the whole reckoning, and it is not the end.",
      closing: "Not worthy to be compared. The far end is sure.",
    },
    {
      id: "saved-by-hope",
      title: "Saved by Hope",
      subtitle: "What you cannot yet see, you wait for — and the waiting is faith.",
      passageRef: "Romans 8:24-25",
      passageText:
        "For we are saved by hope: but hope that is seen is not hope: for what a man " +
        "seeth, why doth he yet hope for? But if we hope for that we see not, then do " +
        "we with patience wait for it.",
      reflection:
        "Hope that has already arrived is not hope at all — it is sight. So the very " +
        "fact that you are still waiting, still unseen of the thing promised, is not a " +
        "sign the promise failed. It is the condition under which hope exists. The " +
        "whole creation groans, Paul says just before this, and the sons of Adam groan " +
        "with it, waiting for the redemption. The scattered have always lived in this " +
        "tension: divorced and dispersed among the nations, told by every system that " +
        "the gathering of the twelve tribes is a metaphor or a memory. But what Yahuah " +
        "(God) swore through the prophets, He has not yet shown in full — which is " +
        "exactly why it is still hope, and why the waiting is the work of faith and not " +
        "the failure of it.",
      invitation:
        "If you cannot see the homecoming yet, you are not behind. You are exactly " +
        "where hope lives — in the not-yet, waiting with patience for what He has " +
        "promised but not yet handed over. The unseen is not the absent. Let the " +
        "waiting itself become a quiet trust that the One who spoke does not forget " +
        "what He said.",
      closing: "We are saved by hope. Wait for it.",
    },
    {
      id: "trying-of-faith",
      title: "Count It Joy",
      subtitle: "The trying of your faith is not the breaking of it — it is the finishing.",
      passageRef: "James 1:2-4",
      passageText:
        "My brethren, count it all joy when ye fall into divers temptations; Knowing " +
        "this, that the trying of your faith worketh patience. But let patience have " +
        "her perfect work, that ye may be perfect and entire, wanting nothing.",
      reflection:
        "Ya'aqov (James) writes to the twelve tribes scattered abroad — he names them " +
        "in the very first verse — and the first thing he tells a dispersed people is " +
        "how to read their trials. Not as punishment to be escaped, but as the trying " +
        "that finishes faith. The word is the smith's word: the metal goes into the " +
        "fire not to be destroyed but to be made whole, the dross drawn off, the thing " +
        "made perfect and entire. This is the same sifting the prophets named for the " +
        "gathered wheat — chaff from kernel, the rebel purged out, the fruitful proven. " +
        "It is not pleasant while it burns. But patience is not asked to grit its way " +
        "through; it is given a perfect work to do, and the joy is in knowing what the " +
        "fire is for.",
      invitation:
        "You do not have to manufacture joy you do not feel. You have to know what the " +
        "trial is doing — finishing what He began in you, leaving you wanting nothing. " +
        "Let patience have its full work. Do not run from the fire that is making you " +
        "whole. The Smith does not waste the metal He chose.",
      closing: "Perfect and entire, wanting nothing. Let it finish.",
    },
    {
      id: "endure-temptation",
      title: "The Crown for Those Who Endure",
      subtitle: "Blessed is the one who holds — not because he earned it, but because he loves Him.",
      passageRef: "James 1:12",
      passageText:
        "Blessed is the man that endureth temptation: for when he is tried, he shall " +
        "receive the crown of life, which Yahuah (the Lord) hath promised to them that " +
        "love him.",
      reflection:
        "Watch where the crown is promised — not to the one who simply professed, but " +
        "to the one who endured and is found, when tried, to love Him. This is the " +
        "post-harvest sifting in a single line. The wheat is not crowned for having " +
        "been gathered; it is crowned for being fruitful when the threshing floor " +
        "tests it. Ya'aqov (James) is not teaching salvation earned by gritting " +
        "through hardship — the crown is promised, a gift, to them that love Him. But " +
        "love that never endures anything was never tested, and untested love is the " +
        "kind that says Lord, Lord and is sent away. The enduring is not the price of " +
        "the crown. It is the evidence of the love the crown is promised to.",
      invitation:
        "The holding on you are doing in the dark — when nothing in you feels it and " +
        "no one sees it — is not invisible to Him. It is the very thing the blessing " +
        "is spoken over. You are not enduring to make Him love you; you endure because " +
        "you do. Keep loving Him through the trial. The crown is already promised to " +
        "the ones who do.",
      closing: "Blessed is the man that endureth. The crown is promised.",
    },
    {
      id: "husbandman-waits",
      title: "As the Husbandman Waits",
      subtitle: "The farmer does not curse the slow season — he knows the rain is coming.",
      passageRef: "James 5:7-8",
      passageText:
        "Be patient therefore, brethren, unto the coming of Yahuah (the Lord). " +
        "Behold, the husbandman waiteth for the precious fruit of the earth, and hath " +
        "long patience for it, until he receive the early and latter rain. Be ye also " +
        "patient; stablish your hearts: for the coming of Yahuah (the Lord) draweth " +
        "nigh.",
      reflection:
        "Ya'aqov (James) hands the scattered a picture from the very calendar of the " +
        "Father — the early rain and the latter rain, the seasons Yahuah (God) " +
        "appointed for the land. The farmer does not stand over the seed demanding it " +
        "rise faster, and he does not conclude the harvest has failed because the " +
        "ground is bare in the dry season. He waits with long patience, because he " +
        "knows the One who sends the rain keeps His appointments. The gathering of the " +
        "twelve tribes runs on that same calendar — not on the impatience of the " +
        "scattered, and not on the timetable any system tried to nail down. The fruit " +
        "is precious, and precious fruit is not hurried. The rain comes in its season.",
      invitation:
        "If the season feels dry and long, you are not forgotten — you are between the " +
        "rains. Establish your heart, the way the farmer settles into the wait, because " +
        "the One who promised the harvest also appoints the weather. Stop trying to " +
        "force the season. Trust the One who set the seasons in the first place.",
      closing: "The husbandman waits, and the rain comes. So can you.",
    },
    {
      id: "more-precious-than-gold",
      title: "More Precious Than Gold",
      subtitle: "The fire does not consume the faith — it proves it worth keeping.",
      passageRef: "1 Peter 1:6-7",
      passageText:
        "Wherein ye greatly rejoice, though now for a season, if need be, ye are in " +
        "heaviness through manifold temptations: That the trial of your faith, being " +
        "much more precious than that of gold that perisheth, though it be tried with " +
        "fire, might be found unto praise and honour and glory at the appearing of " +
        "Yahusha HaMashiach (Jesus Christ).",
      reflection:
        "Kefa (Peter) writes to the strangers scattered abroad — the dispersed of the " +
        "covenant living among the nations — and he does not pretend the heaviness " +
        "away. For a season, if need be, you are in heaviness. He says it plainly. But " +
        "he names what the fire is doing: proving a faith more precious than gold. Gold " +
        "goes through the refiner's fire and comes out purer, and even then it " +
        "perishes. Your faith, tried in the same fire, does not perish — it is found " +
        "unto praise and honor and glory when He appears. The heaviness is for a " +
        "season; the faith proven in it is for the gathering. The systems that promised " +
        "you a fireless walk lied. The fire is not the enemy of your faith. It is how " +
        "the Father shows what He has made in you is real.",
      invitation:
        "The heaviness you carry now has a horizon — for a season, if need be, not " +
        "forever and not for nothing. Let the fire do what fire does to gold, except " +
        "that what comes out of you will not perish. You are not being destroyed. You " +
        "are being proven. Hold the faith through the season, and let Him be the one " +
        "who declares it precious.",
      closing: "More precious than gold. The fire is not the end of you.",
    },
    {
      id: "after-ye-have-suffered",
      title: "After Ye Have Suffered",
      subtitle: "The suffering is real and the establishing is sure — both, from one hand.",
      passageRef: "1 Peter 5:10",
      passageText:
        "But the Elohim (God) of all grace, who hath called us unto his eternal glory " +
        "by Yahusha HaMashiach (Jesus Christ), after that ye have suffered a while, " +
        "make you perfect, stablish, strengthen, settle you.",
      reflection:
        "Read the order Kefa (Peter) keeps. After that ye have suffered a while — then " +
        "perfect, establish, strengthen, settle. He does not promise the suffering " +
        "around it; he promises the establishing on the far side of it. This is the " +
        "Father of all grace speaking, the same One who called the scattered to His " +
        "eternal glory, and grace here is not a wedge that exempts the called from " +
        "hardship. Grace is what carries them through it and settles them after. The " +
        "Christian grammar that reads suffering as a sign grace ran out has the whole " +
        "thing backward. The God of all grace is the one who said after ye have " +
        "suffered a while. The while is not endless. The strengthening at the end of it " +
        "is His own work, not yours.",
      invitation:
        "There is a word at the front of this promise you cannot skip — after. The " +
        "suffering has a duration and a destination, and on the other side of it the " +
        "Father Himself does the perfecting, the establishing, the settling. You do not " +
        "have to strengthen yourself. You have to last the while, leaning on the One " +
        "who already named what He will do when it is done.",
      closing: "After ye have suffered a while — He settles you.",
    },
    {
      id: "died-in-faith",
      title: "They Died in Faith",
      subtitle: "The faithful before us held the promise they never saw fulfilled — and held it still.",
      passageRef: "Hebrews 11:13",
      passageText:
        "These all died in faith, not having received the promises, but having seen " +
        "them afar off, and were persuaded of them, and embraced them, and confessed " +
        "that they were strangers and pilgrims on the earth.",
      reflection:
        "Avraham (Abraham), Yitschaq (Isaac), Ya'aqov (Jacob), Sarah, and the faithful " +
        "of every generation back — they died in faith, not having received what was " +
        "promised. They saw it afar off. They embraced it from a distance. They " +
        "confessed they were strangers and pilgrims, never settled, never arrived. " +
        "These are the natural branches, the fathers who walked the covenant faithfully " +
        "in their lifetimes and now sleep, awaiting the resurrection when Yahuah (God) " +
        "grafts them in again. They did not get the homecoming in their days, and it " +
        "did not break their faith. If the giants of the faith waited their whole lives " +
        "and died still waiting, the wait you are in is not a sign you have failed. It " +
        "is the company you are keeping — strangers and pilgrims, persuaded of a " +
        "promise still afar off.",
      invitation:
        "You are not the first to hold a promise you have not yet seen kept. The " +
        "faithful before you embraced it from a distance and called themselves pilgrims, " +
        "and Yahuah (God) was not ashamed to be called their Elohim (God). Let their " +
        "long faith steady yours. The promise seen afar off is still the promise, and " +
        "the One who made it keeps it for those who sleep as surely as for those who " +
        "wake.",
      closing: "They died in faith, still waiting. The promise held.",
    },
    {
      id: "better-thing-for-us",
      title: "Some Better Thing",
      subtitle: "The cloud of witnesses waits with us — the homecoming was always meant to be shared.",
      passageRef: "Hebrews 11:39-40",
      passageText:
        "And these all, having obtained a good report through faith, received not the " +
        "promise: Elohim (God) having provided some better thing for us, that they " +
        "without us should not be made perfect.",
      reflection:
        "Here is the reason the fathers died still waiting: the Father provided some " +
        "better thing, that they without us should not be made perfect. The completion " +
        "was never meant to come to one generation alone. Avraham (Abraham) and the " +
        "prophets and the faithful unnamed are not perfected apart from the gathered " +
        "remnant of the last days — the whole covenant family comes into the promise " +
        "together, at the first resurrection, when the worthy of the seed are raised " +
        "and the wheat is brought home. The wait you are in is bound up with theirs. " +
        "Your endurance is not a private struggle to be finished alone in the dark. It " +
        "is one strand in a single homecoming the Father has been weaving across every " +
        "generation, so that the sleeping fathers and the waking remnant arrive at the " +
        "table on the same day.",
      invitation:
        "Your wait is not isolated. It is joined to the long faith of everyone who has " +
        "ever trusted Him and not yet seen the end — they without you, you without " +
        "them, none made perfect alone. The better thing the Father is providing " +
        "gathers all of you at once. Endure as one held inside that whole company, " +
        "because the homecoming He planned was always meant to be shared.",
      closing: "Some better thing — and we come home together.",
    },
    {
      id: "run-with-patience",
      title: "Run With Patience",
      subtitle: "Lay down the weight, fix your eyes, and run the race you were given.",
      passageRef: "Hebrews 12:1-2",
      passageText:
        "Wherefore seeing we also are compassed about with so great a cloud of " +
        "witnesses, let us lay aside every weight, and the sin which doth so easily " +
        "beset us, and let us run with patience the race that is set before us, Looking " +
        "unto Yahusha (Jesus) the author and finisher of our faith; who for the joy " +
        "that was set before him endured the cross, despising the shame, and is set " +
        "down at the right hand of the throne of Elohim (God).",
      reflection:
        "The race is set before us — not chosen by us, not optional, and not a sprint. " +
        "It is run with patience. And the One we fix our eyes on ran it first: Yahusha " +
        "(Jesus), who for the joy set before Him endured the cross. He did not endure " +
        "by pretending the cross was light. He endured by keeping His eyes on the joy " +
        "on the far side of it. That is the pattern handed to a people on a long road " +
        "home. Lay down the weight — the dead-weight of inherited lies, the besetting " +
        "sin, everything that slows the legs — and run with patience, looking at the " +
        "One who finished the same kind of course. The author of your faith is also its " +
        "finisher. He is not watching from the stands. He ran it, and He is bringing " +
        "you through it.",
      invitation:
        "You are not asked to run fast. You are asked to run with patience, and to keep " +
        "your eyes on the One who ran it before you for the joy of bringing you home. " +
        "Set down whatever is weighing your legs. The race was set before you by a " +
        "Father who means for you to finish, and the finisher of your faith is already " +
        "at the line, willing you the rest of the way.",
      closing: "Run with patience, looking unto Him. He finished first.",
    },
    {
      id: "chastening-yields-fruit",
      title: "Afterward It Yields",
      subtitle: "No correction feels like love in the moment — but watch what it grows.",
      passageRef: "Hebrews 12:11",
      passageText:
        "Now no chastening for the present seemeth to be joyous, but grievous: " +
        "nevertheless afterward it yieldeth the peaceable fruit of righteousness unto " +
        "them which are exercised thereby.",
      reflection:
        "The writer is honest about the present — no chastening seems joyous, it seems " +
        "grievous. He does not dress it up. But he points past the present to the " +
        "afterward, where the peaceable fruit of righteousness grows in those exercised " +
        "by it. This is a Father's correction, not a judge's sentence. The systems that " +
        "taught a scattered people their hardship meant the curse was paid and " +
        "something must now be wrong missed what the Word says plainly: the Father " +
        "disciplines the children He receives, and the discipline is not the withdrawal " +
        "of His love but the proof of it. The wounds of walking off the Way are real — " +
        "the curse-system still operates in this age. But for the son He is bringing " +
        "home, even the correction is bent toward an afterward of peace. The grievous " +
        "present is not the whole story. There is an afterward, and it yields.",
      invitation:
        "If you are being corrected, you are not being cast off — you are being treated " +
        "as a child He intends to keep. The present grief is real; do not let anyone " +
        "tell you it is not. But do not read it as rejection either. Let the correction " +
        "exercise you toward the afterward, where the peaceable fruit of righteousness " +
        "is already taking root in the ones who endure it.",
      closing: "Grievous now, peaceable afterward. Let it yield.",
    },
    {
      id: "cast-not-away-confidence",
      title: "Cast Not Away Your Confidence",
      subtitle: "You have done the hard thing once — do not throw it away at the threshold.",
      passageRef: "Hebrews 10:35-36",
      passageText:
        "Cast not away therefore your confidence, which hath great recompence of " +
        "reward. For ye have need of patience, that, after ye have done the will of " +
        "Elohim (God), ye might receive the promise.",
      reflection:
        "There is a danger the writer names that is not the danger of never starting — " +
        "it is the danger of starting and then casting it away near the end. Do not " +
        "throw away the confidence you fought to gain. And then he names the one thing " +
        "still needed: ye have need of patience. Not more striving, not a better " +
        "performance — patience, to keep doing the will of the Father in the gap " +
        "between doing it and receiving the promise. This is the gap the scattered live " +
        "in: the will is being done, the homecoming not yet received, and the " +
        "temptation in that gap is to conclude it was all for nothing and let go. The " +
        "writer says no — the recompense is great, the promise is sure, and the only " +
        "thing the gap requires is the patience to keep holding what you have already " +
        "taken hold of.",
      invitation:
        "If you have come this far — out of the lie, toward the Name, onto the Way — do " +
        "not let go now at the place where the wait is longest. You have need of " +
        "patience, not of a fresh start. The confidence you carry has great reward " +
        "attached to it. Keep it. Keep doing His will in the gap, and let the promise " +
        "find you still holding on.",
      closing: "Cast not away your confidence. You have need of patience.",
    },
    {
      id: "wait-on-yahuah",
      title: "Wait on Yahuah",
      subtitle: "The strength you need is not summoned — it is given to the ones who wait.",
      passageRef: "Psalm 27:14",
      passageText:
        "Wait on Yahuah (the LORD): be of good courage, and he shall strengthen thine " +
        "heart: wait, I say, on Yahuah (the LORD).",
      reflection:
        "David says it twice in one breath — wait on Yahuah (the LORD)... wait, I say, " +
        "on Yahuah (the LORD) — the way you repeat a thing to someone close to giving " +
        "up. Between the two waits sits the promise: He shall strengthen thine heart. " +
        "The strength does not come before the waiting and it does not come instead of " +
        "it. It comes to the one who waits. This is not passive resignation; the word " +
        "carries the tension of a watchman straining toward the dawn, the courage of " +
        "someone who keeps his eyes on the One he is waiting for. The scattered have " +
        "always been a waiting people — divorced, dispersed, holding a promise of " +
        "gathering that has not yet come in full. David hands them the only posture " +
        "that survives that wait: wait on Him, take courage, and let Him be the one who " +
        "strengthens the heart that would otherwise fail.",
      invitation:
        "When your heart feels too weak for the wait, you are exactly the one this verse " +
        "is spoken to. You do not have to find the courage first. Wait on Him — and " +
        "again, wait on Him — and let the strengthening of your heart be His work, not " +
        "the condition you have to meet before He shows up. He strengthens the waiting " +
        "heart. That is the whole promise.",
      closing: "Wait on Yahuah. He strengthens the heart that waits.",
    },
    {
      id: "joy-in-the-morning",
      title: "Joy Cometh in the Morning",
      subtitle: "The weeping has a night-length — and the morning is on the way.",
      passageRef: "Psalm 30:5",
      passageText:
        "For his anger endureth but a moment; in his favour is life: weeping may " +
        "endure for a night, but joy cometh in the morning.",
      reflection:
        "David sets two durations side by side — a moment and a night against life and " +
        "a morning — and the weight is all on the second pair. The anger is a moment; " +
        "the favor is life. The weeping endures a night; the joy comes in the morning. " +
        "He is not denying the night. Weeping endures, he says — it is real, it lasts, " +
        "it is long enough to be called a night. But a night has a length, and the One " +
        "who set the sun in the sky appointed the morning to follow it. The scattered " +
        "have wept long nights — the night of exile, the night of forgetting their own " +
        "name, the night of a covenant they were told no longer applied to them. The " +
        "promise is not that the night was nothing. The promise is that it is a night, " +
        "and the morning belongs to the same Father whose favor is life.",
      invitation:
        "If you are in the weeping, you are in the night — and the night is not the day " +
        "He has appointed for you. The favor that lasts a lifetime is His; the anger " +
        "that touches you is a moment by comparison. Let the morning be His to bring. " +
        "You do not have to force the dawn. You have to endure the night knowing whose " +
        "morning is coming after it.",
      closing: "Weeping for a night — but joy cometh in the morning.",
    },
    {
      id: "sow-in-tears",
      title: "Sowing in Tears",
      subtitle: "The seed you plant weeping is not lost — it is going to come back as sheaves.",
      passageRef: "Psalm 126:5-6",
      passageText:
        "They that sow in tears shall reap in joy. He that goeth forth and weepeth, " +
        "bearing precious seed, shall doubtless come again with rejoicing, bringing " +
        "his sheaves with him.",
      reflection:
        "This is a psalm of the return from captivity, sung by a people who knew what " +
        "it was to be carried off and brought back. They sow in tears — the seed goes " +
        "into the ground with weeping, in a season that gives no sign yet of harvest. " +
        "But the psalm says doubtless. Not maybe, not if the conditions improve — " +
        "doubtless he shall come again with rejoicing, bringing his sheaves. The tears " +
        "are not the opposite of the harvest; they are the planting of it. The " +
        "scattered seed of Yashar'el (Israel) was itself sown weeping into every " +
        "nation, and the Father who scattered the seed swore to bring it home as a " +
        "harvest. Nothing planted in tears before Him is wasted. The going forth and " +
        "the weeping are the front half of a sentence whose back half is rejoicing and " +
        "sheaves.",
      invitation:
        "The tears you are sowing now are not falling on barren ground. The seed is " +
        "precious to Him, the planting is real even when no harvest is in sight, and " +
        "the return is doubtless — His word, not a wish. Go on sowing through the " +
        "weeping. The same Father who carries the seed out is the One who brings it " +
        "home in sheaves.",
      closing: "Sow in tears, reap in joy. The return is doubtless.",
    },
    {
      id: "hope-thou-in-elohim",
      title: "Hope Thou in Elohim",
      subtitle: "When your own soul turns on you, speak the promise back to it.",
      passageRef: "Psalm 42:11",
      passageText:
        "Why art thou cast down, O my soul? and why art thou disquieted within me? " +
        "hope thou in Elohim (God): for I shall yet praise him, who is the health of " +
        "my countenance, and my Elohim (God).",
      reflection:
        "The psalmist does something the systems rarely teach a struggling believer to " +
        "do — he talks back to his own soul. Why art thou cast down? He does not " +
        "pretend the downcast feeling away, and he does not let it rule him either. He " +
        "questions it, and then he commands it: hope thou in Elohim (God). And he gives " +
        "the soul a reason rooted in the future — for I shall yet praise Him. Yet. Not " +
        "now, perhaps, in the dryness; but yet, on a day still coming. This is the " +
        "discipline of a waiting people who feel the weight of the wait. The feeling is " +
        "honest, but it does not get the last word. The last word is hope, preached by " +
        "the believer to his own disquieted heart, anchored in a praise he will yet " +
        "give to the One who is the health of his countenance.",
      invitation:
        "When your soul turns heavy and accuses you, you do not have to obey it. You " +
        "can do what the psalmist did — name the heaviness, and then speak hope back " +
        "into it, on the authority of a God who has not finished with you. Tell your " +
        "downcast soul the truth: you shall yet praise Him. The yet is His promise. " +
        "Preach it to yourself until your heart believes it.",
      closing: "Hope thou in Elohim — for I shall yet praise Him.",
    },
    {
      id: "renew-their-strength",
      title: "They That Wait Renew Their Strength",
      subtitle: "Even the young grow faint — but the waiting are carried on wings.",
      passageRef: "Isaiah 40:31",
      passageText:
        "But they that wait upon Yahuah (the LORD) shall renew their strength; they " +
        "shall mount up with wings as eagles; they shall run, and not be weary; and " +
        "they shall walk, and not faint.",
      reflection:
        "Isaiah speaks this to a people in exile, told to comfort the comfortless — and " +
        "two verses earlier he admits the plain truth that even the youths faint and " +
        "the young men utterly fall. Strength runs out. He is not denying it. But the " +
        "ones who wait upon Yahuah (the LORD) renew it — not by gathering more of their " +
        "own, but by exchanging their spent strength for His. The picture moves " +
        "downward as it goes: mount up with wings, then run, then walk. The mountaintop " +
        "soaring is real, but so is the day when all you can do is keep walking and not " +
        "faint, and the promise covers that day too. This is endurance for the " +
        "scattered, the exiled, the long-tired: the strength to keep going is not " +
        "yours to manufacture. It is renewed in the waiting, traded for His.",
      invitation:
        "If you are faint — and even the strong grow faint — the answer is not to dig " +
        "deeper for a strength you have already spent. It is to wait on Him and let Him " +
        "renew it. Some days that looks like wings; many days it looks like just " +
        "walking and not fainting. Both are His doing. Bring Him your emptiness and let " +
        "Him trade you His strength for it.",
      closing: "They that wait shall renew their strength. Trade Him yours.",
    },
    {
      id: "through-the-waters",
      title: "Through the Waters, Through the Fire",
      subtitle: "He did not promise no rivers — He promised to be with you in them.",
      passageRef: "Isaiah 43:2",
      passageText:
        "When thou passest through the waters, I will be with thee; and through the " +
        "rivers, they shall not overflow thee: when thou walkest through the fire, " +
        "thou shalt not be burned; neither shall the flame kindle upon thee.",
      reflection:
        "Read the first word of every clause — when. Not if. When thou passest through " +
        "the waters... when thou walkest through the fire. Yahuah (God) does not " +
        "promise His own a path that goes around the rivers and the flames. He promises " +
        "to be with them in the midst of both. The verse just before this names who He " +
        "is speaking to: the one He created, formed, redeemed, called by name. To that " +
        "one He says the waters will not overflow and the fire will not consume — not " +
        "because the waters and fire are not real, but because He Himself is in them. " +
        "This is the covenant promise to a people He scattered and swore to gather: the " +
        "exile is a passage through deep water and hot fire, and He is in the passage, " +
        "and the passage does not get the last word over those He has called by name.",
      invitation:
        "You may be in the water or in the fire right now, and the promise does not " +
        "pretend you are not. It says something better — that He is with you in it, and " +
        "that it will not overflow you or burn you up, because He is the One who formed " +
        "you and called you by name. You do not have to get yourself across. You have " +
        "to know who is in the river with you. Lean on the One who said when, not if.",
      closing: "Through the waters, He is with you. You will not be overflowed.",
    },
    {
      id: "good-to-wait-quietly",
      title: "Good to Wait Quietly",
      subtitle: "From the ruins, the prophet remembers the only thing worth standing on.",
      passageRef: "Lamentations 3:25-26",
      passageText:
        "Yahuah (the LORD) is good unto them that wait for him, to the soul that " +
        "seeketh him. It is good that a man should both hope and quietly wait for the " +
        "salvation of Yahuah (the LORD).",
      reflection:
        "Lamentations is written over the smoking ruins of Yerushalayim (Jerusalem) — " +
        "the prophet sits in the worst day his people have known. And from inside that " +
        "grief he says it is good to hope and quietly wait. This is not the optimism of " +
        "someone who has avoided suffering; it is the settled conviction of someone " +
        "buried in it. Yahuah (the LORD) is good unto them that wait for Him — the " +
        "goodness is not measured by the comfort of the moment but by the character of " +
        "the One waited on. The quiet in quietly wait is hard-won. It is not the quiet " +
        "of numbness but the quiet of a soul that has stopped demanding the wait be " +
        "over and has begun seeking the One at the end of it. Even in the ruins, that " +
        "waiting is called good.",
      invitation:
        "If you are sitting in something that looks like ruins, the prophet who sat " +
        "there first found one thing solid enough to stand on: Yahuah (the LORD) is " +
        "good to those who wait for Him. You do not have to wait loudly, demanding the " +
        "end. You can wait quietly, seeking Him in the middle of it. That quiet waiting " +
        "is not giving up. Scripture calls it good.",
      closing: "Good to hope and quietly wait. He is good to those who do.",
    },
    {
      id: "wait-for-the-vision",
      title: "Though It Tarry, Wait for It",
      subtitle: "The vision has an appointed time — and an appointment is not a delay.",
      passageRef: "Habakkuk 2:3",
      passageText:
        "For the vision is yet for an appointed time, but at the end it shall speak, " +
        "and not lie: though it tarry, wait for it; because it will surely come, it " +
        "will not tarry.",
      reflection:
        "Habakkuk had cried out and heard no answer, watched violence go unaddressed, " +
        "asked how long. The answer he is given is not that the wait is over but that " +
        "the vision has an appointed time. That phrase changes everything. A delay is " +
        "a failure to arrive; an appointment is a time already set. The scattered serve " +
        "a Father who keeps appointed times — He wrote them into the sun and the moon, " +
        "and the gathering of His own is one of them. Though it tarry, wait for it — and " +
        "then the paradox: it will surely come, it will not tarry. From inside the wait " +
        "it tarries; from the Father's calendar it is right on time. The vision will " +
        "speak at the end, and it will not lie. What looks like delay to the waiting is " +
        "an appointment to the One who set it.",
      invitation:
        "What you are waiting on may feel overdue, but the Father does not run late on " +
        "His own appointments. The vision is for an appointed time, and the time is His " +
        "to keep, not yours to force. Wait for it — not as one watching a broken " +
        "promise, but as one watching a clock the Father is holding. It will surely " +
        "come. It will speak at the end, and it will not lie.",
      closing: "Though it tarry, wait for it. It will surely come.",
    },
    {
      id: "yet-i-will-rejoice",
      title: "Yet I Will Rejoice",
      subtitle: "When every visible thing fails, joy reaches past the harvest to the One who gives it.",
      passageRef: "Habakkuk 3:17-18",
      passageText:
        "Although the fig tree shall not blossom, neither shall fruit be in the vines; " +
        "the labour of the olive shall fail, and the fields shall yield no meat; the " +
        "flock shall be cut off from the fold, and there shall be no herd in the " +
        "stalls: Yet I will rejoice in Yahuah (the LORD), I will joy in the Elohim " +
        "(God) of my salvation.",
      reflection:
        "Habakkuk does not rejoice because things are going well. He lists, one by one, " +
        "every visible thing failing — no figs, no grapes, no olives, no grain, no " +
        "flock, no herd. The whole economy of the land collapses in a single sentence. " +
        "And then the hinge of the whole book: yet. Yet I will rejoice in Yahuah (the " +
        "LORD). His joy is not anchored to the harvest; it is anchored to the One who " +
        "gives the harvest, and that One does not fail when the fig tree does. This is " +
        "the joy that survives the day of trouble — not denial of the loss, not " +
        "pretending the stalls are full when they are empty, but a deliberate turning " +
        "of the heart past every failed visible thing to the Elohim (God) of " +
        "salvation. The scattered learn this joy or they do not survive the wait. It " +
        "stands on Him alone.",
      invitation:
        "If the visible things are failing around you — the provision, the security, " +
        "the things you counted on — Habakkuk shows you a joy that does not depend on " +
        "any of them. It is the deliberate yet of a heart that has decided to rejoice " +
        "in the One who remains when everything else is cut off. You do not have to " +
        "feel the stalls are full. You can joy in the Elohim (God) of your salvation " +
        "while they are empty, because He is the One who does not fail.",
      closing: "Yet I will rejoice in Him. He does not fail when the harvest does.",
    },
    {
      id: "when-i-fall-i-arise",
      title: "When I Fall, I Shall Arise",
      subtitle: "The enemy gloats too soon — the falling is not the finish.",
      passageRef: "Micah 7:7-8",
      passageText:
        "Therefore I will look unto Yahuah (the LORD); I will wait for the Elohim " +
        "(God) of my salvation: my Elohim (God) will hear me. Rejoice not against me, " +
        "O mine enemy: when I fall, I shall arise; when I sit in darkness, Yahuah (the " +
        "LORD) shall be a light unto me.",
      reflection:
        "Micah speaks for a people in the dark, surrounded by an enemy already " +
        "celebrating their downfall. His answer is not a claim that he has not fallen. " +
        "He has. He sits in darkness. But he warns the gloating enemy off: rejoice not " +
        "against me — when I fall, I shall arise. The falling is real and it is not " +
        "final. The same God he is waiting for is the One who will be a light to him in " +
        "the very darkness the enemy thinks is the end. This is the endurance of a " +
        "people who have been knocked down hard and have learned that being down is not " +
        "the same as being finished. The waiting and the looking are not weakness; they " +
        "are the posture of one who knows the rising is coming, because the Elohim " +
        "(God) of his salvation has not stopped hearing him.",
      invitation:
        "If you have fallen, and the voices around you — including the one in your own " +
        "head — are already counting you out, hear Micah's word over your own dark: " +
        "when I fall, I shall arise. The falling is not the verdict. Look to Him, wait " +
        "for Him, and let the One who is a light in the darkness be the One who raises " +
        "you. The enemy rejoices too soon.",
      closing: "When I fall, I shall arise. The dark is not the end.",
    },
    {
      id: "thoughts-of-peace",
      title: "Thoughts of Peace, an Expected End",
      subtitle: "Even the long exile was held inside a plan He had already finished.",
      passageRef: "Jeremiah 29:11",
      passageText:
        "For I know the thoughts that I think toward you, saith Yahuah (the LORD), " +
        "thoughts of peace, and not of evil, to give you an expected end.",
      reflection:
        "This is no greeting-card promise of an easy life — it is spoken to a people " +
        "Yahuah (God) had just told to settle into a seventy-year captivity, to build " +
        "houses and plant gardens in Babylon and wait. Into that long, hard sentence " +
        "He says: I know the thoughts I think toward you, thoughts of peace and not of " +
        "evil. The exile itself was not Him forgetting His people; it was Him thinking " +
        "thoughts of peace toward them across seventy years they would have to endure. " +
        "An expected end means an end already in His mind, an outcome He has not " +
        "wavered on. The scattering of the covenant people, generation upon generation, " +
        "is held inside the same kind of thought — not abandonment, but a long plan " +
        "moving toward a gathering He intended from the start. The wait is inside the " +
        "plan, not outside it.",
      invitation:
        "The hard, long thing you are walking through is not evidence that He stopped " +
        "thinking of you well. He told a people in captivity His thoughts toward them " +
        "were peace — in the captivity, not only after it. There is an expected end, " +
        "already settled in His mind, and you are inside His thoughts of peace right " +
        "now. Endure the long season as one held in a good plan, not abandoned to a " +
        "bad one.",
      closing: "Thoughts of peace, an expected end. You are inside His plan.",
    },
    {
      id: "endure-to-the-end",
      title: "He That Endureth to the End",
      subtitle: "The promise is not to the one who starts fast — it is to the one who lasts.",
      passageRef: "Matthew 24:13",
      passageText:
        "But he that shall endure unto the end, the same shall be saved.",
      reflection:
        "Yahusha (Jesus) says this in the middle of a long warning about the days " +
        "before the end — deception, tribulation, the love of many growing cold. And " +
        "His word to His own in those days is short and hard: he that shall endure unto " +
        "the end, the same shall be saved. This is not salvation earned by " +
        "white-knuckling to the finish. It is the same truth the whole Word keeps — " +
        "that the faith which saves is the faith that lasts, the wheat that is still " +
        "bearing fruit when the harvest comes. The systems that taught a people their " +
        "place was permanently secured the moment they prayed a prayer cut this verse " +
        "out of the book. Yahusha (Jesus) put it in. The one who endures to the end is " +
        "the one revealed to have been His all along — not because the enduring made " +
        "him a son, but because a son is the one who endures when the love of many " +
        "grows cold.",
      invitation:
        "You are not asked to have started perfectly. You are asked to endure to the " +
        "end — to keep loving Him when it would be easier and more common to grow cold. " +
        "The enduring is not how you earn your place; it is how a true son walks the " +
        "long days. Set your face toward the end, lean on the One who keeps His own, " +
        "and last. The promise is to the one who does.",
      closing: "He that endureth to the end, the same shall be saved.",
    },
    {
      id: "possess-your-souls",
      title: "In Patience Possess Your Souls",
      subtitle: "When everything shakes, patience is how you keep hold of yourself.",
      passageRef: "Luke 21:19",
      passageText:
        "In your patience possess ye your souls.",
      reflection:
        "Five words, spoken into a warning about days when families divide, when the " +
        "faithful are hated, when not a hair of the head shall perish even as some are " +
        "put to death — the paradox of a people kept by God through the very things " +
        "that come against them. In your patience possess ye your souls. To possess " +
        "your soul is to keep hold of who you are, to not be shaken loose from your own " +
        "ground when everything around you is shaking. And the means He gives is " +
        "patience — the steady endurance that does not panic, does not abandon the Way " +
        "when the pressure rises, does not trade the covenant for relief. The scattered " +
        "have lost much across the generations: their land, their language, their name, " +
        "the memory of who they were. But the soul kept in patience is not lost. It is " +
        "possessed, held fast, through the very wait that would shake it loose.",
      invitation:
        "When the days feel like they are shaking everything you stand on, the way you " +
        "keep hold of your own soul is patience — not frantic effort, not abandoning " +
        "the Way for a faster relief, but steady endurance that refuses to be shaken " +
        "loose. You are not asked to control what shakes. You are asked, in patience, " +
        "to possess your soul. Let Him steady you, and hold on to who you are in Him.",
      closing: "In your patience possess ye your souls.",
    },
    {
      id: "eternal-weight-of-glory",
      title: "A Far More Exceeding Weight",
      subtitle: "Look at what is unseen, and the affliction shrinks to its true size.",
      passageRef: "2 Corinthians 4:17-18",
      passageText:
        "For our light affliction, which is but for a moment, worketh for us a far " +
        "more exceeding and eternal weight of glory; While we look not at the things " +
        "which are seen, but at the things which are not seen: for the things which " +
        "are seen are temporal; but the things which are not seen are eternal.",
      reflection:
        "Paul, who was no stranger to suffering, weighs his affliction on one side and " +
        "what it is working on the other, and the scale slams down hard on the far " +
        "side — a far more exceeding and eternal weight of glory. He does not say the " +
        "affliction is nothing; he says it is light and momentary by comparison, and " +
        "more than that, that it is actively working the glory, not merely preceding " +
        "it. The hinge is where you look. Look at the things seen — the present trouble " +
        "filling the whole horizon — and the affliction is crushing. Look at the things " +
        "unseen, the eternal weight being prepared, and the affliction shrinks to a " +
        "moment. This is the discipline of a waiting people. The seen things are " +
        "temporal; they are passing even as they press. The unseen things are eternal, " +
        "and they are what the present trouble is quietly building.",
      invitation:
        "Where you look decides how heavy your affliction feels. Fix your eyes only on " +
        "the seen and the present, and it will crush you. Lift them to the unseen and " +
        "eternal — the weight of glory your light affliction is working — and the " +
        "trouble takes its true, momentary size. You do not have to deny the pain. You " +
        "have to refuse to let the seen be the only thing you look at.",
      closing: "Light and momentary, working an eternal weight. Look up.",
    },
    {
      id: "be-not-weary",
      title: "Faint Not in Due Season",
      subtitle: "The harvest has a season — keep sowing right, and do not quit before it comes.",
      passageRef: "Galatians 6:9",
      passageText:
        "And let us not be weary in well doing: for in due season we shall reap, if we " +
        "faint not.",
      reflection:
        "Paul, who never taught the scattered to abandon the Father's ways, here urges " +
        "them to keep walking in them — be not weary in well doing. The weariness he " +
        "names is the particular tiredness of doing right for a long time without yet " +
        "seeing the reaping. He answers it with the Father's own calendar: in due " +
        "season we shall reap. The harvest is not random and it is not earned by " +
        "frantic effort; it comes in its appointed season, the way the early and latter " +
        "rains come. Whatsoever a man soweth, that shall he also reap, Paul has just " +
        "said — the consequence-system is real, the Way matters, and the good sown in " +
        "the Spirit yields in time. The one condition he attaches is the whole theme of " +
        "these days: if we faint not. The reaping is sure for the ones who do not quit " +
        "the field before the season turns.",
      invitation:
        "If you are tired of doing right with no harvest in sight, the weariness is " +
        "real, but it is not a reason to stop. The season is the Father's to set, and " +
        "He has promised the reaping to those who do not faint before it comes. Keep " +
        "sowing in the Spirit. Do not abandon the Way at the very point where the " +
        "harvest is nearest. The due season belongs to Him, and it is coming.",
      closing: "In due season we shall reap, if we faint not.",
    },
    {
      id: "if-thou-come-to-serve",
      title: "Prepare Thy Soul for Trial",
      subtitle: "The ancient counsel did not promise an easy walk — it promised a tried gold.",
      passageRef: "Sirach 2:1-5",
      passageText:
        "My son, if thou come to serve Yahuah (the Lord), prepare thy soul for " +
        "temptation. Set thy heart aright, and constantly endure, and make not haste " +
        "in time of trouble. Cleave unto him, and depart not away, that thou mayest be " +
        "increased at thy last end. Whatsoever is brought upon thee take cheerfully, " +
        "and be patient when thou art changed to a low estate. For gold is tried in " +
        "the fire, and acceptable men in the furnace of adversity.",
      reflection:
        "This counsel, kept in the wisdom the Reformation later cut from the library, " +
        "is brutally honest from its first line: if thou come to serve Yahuah (the " +
        "Lord), prepare thy soul for temptation. Not if trouble comes, but when — and " +
        "so prepare for it. The whole passage is endurance instruction for a covenant " +
        "people: set the heart, constantly endure, do not make haste, cleave to Him and " +
        "do not depart, and take what comes cheerfully even when you are brought low. " +
        "And it ends with the smith's image the prophets love: gold is tried in the " +
        "fire, and acceptable men in the furnace of adversity. The furnace is not the " +
        "sign that you came to the wrong house. It is what the right house does to make " +
        "the metal acceptable. The ancient voice and the apostles say the same thing — " +
        "endure, cleave, do not depart, and let the fire prove you gold.",
      invitation:
        "If you came to serve Him expecting the road to be smooth, this old counsel " +
        "loves you enough to tell you the truth: prepare your soul for trial, because " +
        "the furnace comes to the ones who came to serve. But do not read the furnace " +
        "as a mistake. Cleave to Him, do not depart, take what comes without haste, and " +
        "let the fire that tries gold prove what He is making in you acceptable.",
      closing: "Gold is tried in the fire. Cleave to Him, and do not depart.",
    },
    {
      id: "the-patience-of-the-saints",
      title: "Here Is the Patience of the Saints",
      subtitle: "The whole long endurance comes down to this — keeping His ways, keeping the faith.",
      passageRef: "Revelation 14:12",
      passageText:
        "Here is the patience of the saints: here are they that keep the commandments " +
        "of Elohim (God), and the faith of Yahusha (Jesus).",
      reflection:
        "At the heart of the visions of the end, the whole endurance of the holy ones " +
        "is gathered into a single line — and notice the two things held together in " +
        "it. Here are they that keep the commandments of Elohim (God), and the faith of " +
        "Yahusha (Jesus). Not one against the other. Not faith instead of the " +
        "commandments, and not the commandments instead of faith — both, in one " +
        "enduring people. This is the patience of the saints: a faith that holds to " +
        "Yahusha (Jesus) and a walk that keeps the Father's ways, neither one let go " +
        "when the pressure to drop either is at its highest. The systems spent " +
        "centuries pitting these two against each other, teaching that to hold the " +
        "commandments was to lose grace and to hold grace was to leave the " +
        "commandments. The end of the book shows them as one cord in the hand of the " +
        "enduring. This is where the long wait was always going — a gathered people who " +
        "kept the faith and kept the Way, all the way home.",
      invitation:
        "After thirty days of holding on, this is the shape of the holding: keep the " +
        "faith of Yahusha (Jesus) and keep the commandments of Elohim (God), and never " +
        "let anyone tell you they pull against each other. The patience of the saints " +
        "is not endless striving and it is not careless ease. It is a faithful people " +
        "walking the Father's Way, trusting His Son, all the way to the gathering. You " +
        "are not waiting for nothing. You are waiting for home.",
      closing: "Here is the patience of the saints. Keep both, all the way home.",
    },
  ],
};

const GRIEF_AND_COMFORT: DevotionalTheme = {
  id: "grief-and-comfort",
  title: "Grief & Comfort",
  subtitle: "Thirty days with the One who stays close to the broken-hearted.",
  description:
    "Grief is not a failure of faith, and the Father does not ask you to hurry " +
    "through it. He is near to the broken-hearted — not at a safe distance, not " +
    "with a lecture, but close, in the dust, where the loss actually is. The " +
    "pulpit often hands the mourning a tidy answer and a quick exit; the Word " +
    "hands them a Maker who saves their tears in a bottle and swore to wipe " +
    "every one of them away. This is a thirty-day walk through the canon's own " +
    "grief and the comfort underneath it — the covenant comfort that does not " +
    "flinch from real loss, the hope of the first resurrection, and the day " +
    "death itself is swallowed up. You do not have to grieve well to be held. " +
    "You only have to be held.",
  entries: [
    {
      id: "near-to-the-brokenhearted",
      title: "Near to the Broken-hearted",
      subtitle: "He does not watch grief from across the room — He comes close.",
      passageRef: "Psalm 34:18",
      passageText:
        "Yahuah (the LORD) is nigh unto them that are of a broken heart; and " +
        "saveth such as be of a contrite spirit.",
      reflection:
        "Read where He goes. Not toward the strong, not toward the ones who have " +
        "their grief composed and their faces arranged — He goes nigh unto the " +
        "broken-hearted. The systems have taught the mourning that closeness to " +
        "Yahuah (the LORD) is earned, that He draws near to the ones who have " +
        "tidied themselves up first. David, who buried a child and wept in caves, " +
        "tells you the opposite. The breaking is not what pushes Him away; it is " +
        "the very place He comes to. He is not nigh unto the ones who have stopped " +
        "crying. He is nigh unto the ones still crying. The crushed spirit is not " +
        "a sign He has left. It is the address He has come to.",
      invitation:
        "You do not have to pull yourself together before He will come to you. " +
        "That was always a lie of the systems, and it has kept the grieving alone " +
        "in the one season they most needed Him near. He is already close — " +
        "closer in the breaking than in the easy days. Let Him be near. You do " +
        "not have to perform a single thing to deserve it.",
      closing: "He is nearest where it hurts the most.",
    },
    {
      id: "he-binds-up-wounds",
      title: "He Binds Up the Wound",
      subtitle: "The One who numbers the stars also knows the name of your loss.",
      passageRef: "Psalm 147:3",
      passageText:
        "He healeth the broken in heart, and bindeth up their wounds.",
      reflection:
        "Look at the verse that frames it. One line later the same Psalm says He " +
        "\"telleth the number of the stars; he calleth them all by their names\" " +
        "(Psalm 147:4). The hand that named every star also kneels down to bind a " +
        "single broken heart. The world makes the great Elohim (God) too vast for " +
        "small griefs — He has galaxies to run, what is one more sorrow to Him? The " +
        "Word " +
        "refuses the trade. The very greatness that hangs the stars is the " +
        "greatness that stoops to the wound. He does not heal the broken in heart " +
        "from a throne too far away to feel it. He binds the wound the way one " +
        "who loves you would — close, gentle, by hand, taking the time it takes.",
      invitation:
        "Your grief is not too small to matter to Him and not too large to " +
        "overwhelm Him. He who counts the stars has counted your losses, and He " +
        "has not turned the binding of your wound over to anyone else. Let the " +
        "One whose hands hung the heavens be the hands that tend to you. He is " +
        "not too busy. He never was.",
      closing: "The One who names the stars knows the name of your sorrow.",
    },
    {
      id: "blessed-are-they-that-mourn",
      title: "Blessed Are They That Mourn",
      subtitle: "He does not rush you past the mourning — He blesses you inside it.",
      passageRef: "Matthew 5:4",
      passageText:
        "Blessed are they that mourn: for they shall be comforted.",
      reflection:
        "Of all the things Yahusha (Jesus) could have called blessed, He called " +
        "the mourners blessed. Not the ones who have moved on. Not the ones who " +
        "have it together. The mourners — those still in it, still aching, still " +
        "carrying the weight. He does not say blessed are they who grieved and " +
        "got over it. He blesses them in the mourning itself, and then He makes a " +
        "promise that runs to the end of the age: \"they shall be comforted.\" " +
        "The comfort He names is not a quick word that ends the tears today. It " +
        "is the comfort of the One who will dwell with His own and wipe every " +
        "tear away. The mourning is real now. The comfort is coming, and it is " +
        "sure, because the One who promised it cannot lie.",
      invitation:
        "You were never commanded to skip the grief. The King Himself wept at a " +
        "grave. There is a blessing on the ones who mourn — not a rebuke, not a " +
        "deadline, a blessing. Stay where you are with Him; you are not failing. " +
        "And lift your eyes, even a little, to the comfort He swore is coming. " +
        "Both things are true at once, and He holds them both for you.",
      closing: "Blessed in the mourning, and not left there forever.",
    },
    {
      id: "beauty-for-ashes",
      title: "Beauty for Ashes",
      subtitle: "He was anointed for exactly this — to come to the broken-hearted.",
      passageRef: "Isaiah 61:1-3",
      passageText:
        "The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah " +
        "(the LORD) hath anointed me to preach good tidings unto the meek; he " +
        "hath sent me to bind up the broken-hearted, to proclaim liberty to the " +
        "captives, and the opening of the prison to them that are bound; To " +
        "proclaim the acceptable year of Yahuah (the LORD), and the day of " +
        "vengeance of our Elohim (God); to comfort all that mourn; To appoint " +
        "unto them that mourn in Tsion (Zion), to give unto them beauty for " +
        "ashes, the oil of joy for mourning, the garment of praise for the " +
        "spirit of heaviness; that they might be called trees of righteousness, " +
        "the planting of Yahuah (the LORD), that he might be glorified.",
      reflection:
        "When Yahusha (Jesus) stood up in the synagogue and read His own job, this " +
        "is the scroll He opened to. He was sent to bind up the broken-hearted and " +
        "to comfort all that mourn — that was the assignment, named out loud. And " +
        "the comfort He names is not a vague feeling; it is an exchange. Beauty " +
        "for ashes. The oil of joy for mourning. A garment of praise for the " +
        "spirit of heaviness. He does not ask the mourner to manufacture the trade. " +
        "He does the trading. The ashes are real — He does not pretend they are " +
        "not — but they are not the last thing He has for you. He gathers the " +
        "broken and plants them as trees of righteousness, and the planting is " +
        "His doing, not theirs.",
      invitation:
        "You have ashes in your hands, and He sees them. He does not ask you to " +
        "make something beautiful out of them yourself — that is not the gospel, " +
        "and it never was. He came to do the exchange. Hold out the ashes. Let " +
        "Him be the One who gives beauty in their place, in His time, with His " +
        "own hands. He was anointed for exactly this.",
      closing: "Beauty for ashes — and He does the trading.",
    },
    {
      id: "a-man-of-sorrows",
      title: "A Man of Sorrows",
      subtitle: "Your grief is not strange to Him — He carried it Himself.",
      passageRef: "Isaiah 53:3-4",
      passageText:
        "He is despised and rejected of men; a man of sorrows, and acquainted " +
        "with grief: and we hid as it were our faces from him; he was despised, " +
        "and we esteemed him not. Surely he hath borne our griefs, and carried " +
        "our sorrows: yet we did esteem him stricken, smitten of Elohim (God), " +
        "and afflicted.",
      reflection:
        "The prophet did not describe the Messiah as one who floats above human " +
        "pain. He described a man of sorrows, acquainted with grief — and the " +
        "word for acquainted is the word for one who knows something by living it. " +
        "Yahusha (Jesus) does not comfort you from the far side of a grief He has " +
        "never tasted. He tasted it. He bore our griefs and carried our sorrows " +
        "in His own body. When you weep, you are not weeping in front of a " +
        "stranger to weeping. You are weeping in front of the One who knows the " +
        "shape of it from the inside. The comfort He offers is not the cold " +
        "comfort of distance. It is the warm nearness of One who has been where " +
        "you are and came out the other side.",
      invitation:
        "If you have felt that no one could understand what you are carrying, " +
        "hear this: He carried it. Literally, in His flesh, He took up the very " +
        "griefs that crush you. You are not alone in it, and you are not " +
        "incomprehensible to Him. Bring the sorrow to the only One who has truly " +
        "borne it. He will not flinch, because He already has.",
      closing: "A man of sorrows — He knows the weight from the inside.",
    },
    {
      id: "i-am-the-resurrection",
      title: "I Am the Resurrection",
      subtitle: "Standing at a grave, He named Himself the answer to death.",
      passageRef: "John 11:25-26",
      passageText:
        "Yahusha (Jesus) said unto her, I am the resurrection, and the life: he " +
        "that believeth in me, though he were dead, yet shall he live: And " +
        "whosoever liveth and believeth in me shall never die. Believest thou " +
        "this?",
      reflection:
        "Martha had just buried her brother. She believed in a resurrection at " +
        "the last day — a doctrine held at a safe distance from the fresh grave. " +
        "And Yahusha (Jesus) pulled the hope out of the far future and stood it " +
        "right in front of her: I am the resurrection. Not a teaching about it. " +
        "Not a date on a prophetic chart. A Person, standing in her grief, who " +
        "is Himself the answer to the thing she was mourning. The Formed One who " +
        "spoke the stars into being looked a grieving woman in the eye and asked " +
        "her to trust that death does not get the last word — because He holds " +
        "the keys to it. The hope of the first resurrection is not an abstraction " +
        "for the faithful asleep. It is a Person who calls them by name.",
      invitation:
        "The resurrection is not first a doctrine to master; it is a Person to " +
        "trust. He stands in your grief the way He stood in Martha's, and He asks " +
        "you the same question — not to test you, but to steady you. You do not " +
        "have to have it all figured out. You only have to look at the One who " +
        "calls the sleeping awake and let Him hold the future you cannot.",
      closing: "Death does not get the last word — He does.",
    },
    {
      id: "every-tear-wiped-away",
      title: "Every Tear Wiped Away",
      subtitle: "The end of the story is not loss — it is His hand on your face.",
      passageRef: "Revelation 21:4",
      passageText:
        "And Elohim (God) shall wipe away all tears from their eyes; and there " +
        "shall be no more death, neither sorrow, nor crying, neither shall there " +
        "be any more pain: for the former things are passed away.",
      reflection:
        "This is the closing panel toward which the whole story has been moving — " +
        "not a distant heaven that erases the earth, but the Father come down to " +
        "dwell with His gathered people, and the first thing He does is reach for " +
        "their faces. He shall wipe away all tears. Not most. All. And He does " +
        "not send a servant to do it. He does it Himself — the same intimacy of " +
        "the hand that bound the wound now wiping the eyes dry. Death, sorrow, " +
        "crying, pain — the former things — are named and then named gone. This " +
        "is the hope the prophets carried for a scattered, grieving people: that " +
        "the losses were real, but they were not forever, and the One who dwells " +
        "with His own settles every one of them with His own hand.",
      invitation:
        "The tears you are crying now are not unseen and they are not the end of " +
        "the matter. There is a day coming when the Father's own hand reaches up " +
        "and wipes them away for good. You do not have to pretend the grief is " +
        "small to hope in that day. Hold the loss honestly, and hold the promise " +
        "just as honestly. He keeps both, and He keeps you, until the former " +
        "things pass away.",
      closing: "His own hand, your own tears — and no more, forever.",
    },
    {
      id: "not-as-others-without-hope",
      title: "Not As Those Without Hope",
      subtitle: "We grieve — but the grave is sleep, and He knows how to wake His own.",
      passageRef: "1 Thessalonians 4:13-14",
      passageText:
        "But I would not have you to be ignorant, brethren, concerning them " +
        "which are asleep, that ye sorrow not, even as others which have no hope. " +
        "For if we believe that Yahusha (Jesus) died and rose again, even so them " +
        "also which sleep in Yahusha (Jesus) will Elohim (God) bring with him.",
      reflection:
        "Read what Paul does and does not say. He does not say do not sorrow. He " +
        "says do not sorrow as others which have no hope. The grief is permitted " +
        "— it is real, the loss is real — but it is not the grief of those who " +
        "think the grave is the end. Paul calls the faithful dead asleep, and a " +
        "sleeper is not gone; a sleeper can be woken. The first resurrection is " +
        "the waking. Those who sleep in Yahusha (Jesus) will Elohim (God) bring " +
        "with Him — the fathers who walked the covenant faithfully, the loved " +
        "ones who held the Way, gathered up at the trumpet. This is not a denial " +
        "of death's sting. It is the assurance that the sting does not last, " +
        "because the One who rose knows the way out of the grave and goes back " +
        "for His own.",
      invitation:
        "You are allowed to grieve. The gospel never asked you to fake peace over " +
        "a fresh loss. But your grief has a floor under it that the world's grief " +
        "does not — the grave is sleep, and He wakes the sleeping. Let the hope " +
        "of the resurrection hold the bottom of your sorrow so it does not fall " +
        "into despair. He has not lost the ones who sleep in Him.",
      closing: "Asleep, not gone — and He goes back for His own.",
    },
    {
      id: "the-God-of-all-comfort",
      title: "The God of All Comfort",
      subtitle: "He comforts you so that one day you can hand the comfort on.",
      passageRef: "2 Corinthians 1:3-4",
      passageText:
        "Blessed be Elohim (God), even the Father of our Lord Yahusha " +
        "HaMashiach (Lord Jesus Christ), the Father of mercies, and the Elohim " +
        "(God) of all comfort; Who comforteth us in all our tribulation, that we " +
        "may be able to comfort them which are in any trouble, by the comfort " +
        "wherewith we ourselves are comforted of Elohim (God).",
      reflection:
        "Notice the name Paul reaches for in the middle of trouble: the Father of " +
        "mercies, the Elohim (God) of all comfort. Not the Elohim (God) of " +
        "explanations. " +
        "Not the God who demands you understand why. The God of comfort, whose " +
        "comfort meets us in all our tribulation — not after it is over, but " +
        "inside it. And He has a purpose woven into how He does it. The comfort " +
        "He pours into you does not stop with you; it becomes the comfort you " +
        "will one day pour into someone else who walks the road you are walking " +
        "now. Your grief, held by Him, becomes a well others will drink from. He " +
        "wastes nothing — not even this.",
      invitation:
        "You do not have to know what to do with your grief today. You do not " +
        "have to make it useful or find its meaning. That is not your job — it is " +
        "His, and He is the Father of mercies. Simply receive the comfort He is " +
        "offering. Let Him be the Elohim (God) of all comfort to you first. What He " +
        "does " +
        "with it later, through you, is His to arrange, in His time.",
      closing: "He comforts the comfortless — and the comfort travels.",
    },
    {
      id: "through-the-valley",
      title: "Through the Valley",
      subtitle: "Even in the darkest valley, you are not walking alone.",
      passageRef: "Psalm 23:4",
      passageText:
        "Yea, though I walk through the valley of the shadow of death, I will " +
        "fear no evil: for thou art with me; thy rod and thy staff they comfort " +
        "me.",
      reflection:
        "David does not say if I walk through the valley. He says though I walk " +
        "through it — as one who knows the valley is part of the road, not a " +
        "detour off it. And the Psalm's whole comfort hangs on three small words: " +
        "thou art with me. Not thou hast spared me the valley. Not thou hast " +
        "explained the valley. Thou art with me, in it, every step of the " +
        "shadowed way. Yahuah Ra'ah (The LORD is my shepherd) does not call to " +
        "His sheep from the safe end of the dark place. He walks it beside them, " +
        "rod and staff in hand — the rod to guard them, the staff to guide them " +
        "— so that even where the shadow of death falls thickest, the sheep are " +
        "not alone and not unprotected.",
      invitation:
        "You may be in the valley right now, and no one can promise you it will " +
        "be short. But you can be sure of the one thing the valley cannot take: " +
        "He is with you in it. You do not have to find your own way through the " +
        "dark. The Shepherd knows the path, and He is walking it at your side. " +
        "Lean on the One whose rod and staff are already in His hands.",
      closing: "Through the valley — but never through it alone.",
    },
    {
      id: "he-does-not-afflict-willingly",
      title: "He Does Not Afflict Willingly",
      subtitle: "The grief is not His delight — and it is not the end of His mercy.",
      passageRef: "Lamentations 3:31-33",
      passageText:
        "For Adonai (the Lord) will not cast off for ever: But though he cause " +
        "grief, yet will he have compassion according to the multitude of his " +
        "mercies. For he doth not afflict willingly nor grieve the children of " +
        "men.",
      reflection:
        "These lines sit in the middle of the book of Lamentations — the canon's " +
        "rawest grieving, a city in ashes, a people in exile, and a man who will " +
        "not pretend the loss is small. And right there, in the deepest grief in " +
        "scripture, he says it: He doth not afflict willingly. The Father takes " +
        "no pleasure in your pain. He is not the cold author of your sorrow, " +
        "doling out grief because He enjoys it. Even when grief comes, His " +
        "compassion comes with it — according to the multitude of His mercies, " +
        "not the measure of your deserving. And the casting off is not forever. " +
        "Adonai (the Lord) will not cast off for ever is spoken by a man with " +
        "every reason to believe he had been cast off. He chose to trust the " +
        "mercy he could not yet see.",
      invitation:
        "If your grief has whispered that the Father is against you, or that He " +
        "delights in your suffering, hear the man in the ashes: He does not " +
        "afflict willingly. Your pain is not His pleasure. You do not have to " +
        "understand why the loss came to trust that His mercy is not done. Let " +
        "the One who will not cast off for ever hold you in the season that feels " +
        "like forever.",
      closing: "He will not cast off for ever — the mercy outlasts the night.",
    },
    {
      id: "tears-in-his-bottle",
      title: "My Tears in Your Bottle",
      subtitle: "Not one tear has fallen unseen — He keeps the record of your sorrow.",
      passageRef: "Psalm 56:8",
      passageText:
        "Thou tellest my wanderings: put thou my tears into thy bottle: are they " +
        "not in thy book?",
      reflection:
        "David, hunted and afraid, asks Yahuah (the LORD) to keep his tears in a " +
        "bottle — to save them, to hold them, to count them as worth keeping. And " +
        "the question at the end is not really a question: are they not in thy " +
        "book? He already knows the answer. The Father does not let a single tear " +
        "fall to the ground unnoticed. He numbers your wanderings — every " +
        "sleepless turn, every aimless step grief drives you to — and He gathers " +
        "your tears as something precious. The world treats tears as weakness to " +
        "be hidden. Yahuah (the LORD) treats them as treasure to be kept. Your " +
        "crying is not invisible to Him and it is not a bother to Him. He is " +
        "saving every drop.",
      invitation:
        "The tears you have cried alone, in the dark, where no one saw — He saw. " +
        "He has not lost a single one. You do not have to explain or justify your " +
        "weeping to the One who keeps it in a bottle and writes it in His book. " +
        "Cry before Him freely. Nothing you grieve is wasted on Him, and nothing " +
        "you weep is forgotten by Him.",
      closing: "Every tear, kept — none of them wasted on Him.",
    },
    {
      id: "death-swallowed-up",
      title: "Death Swallowed Up",
      subtitle: "The thing that takes everything will itself be taken away.",
      passageRef: "Isaiah 25:8",
      passageText:
        "He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) " +
        "will wipe away tears from off all faces; and the rebuke of his people " +
        "shall he take away from off all the earth: for Yahuah (the LORD) hath " +
        "spoken it.",
      reflection:
        "Death is the great swallower — it takes loved ones, takes years, takes " +
        "the future you had planned, and gives nothing back. And the prophet " +
        "promises a day when death itself is swallowed up. The devourer devoured. " +
        "The thing that takes everything finally taken away. And again the " +
        "Father's own hand appears: Adonai Yahuah (the Lord GOD) will wipe away " +
        "tears from off all faces. This is not Isaiah's wishful thinking; the " +
        "verse closes the way the covenant promises always close — for Yahuah " +
        "(the LORD) hath spoken it. He staked His own word on it. The same " +
        "promise echoes forward into the new heaven and the new earth, the same " +
        "tear-wiping hand at the end of the same story. Death's appetite is not " +
        "endless. His mercy is.",
      invitation:
        "However much death has taken from you, it is not the final power in this " +
        "story, and it will not have the last meal. There is a day when it is " +
        "swallowed up and your tears are wiped away by the Father Himself. You do " +
        "not have to make peace with death as if it were forever. It is not. Rest " +
        "the weight of your loss on the word the Father Himself has spoken.",
      closing: "Death swallowed up — because He hath spoken it.",
    },
    {
      id: "yahusha-wept",
      title: "Yahusha Wept",
      subtitle: "He knew He would raise him — and He wept at the grave anyway.",
      passageRef: "John 11:33-35",
      passageText:
        "When Yahusha (Jesus) therefore saw her weeping, and the Yahudim (Jews) " +
        "also weeping which came with her, he groaned in the spirit, and was " +
        "troubled, And said, Where have ye laid him? They said unto him, Lord, " +
        "come and see. Yahusha (Jesus) wept.",
      reflection:
        "He was minutes from calling Lazarus out of the tomb. He knew the grave " +
        "would not hold. And still — at the sight of the mourners, at the weight " +
        "of the loss, at the grave of a friend — Yahusha (Jesus) wept. The " +
        "shortest verse in scripture is the deepest comfort the grieving will " +
        "ever find. The One who is the resurrection and the life did not stand " +
        "over the mourners and tell them to stop crying because the ending would " +
        "be good. He entered the grief with them. He groaned. He was troubled. He " +
        "wept. Heaven's coming joy did not make the present loss unworthy of " +
        "tears, and it does not make yours unworthy either. The Master of life " +
        "Himself cried at a grave He was about to open.",
      invitation:
        "No one will ever tell you your tears are out of place after they have " +
        "watched Yahusha (Jesus) weep at a grave He was about to empty. You do " +
        "not have to choose between hope and grief — He held both, fully, at " +
        "once. Come and see, the mourners told Him, and He came, and He wept. " +
        "Bring Him to the place of your loss. He will not tell you to stop " +
        "crying. He weeps with His own.",
      closing: "He wept at the grave — even knowing the stone would roll.",
    },
    {
      id: "weeping-and-the-morning",
      title: "Weeping, and the Morning",
      subtitle: "The night is real — and it is a night, not a forever.",
      passageRef: "Psalm 30:5",
      passageText:
        "For his anger endureth but a moment; in his favour is life: weeping may " +
        "endure for a night, but joy cometh in the morning.",
      reflection:
        "David does not say the weeping is fake or that the night is short. He " +
        "knows what it is to weep through a whole long dark. What he names is the " +
        "shape of it: weeping endures for a night — and a night, however long, " +
        "is bounded. It has an end the morning is already moving toward. Grief " +
        "feels endless in the middle of it, as though the dark is all there is " +
        "and all there ever will be. The Psalm does not scold that feeling. It " +
        "simply tells the truth the dark hides: the morning is coming. Joy comes " +
        "with it — not because the loss was nothing, but because the favor of " +
        "Yahuah (the LORD) is life, and His favor outlasts the night by an " +
        "eternity. The weeping is for a night. The favor is for life.",
      invitation:
        "If you are in the long night now, you do not have to manufacture the " +
        "morning or rush yourself toward it. The night is real, and you are " +
        "allowed to weep all the way through it. But it is a night — and the One " +
        "whose favor is life has set a morning at the end of it that you cannot " +
        "yet see. Let Him hold the dawn for you until it comes.",
      closing: "Weeping for a night — His favor for a lifetime.",
    },
    {
      id: "the-lamb-the-shepherd",
      title: "The Lamb Become the Shepherd",
      subtitle: "The One who was slain leads the gathered to living water, and dries their eyes.",
      passageRef: "Revelation 7:17",
      passageText:
        "For the Lamb which is in the midst of the throne shall feed them, and " +
        "shall lead them unto living fountains of waters: and Elohim (God) shall " +
        "wipe away all tears from their eyes.",
      reflection:
        "Here is one of the deepest mercies in the whole book: the Lamb has " +
        "become the Shepherd. The One who was slain now stands in the midst of " +
        "the throne and tends His gathered ones, leading them to living " +
        "fountains of waters — the very thing a parched and grieving soul most " +
        "needs. This is the gathered remnant, brought home out of every nation, " +
        "and what is the first comfort named over them? Elohim (God) shall wipe " +
        "away all tears from their eyes. The promise of the tear-wiping hand " +
        "appears again, because the Father keeps repeating it — at the throne, " +
        "in the new heaven, in the prophets — so that no grieving heart can miss " +
        "it. The Lamb who knew suffering leads the suffering to water and the " +
        "Father dries their faces.",
      invitation:
        "The thirst grief leaves behind is real, and you cannot quench it " +
        "yourself. But the Lamb who was slain leads His own to living water, and " +
        "the Father wipes the tears as they come to drink. You do not have to " +
        "find the fountain on your own. Let the Shepherd who was once the Lamb " +
        "lead you to it, and let the Father's hand do what only His hand can do.",
      closing: "The Lamb leads, and the Father wipes the eyes dry.",
    },
    {
      id: "the-righteous-taken-in-peace",
      title: "Taken Away from the Evil",
      subtitle: "Sometimes the gathering home is itself a mercy we cannot yet see.",
      passageRef: "Isaiah 57:1-2",
      passageText:
        "The righteous perisheth, and no man layeth it to heart: and merciful " +
        "men are taken away, none considering that the righteous is taken away " +
        "from the evil to come. He shall enter into peace: they shall rest in " +
        "their beds, each one walking in his uprightness.",
      reflection:
        "The prophet names a grief the world rushes past — the righteous " +
        "perishes, and no one lays it to heart. He will not let it go " +
        "unconsidered. But he sets beside the loss a mercy the mourners cannot " +
        "yet see: the righteous is taken away from the evil to come, and he " +
        "enters into peace and rest. This is not a tidy excuse for death and it " +
        "does not make the absence hurt less. It is the assurance that the one " +
        "who walked uprightly is not lost in some terror — he has entered peace, " +
        "he rests in his bed, the storm cannot reach him now. For the faithful " +
        "asleep, the grave is rest, and the rest is held by the same Father who " +
        "swore to wake them. The loss is yours. The peace is theirs. Both are " +
        "real.",
      invitation:
        "If you grieve someone who walked in uprightness, you carry the absence " +
        "and that is heavy. But hear the comfort the prophet would not leave " +
        "unsaid: they have entered into peace. They are not in distress; they " +
        "rest. You do not have to fear for where they are. Let the Father who " +
        "gave them rest hold you in the ache of missing them, and trust the " +
        "waking He has promised.",
      closing: "He has entered into peace — and the Father keeps his rest.",
    },
    {
      id: "come-unto-me",
      title: "Come Unto Me",
      subtitle: "He does not add to the weight — He invites you to lay it down.",
      passageRef: "Matthew 11:28-29",
      passageText:
        "Come unto me, all ye that labour and are heavy laden, and I will give " +
        "you rest. Take my yoke upon you, and learn of me; for I am meek and " +
        "lowly in heart: and ye shall find rest unto your souls.",
      reflection:
        "Grief is a labor no one volunteers for and a load no one can set down " +
        "by willing it. And to exactly that — the heavy laden, the worn out, the " +
        "ones carrying what cannot be carried — Yahusha (Jesus) says come. Not " +
        "come when you have pulled yourself together. Not come when the grief is " +
        "manageable. Come now, as you are, heavy laden. He describes Himself to " +
        "the weary not as demanding but as meek and lowly in heart — gentle with " +
        "the broken, easy on the worn. The rest He gives is not a program to " +
        "perform. It is rest unto the soul, the deep rest of one who has finally " +
        "found a place to lay the weight and a heart safe enough to lay it in " +
        "front of.",
      invitation:
        "You do not have to carry this alone, and you do not have to carry it " +
        "well. The invitation is simply come — heavy laden, exhausted, exactly as " +
        "the grief has left you. The One who calls is gentle and lowly, not harsh " +
        "and not impatient. Lay the weight down in front of Him. Rest unto your " +
        "soul is what He offers, and it is His to give.",
      closing: "Come heavy laden — He is gentle, and the rest is real.",
    },
    {
      id: "precious-in-his-sight",
      title: "Precious in His Sight",
      subtitle: "The death of His faithful ones is not cheap to Him — it is precious.",
      passageRef: "Psalm 116:15",
      passageText:
        "Precious in the sight of Yahuah (the LORD) is the death of his saints.",
      reflection:
        "The world treats death as a statistic, a loss to be processed and moved " +
        "past. The Word says something startling: precious in the sight of Yahuah " +
        "(the LORD) is the death of His saints. Precious — costly, treasured, " +
        "weighed as something of great worth. The Father does not glance at the " +
        "passing of His faithful ones and look away. He marks it. He holds it. He " +
        "counts it precious, the way you count precious the things you would " +
        "never want to lose. This does not romanticize death or pretend it is " +
        "good — death is the enemy that will itself be swallowed up. It means the " +
        "one you grieve was not an afterthought to Him at the end. Their passing " +
        "was held in the sight of the One who gathers His own and forgets none " +
        "of them.",
      invitation:
        "The one you have lost was not lost in a crowd, not overlooked, not cheap " +
        "in the eyes of the Father. Their death was precious in His sight — held, " +
        "marked, treasured. You do not have to fear that they slipped away " +
        "unnoticed by the One who matters most. Let the Father who counts their " +
        "passing precious also hold the grief of the ones left behind. He misses " +
        "none of His own.",
      closing: "Precious in His sight — He forgets none of His own.",
    },
    {
      id: "come-let-us-return",
      title: "He Will Bind, and He Will Raise",
      subtitle: "The same hand that lets the wound fall is the hand that heals it.",
      passageRef: "Hosea 6:1-2",
      passageText:
        "Come, and let us return unto Yahuah (the LORD): for he hath torn, and " +
        "he will heal us; he hath smitten, and he will bind us up. After two " +
        "days will he revive us: in the third day he will raise us up, and we " +
        "shall live in his sight.",
      reflection:
        "Hosea calls a wounded people back to the One they fear has wounded them " +
        "— and he does it with a confidence that startles. He hath torn, and He " +
        "will heal. He hath smitten, and He will bind us up. The same hand. Not " +
        "one Elohim (God) who hurts and a different one who heals, but the one " +
        "Father " +
        "whose tearing was never the end of His intention and whose healing was " +
        "always coming behind it. And then the resurrection note sounds early, " +
        "centuries before the empty tomb: in the third day He will raise us up, " +
        "and we shall live in His sight. The prophet read the pattern of the " +
        "Father into the very shape of His mercy — that He revives, He raises, He " +
        "brings the torn back to life in His presence. The healing is as sure as " +
        "the wound was real.",
      invitation:
        "Returning to the Father in your grief does not mean pretending the wound " +
        "did not happen. It means bringing the torn places to the only One who " +
        "can bind them. He will heal. He will raise. He has shown the pattern " +
        "from of old. You do not have to stay away in fear that He is only the " +
        "Elohim (God) who tears. Come, and let the One who binds up do what He has " +
        "promised.",
      closing: "He tears and He heals — and the third day belongs to Him.",
    },
    {
      id: "my-redeemer-lives",
      title: "My Redeemer Lives",
      subtitle: "From the depth of loss, a grieving man stakes everything on the resurrection.",
      passageRef: "Job 19:25-26",
      passageText:
        "For I know that my redeemer liveth, and that he shall stand at the " +
        "latter day upon the earth: And though after my skin worms destroy this " +
        "body, yet in my flesh shall I see Elohim (God).",
      reflection:
        "Job had lost everything — his children, his wealth, his health, the " +
        "comfort of his friends. There is no grief in scripture rawer than his. " +
        "And out of the bottom of it comes one of the strongest confessions of " +
        "the resurrection hope ever spoken: I know that my redeemer liveth. Not " +
        "I hope. I know. He looks past the worms and the grave and says he will " +
        "stand at the latter day upon the earth, and in his own flesh he will see " +
        "Elohim (God). This is the hope of the first resurrection spoken by a man " +
        "who had every reason to give up — that the Redeemer lives, that He will " +
        "stand on the earth, and that the faithful will rise in flesh to see Him. " +
        "Job did not have the answers to his suffering. He had something better: " +
        "he had the One who lives.",
      invitation:
        "You may not have the answers either. Job never got them, and he was the " +
        "one who suffered most. But you can have what he had — the certainty that " +
        "the Redeemer lives, that He will stand on the earth, that the grave is " +
        "not the end of those who are His. You do not have to understand the loss " +
        "to lean your whole weight on the One who will raise you. He liveth, and " +
        "because He liveth, so shall His own.",
      closing: "My Redeemer liveth — and in my flesh I shall see Him.",
    },
    {
      id: "i-shall-go-to-him",
      title: "I Shall Go to Him",
      subtitle: "A father who buried a child finds the comfort of a reunion that is sure.",
      passageRef: "2 Samuel 12:22-23",
      passageText:
        "And he said, While the child was yet alive, I fasted and wept: for I " +
        "said, Who can tell whether Elohim (God) will be gracious to me, that " +
        "the child may live? But now he is dead, wherefore should I fast? can I " +
        "bring him back again? I shall go to him, but he shall not return to me.",
      reflection:
        "David had wept and fasted and pleaded while his child was dying. When " +
        "the child died, his servants feared to tell him. And David rose, and " +
        "washed, and worshipped — not because the grief was gone, but because his " +
        "hope had a destination. I shall go to him, but he shall not return to " +
        "me. He does not say the child is simply gone into nothing. He says I " +
        "shall go to him — a reunion, a going-toward, a meeting still ahead. The " +
        "grief of a parent burying a child is among the heaviest a human bears, " +
        "and David carried it. But underneath the carrying was the assurance of " +
        "the gathered ones — that those who sleep in the covenant are not lost " +
        "into the void, and the faithful go to them, and the Father keeps them " +
        "all until the waking.",
      invitation:
        "If you have buried someone you cannot imagine living without, hear " +
        "David: I shall go to him. The separation is real and it is not forever. " +
        "The ones who sleep in the covenant are kept by the Father who wakes His " +
        "own. You do not have to pretend the going-on is easy. Carry the grief, " +
        "and carry the hope of the reunion beside it. He keeps both, and He keeps " +
        "the one you long to see.",
      closing: "I shall go to him — the parting is real, and it is not the end.",
    },
    {
      id: "can-a-woman-forget",
      title: "Can a Mother Forget",
      subtitle: "Even if every comfort fails you, His will not — it is graven on His hands.",
      passageRef: "Isaiah 49:13-15",
      passageText:
        "Sing, O heavens; and be joyful, O earth; and break forth into singing, " +
        "O mountains: for Yahuah (the LORD) hath comforted his people, and will " +
        "have mercy upon his afflicted. But Tsion (Zion) said, Yahuah (the LORD) " +
        "hath forsaken me, and my Adonai (Lord) hath forgotten me. Can a woman " +
        "forget her sucking child, that she should not have compassion on the " +
        "son of her womb? yea, they may forget, yet will I not forget thee.",
      reflection:
        "Tsion (Zion) speaks the very words grief speaks: Yahuah (the LORD) has forsaken " +
        "me, my Lord has forgotten me. The Father does not scold the feeling. He " +
        "answers it. He reaches for the strongest human bond He can name — a " +
        "nursing mother and the child at her breast — and asks, can she forget? " +
        "And then He says even that bond, the surest love a human knows, may " +
        "fail; yet will I not forget thee. His memory of His own is stronger than " +
        "a mother's for her infant. The next verse says He has graven you on the " +
        "palms of His hands. The grief that whispers you are forgotten is " +
        "answered by the One who carved you into His own hands and cannot look at " +
        "them without seeing you.",
      invitation:
        "If grief has told you the Father has forgotten you, you are in good " +
        "company — Tsion (Zion) said the same. And His answer to you is the same. " +
        "He has not forgotten. He cannot. You are graven on His hands. You do not " +
        "have to feel remembered to be remembered. Rest on the One whose memory " +
        "of His own outlasts even a mother's love, and let Him comfort the " +
        "afflicted, as He swore He would.",
      closing: "Even a mother might forget — He will not forget you.",
    },
    {
      id: "have-mercy-i-am-in-trouble",
      title: "Have Mercy — I Am in Trouble",
      subtitle: "Grief that wears out the body has a place to be poured out, not hidden.",
      passageRef: "Psalm 31:9-10",
      passageText:
        "Have mercy upon me, O Yahuah (LORD), for I am in trouble: mine eye is " +
        "consumed with grief, yea, my soul and my belly. For my life is spent " +
        "with grief, and my years with sighing: my strength faileth because of " +
        "mine iniquity, and my bones consume.",
      reflection:
        "The Psalms do not clean grief up before bringing it to Yahuah (the " +
        "LORD). Here is the body breaking under it — the eye consumed, the soul " +
        "and the belly worn, the strength failing, the bones wasting. This is " +
        "what grief actually does, and the Word does not hide it or shame it. It " +
        "hands it to the Father raw: have mercy upon me, for I am in trouble. " +
        "There is no performance here, no pretending the grief is lighter than " +
        "it is, no rushing to the comfort before the lament is spoken. The Father " +
        "made a place in His own songbook for grief this heavy precisely so His " +
        "people would know they can bring it all — the consumed eye, the failing " +
        "strength, the wasting bones — and not be turned away. The same Psalm " +
        "ends in trust. But it gets there by telling the truth first.",
      invitation:
        "You do not have to tidy your grief before you bring it to Him. The " +
        "Father wrote prayers for the days the body itself is breaking under the " +
        "weight, so you would know there is no part of this too raw to say to " +
        "Him. Pour it out exactly as it is — have mercy, I am in trouble. He is " +
        "not waiting for a cleaner version. He is waiting for you.",
      closing: "Bring it raw — He made room in His own songbook for grief this heavy.",
    },
    {
      id: "they-that-sleep-shall-awake",
      title: "They That Sleep Shall Awake",
      subtitle: "The dust is not the end — the faithful asleep will shine like the stars.",
      passageRef: "Daniel 12:2-3",
      passageText:
        "And many of them that sleep in the dust of the earth shall awake, some " +
        "to everlasting life, and some to shame and everlasting contempt. And " +
        "they that be wise shall shine as the brightness of the firmament; and " +
        "they that turn many to righteousness as the stars for ever and ever.",
      reflection:
        "Daniel is given a sight that grief alone cannot reach: those who sleep " +
        "in the dust of the earth shall awake. The grave is named for what it is " +
        "to the faithful — sleep, not annihilation — and a waking is promised " +
        "that no spade can dig and no death can cancel. This is the first " +
        "resurrection seen from the prophet's vantage, the worthy of the seed " +
        "raised to everlasting life. And the image he is given for them is " +
        "tender: they shall shine as the brightness of the firmament, as the " +
        "stars for ever and ever. The ones the world buried in the dust are not " +
        "ending in dust. They are appointed to rise and shine. The dust is a bed, " +
        "not a grave-pit with no door. The Father who set the stars has set a " +
        "waking for His sleeping ones.",
      invitation:
        "The dust where your loved one was laid is not the last chapter for the " +
        "faithful. They sleep, and there is a waking — a rising to everlasting " +
        "life, a shining like the stars. You do not have to look at the grave as " +
        "though it were a door that does not open. The Father who hung the stars " +
        "has promised to wake His sleeping ones. Let that promise hold you at the " +
        "graveside.",
      closing: "Asleep in the dust — appointed to wake and shine.",
    },
    {
      id: "death-where-is-thy-sting",
      title: "Where Is Thy Sting",
      subtitle: "The victory is not denial of death — it is death undone.",
      passageRef: "1 Corinthians 15:54-55",
      passageText:
        "So when this corruptible shall have put on incorruption, and this " +
        "mortal shall have put on immortality, then shall be brought to pass the " +
        "saying that is written, Death is swallowed up in victory. O death, " +
        "where is thy sting? O grave, where is thy victory?",
      reflection:
        "Paul reaches all the way back to Isaiah and Hosea and pulls their old " +
        "promises into one shout: death is swallowed up in victory. He is not " +
        "saying death does not sting now — he felt its sting, the whole grieving " +
        "world feels it. He is saying the sting is not the final word, because " +
        "the corruptible will put on incorruption and the mortal will put on " +
        "immortality at the rising. The taunt at the end — O death, where is thy " +
        "sting? — is not spoken from a life that has never grieved. It is the " +
        "voice of the resurrection hope spoken into the teeth of the grave, the " +
        "confidence that the One who rose first will raise His own, and the thing " +
        "that takes everything will one day have nothing left to take. The " +
        "victory does not pretend death away. It undoes it.",
      invitation:
        "You feel death's sting right now, and that is honest — Paul felt it too. " +
        "But the sting is not the end of the story for those who are His. The " +
        "rising is coming, and when it comes, death will have lost its grip for " +
        "good. You do not have to deny the pain to hope in the victory. Hold the " +
        "sting and the hope together, and let the One who rose first carry you " +
        "toward the day death is undone.",
      closing: "Death swallowed up — and the grave has nothing left to keep.",
    },
    {
      id: "i-will-open-your-graves",
      title: "I Will Open Your Graves",
      subtitle: "To a people who said their hope was lost, He swore to open the graves.",
      passageRef: "Ezekiel 37:12-14",
      passageText:
        "Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the " +
        "Lord GOD); Behold, O my people, I will open your graves, and cause you " +
        "to come up out of your graves, and bring you into the land of " +
        "Yashar'el (Israel). And ye shall know that I am Yahuah (the LORD), when " +
        "I have opened your graves, O my people, and brought you up out of your " +
        "graves, And shall put my spirit in you, and ye shall live, and I shall " +
        "place you in your own land: then shall ye know that I am Yahuah (the " +
        "LORD), saith Yahuah (the LORD).",
      reflection:
        "The vision came to a people who had said the deepest grief of all: our " +
        "bones are dried, our hope is lost, we are cut off. A scattered, " +
        "exiled, grieving house of Yashar'el (Israel) who believed they were as " +
        "good as dead. And the Father answered the grief that had given up: I " +
        "will open your graves. The valley of dry bones is the promise of the " +
        "regathering and the resurrection braided together — the scattered seed " +
        "of all the tribes brought up out of the grave of exile and the grave of " +
        "death alike, His Spirit put in them, set in their own land. To the ones " +
        "who said our hope is lost, He did not argue. He swore to open the very " +
        "graves they feared. The One who gathers the scattered is the One who " +
        "raises the dead, and He loses none of His own to either grave.",
      invitation:
        "If your grief has reached the place that says my hope is lost — the " +
        "place the dry bones spoke from — you have not gone anywhere the Father " +
        "cannot reach. He answers that exact despair with a promise to open the " +
        "graves. You do not have to revive your own hope. Let the One who raises " +
        "the dead and gathers the scattered breathe His Spirit into the bones " +
        "that feel dried out, and trust the waking He has sworn.",
      closing: "I will open your graves — spoken to the ones who said hope was lost.",
    },
    {
      id: "he-hath-heard-my-weeping",
      title: "He Hath Heard My Weeping",
      subtitle: "The tears that soak the night do not fall on a Father who is not listening.",
      passageRef: "Psalm 6:6-9",
      passageText:
        "I am weary with my groaning; all the night make I my bed to swim; I " +
        "water my couch with my tears. Mine eye is consumed because of grief; it " +
        "waxeth old because of all mine enemies. Depart from me, all ye workers " +
        "of iniquity; for Yahuah (the LORD) hath heard the voice of my weeping. " +
        "Yahuah (the LORD) hath heard my supplication; Yahuah (the LORD) will " +
        "receive my prayer.",
      reflection:
        "David does not describe a single quiet tear. He describes the kind of " +
        "grief that floods a bed all the night long — weary with groaning, the " +
        "eye consumed, the body worn old before its time. This is grief that " +
        "does not lift at dawn. And in the middle of it, the Psalm turns on one " +
        "certainty that changes nothing about the loss and everything about the " +
        "loneliness of it: Yahuah (the LORD) hath heard the voice of my weeping. " +
        "Not the voice of his polished prayer — the voice of his weeping. The " +
        "tears themselves were heard, as though they were words. The Father does " +
        "not wait for the grieving to compose a proper prayer before He listens. " +
        "He hears the crying. The weeping that soaks the long night does not fall " +
        "into an empty room. It falls before a Father who counts it as speech and " +
        "bends down to hear.",
      invitation:
        "If your nights are the hardest part — if the tears come when the house " +
        "is quiet and there are no words for any of it — know that the weeping " +
        "itself is heard. You do not have to find the right prayer. Yahuah (the " +
        "LORD) hears the voice of your weeping the way He heard David's. Cry " +
        "before Him through the long night. He is listening to every sound of it, " +
        "and He will receive it as prayer.",
      closing: "He hath heard the voice of your weeping — it was never unheard.",
    },
    {
      id: "the-eternal-arms",
      title: "The Everlasting Arms",
      subtitle: "When you cannot hold yourself up, something underneath you holds.",
      passageRef: "Deuteronomy 33:27",
      passageText:
        "The eternal Elohim (God) is thy refuge, and underneath are the " +
        "everlasting arms: and he shall thrust out the enemy from before thee; " +
        "and shall say, Destroy them.",
      reflection:
        "Grief has a way of taking the floor out from under a person. The legs " +
        "give. The strength that held you up is simply gone, and there is " +
        "nothing left to stand on. Mosheh's (Moses's) blessing names the one " +
        "thing the grieving most need to hear: underneath are the everlasting " +
        "arms. When you cannot hold yourself up — when there is no strength left " +
        "to summon and no ground left to stand on — there is something beneath " +
        "you that does not give way. The eternal Elohim (God) is the refuge, and " +
        "His arms are the floor that holds when your own footing fails. You do " +
        "not have to keep yourself from falling. He is underneath. The arms that " +
        "hold the world hold you in the place where you cannot hold yourself.",
      invitation:
        "If you feel like you are falling and there is nothing to catch you, " +
        "hear the oldest blessing: underneath are the everlasting arms. You do " +
        "not have to be strong enough to stand right now. The arms beneath you " +
        "are eternal, and they do not tire and do not give way. Let yourself " +
        "rest your weight on the One who is already holding you up. You will not " +
        "fall through the everlasting arms.",
      closing: "Underneath are the everlasting arms — they will not give way.",
    },
    {
      id: "a-living-hope",
      title: "Begotten Unto a Living Hope",
      subtitle: "An inheritance kept for you that grief and death cannot reach.",
      passageRef: "1 Peter 1:3-4",
      passageText:
        "Blessed be the Elohim (God) and Father of our Lord Yahusha HaMashiach " +
        "(Lord Jesus Christ), which according to his abundant mercy hath " +
        "begotten us again unto a lively hope by the resurrection of Yahusha " +
        "HaMashiach (Jesus Christ) from the dead, To an inheritance " +
        "incorruptible, and undefiled, and that fadeth not away, reserved in " +
        "heaven for you.",
      reflection:
        "Kefa writes to scattered, suffering people and gives them a name for " +
        "what carries them: a living hope. Not a wish, not a brave face over the " +
        "loss, but a hope that is alive — alive because it rests on the " +
        "resurrection of Yahusha HaMashiach (Jesus Christ), an event that " +
        "already happened in history and cannot be undone. And the inheritance " +
        "this hope reaches toward is described by what cannot touch it: " +
        "incorruptible, where decay reaches everything else; undefiled, where " +
        "everything else is spoiled; that fadeth not away, where everything else " +
        "fades; reserved, kept, set aside with your name on it. Grief teaches " +
        "the hard way that everything here can be lost. The living hope answers " +
        "with an inheritance that the grave cannot corrupt and death cannot take " +
        "— held in safekeeping for the very ones who have lost so much.",
      invitation:
        "Everything grief touches can be lost — you have learned that the hard " +
        "way. But there is an inheritance that cannot fade, cannot be defiled, " +
        "cannot be taken, and it is reserved with your name on it by the One who " +
        "raised Yahusha (Jesus) from the dead. You do not have to keep it safe " +
        "yourself; it is kept for you. Let the living hope carry you through the " +
        "season where so much has been lost, toward the one thing that never " +
        "can be.",
      closing: "A living hope, an inheritance kept — where loss cannot reach.",
    },
  ],
};

export const THEMES: DevotionalTheme[] = [
  APPOINTED_TIMES,
  PEACE_FOR_THE_ANXIOUS,
  WHEN_YOURE_AFRAID,
  HOPE_AND_ENDURANCE,
  GRIEF_AND_COMFORT,
];

// ───────────────────────────────────────────────────────────────────────
// Daily prayers of the remnant
// ───────────────────────────────────────────────────────────────────────

export const PRAYERS: DailyPrayer[] = [
  {
    id: "morning",
    title: "When I Open My Eyes",
    subtitle: "A morning prayer — new mercy for a new day.",
    scriptureAnchor: "Lamentations 3:22-23",
    body:
      "Father, before I have done anything to deserve it, You have given me another " +
      "morning. Your mercies are new — \"they are new every morning: great is thy " +
      "faithfulness\" (Lamentations 3:23). I do not begin this day by earning Your " +
      "favor; I begin it already held. Open my eyes to see what is true and my ears " +
      "to know Your voice when You speak. Where I have inherited lies, gently unteach " +
      "me. Where I have been afraid to come home, take the fear away. Let me walk " +
      "today as one who is already Yours, because I am. In the name of Yahusha " +
      "(Jesus). Amein.",
  },
  {
    id: "gathering",
    title: "For the Scattered to Be Gathered",
    subtitle: "A prayer for the lost sheep of the house of Yashar'el (Israel).",
    scriptureAnchor: "Jeremiah 31:10",
    body:
      "Yahuah (LORD), You said it and You cannot lie: \"He that scattered " +
      "Yashar'el (Israel) will gather him, and keep him, as a shepherd doth his " +
      "flock\" (Jeremiah 31:10). Across every nation Your sheep are waking — sons and " +
      "daughters of the tribes the world wrote off as gone, stirring at the sound of " +
      "Your Name. Gather them, Father. Blow the trumpet over the scattered seed and " +
      "bring them home to the covenant they forgot. I do not know them by sight; You " +
      "do. Send the word that wakes them, and let me be a voice that carries it where " +
      "You send me. Bring the whole flock home. Amein.",
  },
  {
    id: "the-name",
    title: "Thanksgiving for the Name",
    subtitle: "A prayer over the Name the systems hid.",
    scriptureAnchor: "Psalm 113:3",
    body:
      "Yahuah (LORD), \"from the rising of the sun unto the going down of the same " +
      "thy name is to be praised\" (Psalm 113:3). For generations Your Name was " +
      "covered over, traded for a title, kept from the very people who longed to call " +
      "on it. Thank You for giving it back. Thank You that I can speak it — Yahuah — " +
      "and know the One who formed the heavens and came in the flesh to redeem me as " +
      "Yahusha (Jesus). Let me carry Your Name with reverence and never with " +
      "carelessness. Let it be honored on my lips and in my house, from this sunrise " +
      "to its setting. Amein.",
  },
  {
    id: "eyes-to-see",
    title: "Show Me What Is True",
    subtitle: "A prayer to be shown the inherited lie.",
    scriptureAnchor: "Jeremiah 16:19",
    body:
      "Father, Jeremiah said of the nations, \"surely our fathers have inherited " +
      "lies, vanity, and things wherein there is no profit\" (Jeremiah 16:19) — and " +
      "I know that includes the things handed to me in good faith. I do not want a " +
      "comfortable lie over a costly truth. Where a system taught me to read Your " +
      "Word against itself, show me. Where I have called bondage what You called " +
      "freedom, or freedom what You called bondage, correct me. Be patient with me as " +
      "You take the veil off, one layer at a time. I would rather see clearly with " +
      "You than stay blind in good company. Open my eyes. Amein.",
  },
  {
    id: "sabbath-eve",
    title: "As the Sun Goes Down",
    subtitle: "A prayer at the edge of the seventh day.",
    scriptureAnchor: "Hebrews 4:9-10",
    body:
      "Father, the light is fading and the day You blessed is opening. \"There " +
      "remaineth therefore a rest to the people of Elohim (God). For he that is " +
      "entered into his rest, he also hath ceased from his own works\" (Hebrews " +
      "4:9-10). I lay down my striving at the door of this day. I have nothing to " +
      "prove to You and nothing to earn — You finished it before the foundation of " +
      "the world. Quiet my hands and my heart. Let this rest be communion and not " +
      "mere idleness, Your presence and not just the absence of labor. Meet me in the " +
      "stillness of the day You set apart. Amein.",
  },
  {
    id: "return",
    title: "Take Me the Rest of the Way Home",
    subtitle: "A prayer of return — grace as the road back.",
    scriptureAnchor: "Hosea 14:1-2",
    body:
      "Father, Hosea calls to a scattered people, \"O Yashar'el (Israel), return " +
      "unto Yahuah (the LORD) thy God\" (Hosea 14:1). So I return. Not to buy back " +
      "Your love — You never withdrew it — but because Your grace is the road that " +
      "leads home, and I want to walk all of it. Where I have wandered off the Way, " +
      "turn me around. Where I have made peace with what You hate, unsettle me. I am " +
      "not afraid of Your commandments anymore; I see now they are the shape of life " +
      "with You. Lead me the rest of the way back, and hold me there. Amein.",
  },
  {
    id: "proclamation",
    title: "Send Me to the Sheep",
    subtitle: "A prayer for the proclamation and those still scattered.",
    scriptureAnchor: "John 10:27",
    body:
      "Yahusha (Jesus), You said, \"My sheep hear my voice, and I know them, and " +
      "they follow me\" (John 10:27). The field is wide and the laborers are few. " +
      "Make me one of them. I cannot pick Your sheep out of the crowd, so let me " +
      "proclaim the truth plainly wherever You send me and trust You to do the " +
      "waking. Where they hear and turn, let me welcome them as family. Where they " +
      "will not, give me the grace to shake the dust and move on without bitterness, " +
      "leaving them to Your mercy. Let me never attack the deceived — only ever " +
      "dismantle the deception. Send me. Amein.",
  },
];
