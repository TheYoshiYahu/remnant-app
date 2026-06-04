-- session-199 — Maps overlay rewrite: worldwide scattering & gathering
-- The S197 maps/dispersion-overlay copy confined the scattering to the
-- Assyrian/Babylonian exile and the gathering to a return to the old land —
-- erasing the worldwide remnant (the scattered seed across ALL nations, the
-- Americas included). S199 pulled the wrong Maps render; this migration
-- rewrites the framework band copy to the worldwide-gathering reading, with
-- the prophets quoted in full (come-and-see: quote, don't cite) and Sacred
-- Names restored per yoshi-voice.
--
-- DEPENDS ON: session196_tool_annotations.sql (table) + the S196 seed row.
-- Re-runnable: ON CONFLICT (tool, entry_key) DO UPDATE.

BEGIN;

INSERT INTO tool_annotations
    (tool, entry_key, term_display, conflict_summary, annotation_md, tier_required, red_lines_cited, is_punch_list_only, last_reviewed_at)
VALUES
('maps', 'dispersion-overlay', 'The scattering / gathering overlay',
 'The inherited "Holy Land" atlas confines the scattering to the Assyrian and Babylonian exile and the gathering to a return to the old land — erasing the worldwide dispersion to all nations and the gathering of the whole house from the four corners and the islands of the sea.',
 'The inherited atlas draws a small map: the ten tribes carried off to Assyria, Yahudah (Judah) to Babylon, and a single road home to the same hills. The prophets drew it larger. The scattering ran to the ends of the earth and across the sea, into every nation under heaven — and the gathering comes home from every corner of it.

The scattering — to all nations, the four winds, the ends of the earth:

*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other.* (Deuteronomy 28:64)
*For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth.* (Amos 9:9)
*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

The gathering — from the four corners and the islands of the sea, the whole house of all twelve tribes:

*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* (Isaiah 11:11)
*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12)
*Behold, I will bring them from the north country, and gather them from the coasts of the earth ... a great company shall return thither.* (Jeremiah 31:8)
*... for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9)
*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* (Jeremiah 31:10)
*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* (Ezekiel 37:21)

This is the second recovery — the paternal blood remnant of all twelve tribes, Yahudah (Judah) and the scattered house of Yosef alike, gathered from the isles and the four corners and the ends of the earth, the living remnant wherever the wind carried the seed. A map that shrinks it to a Mesopotamia round-trip erases the promise itself: the seed sown into every nation, across every sea, and gathered home.',
 'complete_study', ARRAY['1','3','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00')
ON CONFLICT (tool, entry_key) DO UPDATE SET
    term_display       = EXCLUDED.term_display,
    conflict_summary   = EXCLUDED.conflict_summary,
    annotation_md      = EXCLUDED.annotation_md,
    tier_required      = EXCLUDED.tier_required,
    red_lines_cited    = EXCLUDED.red_lines_cited,
    is_punch_list_only = EXCLUDED.is_punch_list_only,
    last_reviewed_at   = EXCLUDED.last_reviewed_at,
    updated_at         = NOW();

DO $verify$
DECLARE
    n INT;
    has_worldwide BOOL;
BEGIN
    SELECT COUNT(*) INTO n FROM tool_annotations
      WHERE tool='maps' AND entry_key='dispersion-overlay' AND is_punch_list_only=FALSE;
    IF n <> 1 THEN
        RAISE EXCEPTION 'session199 verify failed: maps/dispersion-overlay live row count = %', n;
    END IF;
    SELECT (annotation_md LIKE '%four corners%' AND annotation_md LIKE '%islands of the sea%'
            AND annotation_md LIKE '%ends of the earth%')
      INTO has_worldwide
      FROM tool_annotations WHERE tool='maps' AND entry_key='dispersion-overlay';
    IF NOT has_worldwide THEN
        RAISE EXCEPTION 'session199 verify failed: worldwide-gathering language missing';
    END IF;
    RAISE NOTICE 'session199: maps/dispersion-overlay rewritten to worldwide scattering/gathering.';
END
$verify$;

COMMIT;
