/**
 * The Gospel of the Kingdom — the FREE synopsis only (S421, second teaching).
 *
 * This teaching is server-gated: its `tier_required` is the paid top tier
 * ("everything"), so the FULL BODY must NEVER ship in the client bundle. Only
 * the free synopsis lives here — it is the free-for-all hook shown to everyone,
 * exactly like Seed of Promise's synopsis. The body is served from the
 * server-gated DB endpoint GET /v1/teachings/{slug}/body (see api.ts
 * getTeachingBody + api/main.py), fetched only after the server confirms
 * entitlement. Do NOT add the body here.
 *
 * Verbatim from Teaching Corpus/concepts/kingdom-gospel/SYNOPSIS_kingdom-gospel.md,
 * stored as a raw template literal so the markdown (headings, *italic* /
 * **bold**, and the sacred-name parentheticals) reaches the teaching renderer
 * exactly as authored.
 */

export const KINGDOM_GOSPEL_SYNOPSIS = String.raw`# The Gospel of the Kingdom

*A free teaching — the Word in arranged order.*

There is one gospel. Paul was so certain of it that he laid a curse on any other — *though we, or an angel from heaven, preach any other gospel unto you… let him be accursed.* So the only question that matters is this: what was the gospel he was guarding?

It was the gospel of *the kingdom.* Yahusha (Jesus) named it with his own mouth, town to town — *the gospel of the kingdom.* And the kingdom he meant was not a feeling, not a far-off heaven, not a private transaction. When the apostles asked him plainly, *wilt thou at this time restore again the kingdom to Yashar'el (Israel)?* — he corrected their timing, not their frame. The kingdom is the kingdom restored to Yashar'el (Israel): the throne of David, the two houses joined under one head, the scattered seed gathered out of all nations, the King reigning on the earth, the Torah going forth from Tsion (Zion).

This teaching takes every verse the pulpit hands you as *a prophecy that Yahusha (Jesus) would die for your sins so you could go to heaven* — Genesis 3:15, the sceptre of Yahudah (Judah), the Star out of Jacob, the throne of David, Psalm 2, Psalm 110, Isaiah 7, 9, 11, 42, 49, 53, 61, Jeremiah's Branch, Ezekiel's one shepherd, Daniel's everlasting kingdom, Hosea, Joel, Amos, Micah, Zechariah, Malachi — and shows you that every one of them is a *kingdom* prophecy. The Anointed restoring the kingdom to Yashar'el (Israel), regathering the scattered, joining Yahudah (Judah) and Ephraim, sitting on David's throne. It does not argue this. It arranges it. The titles and one line under each are the only human words on the page; everything else is the Word itself, quoted in full — canon first, and the restored library the Reformation cut stacked beneath on the same point.

Then it sets out the other gospels — the ones Paul cursed — and answers each not with argument but with scripture in order: the Christian *believe-and-go-to-heaven* gospel that drops the throne, the land, and the tribes; the replacement gospel that hands the kingdom to the church; the Hebrew Roots version that keeps the horn's gospel whole and only adds Torah on top of a Babylonian foundation; and the false inclusion — the counterfeit that says the nations *become* a metaphorical Yashar'el (Israel) and the bloodline is abolished.

And it draws the line the whole thing turns on: there is a *false* inclusion and a *true* one, and they could not be more opposite. The false says the nations replace the seed. The true says the seed was never replaced — it was scattered, kept, and is being gathered. *Not my people* is told she is a son of the living Elohim (God) again. Ephraim comes home. The wild olive is not a stranger tree; it is the living descendants of the branches broken off, grafted back into *their own olive tree,* while the sleeping fathers wait for the first resurrection to be grafted in again. Refuse the counterfeit. Never refuse the gathering.

One gospel — the kingdom — promised from the beginning, preached by Yahusha (Jesus), carried by Paul, and guarded with a curse on every replacement. This is not offered as *maybe.* It is *thus saith Yahuah (LORD).*

*Read the full teaching in the Teachings tab.*
`;
