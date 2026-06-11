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

export const THEMES: DevotionalTheme[] = [APPOINTED_TIMES];

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
