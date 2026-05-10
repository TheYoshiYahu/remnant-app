#!/usr/bin/env python3
"""
Modernize the 1769 KJV Apocrypha source text and restore divine names.
Applies the same modernization conventions used in the Jasher and Enoch volumes.
"""
import os
import re

SRC = "/sessions/festive-wizardly-wright/mnt/Claude the Apocrypha/source"
OUT = "/sessions/festive-wizardly-wright/mnt/Claude the Apocrypha/working/modernized"
os.makedirs(OUT, exist_ok=True)

# Order matters: process longer/more specific patterns first to avoid partial matches.
# All replacements are case-sensitive and word-boundaried where applicable.

# Verb-form modernizations (whole-word, case-preserving where possible)
VERB_FORMS = [
    # Special cases first
    (r'\bbeseech thee\b', 'beseech you'),
    (r'\bBeseech thee\b', 'Beseech you'),
    # Pronouns
    (r'\bthou art\b', 'you are'),
    (r'\bThou art\b', 'You are'),
    (r'\bthou wast\b', 'you were'),
    (r'\bThou wast\b', 'You were'),
    (r'\bthou wert\b', 'you were'),
    (r'\bThou wert\b', 'You were'),
    (r'\bthou hast\b', 'you have'),
    (r'\bThou hast\b', 'You have'),
    (r'\bthou hadst\b', 'you had'),
    (r'\bThou hadst\b', 'You had'),
    (r'\bthou shalt\b', 'you shall'),
    (r'\bThou shalt\b', 'You shall'),
    (r'\bthou shouldst\b', 'you should'),
    (r'\bThou shouldst\b', 'You should'),
    (r'\bthou wilt\b', 'you will'),
    (r'\bThou wilt\b', 'You will'),
    (r'\bthou wouldst\b', 'you would'),
    (r'\bThou wouldst\b', 'You would'),
    (r'\bthou mayest\b', 'you may'),
    (r'\bThou mayest\b', 'You may'),
    (r'\bthou mightest\b', 'you might'),
    (r'\bThou mightest\b', 'You might'),
    (r'\bthou canst\b', 'you can'),
    (r'\bThou canst\b', 'You can'),
    (r'\bthou couldst\b', 'you could'),
    (r'\bThou couldst\b', 'You could'),
    (r'\bthou knowest\b', 'you know'),
    (r'\bThou knowest\b', 'You know'),
    (r'\bthou seest\b', 'you see'),
    (r'\bThou seest\b', 'You see'),
    (r'\bthou doest\b', 'you do'),
    (r'\bThou doest\b', 'You do'),
    (r'\bthou dost\b', 'you do'),
    (r'\bThou dost\b', 'You do'),
    (r'\bthou didst\b', 'you did'),
    (r'\bThou didst\b', 'You did'),
    (r'\bthou sayest\b', 'you say'),
    (r'\bThou sayest\b', 'You say'),
    (r'\bthou hearest\b', 'you hear'),
    (r'\bThou hearest\b', 'You hear'),
    (r'\bthou understandest\b', 'you understand'),
    (r'\bThou understandest\b', 'You understand'),
    (r'\bthou speakest\b', 'you speak'),
    (r'\bThou speakest\b', 'You speak'),
    (r'\bthou askest\b', 'you ask'),
    (r'\bThou askest\b', 'You ask'),
    (r'\bthou givest\b', 'you give'),
    (r'\bThou givest\b', 'You give'),
    (r'\bthou takest\b', 'you take'),
    (r'\bThou takest\b', 'You take'),
    (r'\bthou comest\b', 'you come'),
    (r'\bThou comest\b', 'You come'),
    (r'\bthou goest\b', 'you go'),
    (r'\bThou goest\b', 'You go'),
    (r'\bthou bringest\b', 'you bring'),
    (r'\bThou bringest\b', 'You bring'),
    (r'\bthou rememberest\b', 'you remember'),
    (r'\bThou rememberest\b', 'You remember'),
    (r'\bthou settest\b', 'you set'),
    (r'\bThou settest\b', 'You set'),
    (r'\bthou wouldest\b', 'you would'),
    (r'\bThou wouldest\b', 'You would'),
    (r'\bthou shouldest\b', 'you should'),
    (r'\bThou shouldest\b', 'You should'),
    (r'\bthou couldest\b', 'you could'),
    (r'\bThou couldest\b', 'You could'),
    # Pronoun base forms
    (r'\bthou\b', 'you'),
    (r'\bThou\b', 'You'),
    (r'\bthee\b', 'you'),
    (r'\bThee\b', 'You'),
    (r'\bthy\b', 'your'),
    (r'\bThy\b', 'Your'),
    (r'\bthine own\b', 'your own'),
    (r'\bThine own\b', 'Your own'),
    (r'\bthine\b', 'yours'),  # thine standalone = yours; before vowels = your (handle next)
    (r'\bThine\b', 'Yours'),
    (r'\bye\b', 'you'),
    (r'\bYe\b', 'You'),
]

# Note: "thine" before vowels is technically "your" — but since we're replacing
# generic "thine" → "yours", phrases like "thine eyes" become "yours eyes" which is wrong.
# Conversely, "thine is the glory" should be "yours is the glory" not "your is the glory".
# Handle the predicate cases first, then attributive-before-vowel:
THINE_PREDICATE = [
    # "thine is/was/will/shall/be" → "yours <verb>"
    (r'\bthine (is|was|are|were|will|shall|may|might|can|could|hath|has|had)\b', r'yours \1'),
    (r'\bThine (is|was|are|were|will|shall|may|might|can|could|hath|has|had)\b', r'Yours \1'),
]
THINE_BEFORE_VOWEL = [
    (r'\bthine ([aeiouAEIOU])', r'your \1'),
    (r'\bThine ([aeiouAEIOU])', r'Your \1'),
]
# "mine" before consonant → "my"; before vowel/predicate → "mine" stays as predicate
# But in 1611 English, "mine" before consonant is rare; usually it's archaic possessive.
# Apply: "mine <noun-starting-letter>" → "my <noun-starting-letter>" for both vowel and consonant,
# except predicate uses ("the kingdom is mine" → leave).
MINE_FIXES = [
    # Predicate keep as is — but predicate is rare. Most "mine X" in 1611 is attributive.
    # "mine eyes/iniquities/heart/own" → "my eyes/iniquities/heart/own"
    (r'\bmine own\b', 'my own'),
    (r'\bMine own\b', 'My own'),
    (r'\bmine ([a-zA-Z])', r'my \1'),
    (r'\bMine ([a-zA-Z])', r'My \1'),
]

# Verb endings — generic -eth/-est suffixes that don't have explicit replacements above
VERB_ENDINGS = [
    # 'hast' as standalone (e.g., "who hast made") → "have"
    (r'\bhast\b', 'have'),
    (r'\bHast\b', 'Have'),
    # 'art' as standalone (in "you art" or "Lord, who art") → "are"
    # Be careful: "art" can be a noun. In apocrypha/prayer context it's overwhelmingly the verb.
    # Restrict: only convert "art" when preceded by you/Lord/who/God or sentence-start in prayer-mode
    (r'\b(you|Lord|who|God|YAHUAH|that|which|man) art\b', r'\1 are'),
    (r'\b(You|Lord|Who|God|YAHUAH|That|Which|Man) art\b', r'\1 are'),
    # 'wast' as standalone → 'were'
    (r'\bwast\b', 'were'),
    (r'\bWast\b', 'Were'),
    (r'\bwert\b', 'were'),
    (r'\bWert\b', 'Were'),
    # 'shouldst' → 'should', 'wouldst' → 'would', etc., when bare (already in VERB_FORMS pair list above)
    (r'\bshouldst\b', 'should'),
    (r'\bShouldst\b', 'Should'),
    (r'\bwouldst\b', 'would'),
    (r'\bWouldst\b', 'Would'),
    (r'\bcouldst\b', 'could'),
    (r'\bCouldst\b', 'Could'),
    (r'\bdidst\b', 'did'),
    (r'\bDidst\b', 'Did'),
    (r'\bwilt\b', 'will'),
    (r'\bWilt\b', 'Will'),
    (r'\bshalt\b', 'shall'),
    (r'\bShalt\b', 'Shall'),
    (r'\bmayst\b', 'may'),
    (r'\bMayst\b', 'May'),
    (r'\bmayest\b', 'may'),
    (r'\bMayest\b', 'May'),
    (r'\bmightst\b', 'might'),
    (r'\bMightst\b', 'Might'),
    (r'\bmightest\b', 'might'),
    (r'\bMightest\b', 'Might'),
    (r'\bcanst\b', 'can'),
    (r'\bCanst\b', 'Can'),
    (r'\bdost\b', 'do'),
    (r'\bDost\b', 'Do'),
    (r'\bhath\b', 'has'),
    (r'\bHath\b', 'Has'),
    (r'\bdoth\b', 'does'),
    (r'\bDoth\b', 'Does'),
    (r'\bsaith\b', 'says'),
    (r'\bSaith\b', 'Says'),
    (r'\bmaketh\b', 'makes'),
    (r'\bMaketh\b', 'Makes'),
    (r'\btaketh\b', 'takes'),
    (r'\bTaketh\b', 'Takes'),
    (r'\bgiveth\b', 'gives'),
    (r'\bGiveth\b', 'Gives'),
    (r'\bcometh\b', 'comes'),
    (r'\bCometh\b', 'Comes'),
    (r'\bgoeth\b', 'goes'),
    (r'\bGoeth\b', 'Goes'),
    (r'\brunneth\b', 'runs'),
    (r'\bRunneth\b', 'Runs'),
    (r'\bspeaketh\b', 'speaks'),
    (r'\bSpeaketh\b', 'Speaks'),
    (r'\bhelpeth\b', 'helps'),
    (r'\bHelpeth\b', 'Helps'),
    (r'\bhopeth\b', 'hopes'),
    (r'\bHopeth\b', 'Hopes'),
    (r'\bgrieveth\b', 'grieves'),
    (r'\bGrieveth\b', 'Grieves'),
    (r'\bperisheth\b', 'perishes'),
    (r'\bPerisheth\b', 'Perishes'),
    (r'\bestablisheth\b', 'establishes'),
    (r'\bEstablisheth\b', 'Establishes'),
    (r'\bwalketh\b', 'walks'),
    (r'\bWalketh\b', 'Walks'),
    (r'\btalketh\b', 'talks'),
    (r'\bTalketh\b', 'Talks'),
    (r'\bworketh\b', 'works'),
    (r'\bWorketh\b', 'Works'),
    (r'\bturneth\b', 'turns'),
    (r'\bTurneth\b', 'Turns'),
    (r'\breturneth\b', 'returns'),
    (r'\bReturneth\b', 'Returns'),
    (r'\bappeareth\b', 'appears'),
    (r'\bAppeareth\b', 'Appears'),
    (r'\bbeareth\b', 'bears'),
    (r'\bBeareth\b', 'Bears'),
    (r'\bbringeth\b', 'brings'),
    (r'\bBringeth\b', 'Brings'),
    (r'\bteacheth\b', 'teaches'),
    (r'\bTeacheth\b', 'Teaches'),
    (r'\bpreacheth\b', 'preaches'),
    (r'\bPreacheth\b', 'Preaches'),
    (r'\bjudgeth\b', 'judges'),
    (r'\bJudgeth\b', 'Judges'),
    (r'\bdriveth\b', 'drives'),
    (r'\bDriveth\b', 'Drives'),
    (r'\bdwelleth\b', 'dwells'),
    (r'\bDwelleth\b', 'Dwells'),
    (r'\bsitteth\b', 'sits'),
    (r'\bSitteth\b', 'Sits'),
    (r'\bstandeth\b', 'stands'),
    (r'\bStandeth\b', 'Stands'),
    (r'\briseth\b', 'rises'),
    (r'\bRiseth\b', 'Rises'),
    (r'\bsetteth\b', 'sets'),
    (r'\bSetteth\b', 'Sets'),
    (r'\bcalleth\b', 'calls'),
    (r'\bCalleth\b', 'Calls'),
    (r'\banswereth\b', 'answers'),
    (r'\bAnswereth\b', 'Answers'),
    (r'\bcrieth\b', 'cries'),
    (r'\bCrieth\b', 'Cries'),
    (r'\bweepeth\b', 'weeps'),
    (r'\bWeepeth\b', 'Weeps'),
    (r'\bloveth\b', 'loves'),
    (r'\bLoveth\b', 'Loves'),
    (r'\bhateth\b', 'hates'),
    (r'\bHateth\b', 'Hates'),
    (r'\bfeareth\b', 'fears'),
    (r'\bFeareth\b', 'Fears'),
    (r'\bbelieveth\b', 'believes'),
    (r'\bBelieveth\b', 'Believes'),
    (r'\btrusteth\b', 'trusts'),
    (r'\bTrusteth\b', 'Trusts'),
    (r'\bsendeth\b', 'sends'),
    (r'\bSendeth\b', 'Sends'),
    (r'\bcommandeth\b', 'commands'),
    (r'\bCommandeth\b', 'Commands'),
    (r'\bblesseth\b', 'blesses'),
    (r'\bBlesseth\b', 'Blesses'),
    (r'\bcurseth\b', 'curses'),
    (r'\bCurseth\b', 'Curses'),
    (r'\bdesireth\b', 'desires'),
    (r'\bDesireth\b', 'Desires'),
    (r'\brequireth\b', 'requires'),
    (r'\bRequireth\b', 'Requires'),
    (r'\bdemandeth\b', 'demands'),
    (r'\bDemandeth\b', 'Demands'),
    (r'\brejoiceth\b', 'rejoices'),
    (r'\bRejoiceth\b', 'Rejoices'),
    (r'\boffereth\b', 'offers'),
    (r'\bOffereth\b', 'Offers'),
    (r'\breceiveth\b', 'receives'),
    (r'\bReceiveth\b', 'Receives'),
    (r'\bgathereth\b', 'gathers'),
    (r'\bGathereth\b', 'Gathers'),
    (r'\bscattereth\b', 'scatters'),
    (r'\bScattereth\b', 'Scatters'),
    (r'\bdeparteth\b', 'departs'),
    (r'\bDeparteth\b', 'Departs'),
    (r'\bremaineth\b', 'remains'),
    (r'\bRemaineth\b', 'Remains'),
    (r'\bremaineth\b', 'remains'),
    (r'\bcontinueth\b', 'continues'),
    (r'\bContinueth\b', 'Continues'),
    (r'\bgroweth\b', 'grows'),
    (r'\bGroweth\b', 'Grows'),
    (r'\bbeholdeth\b', 'beholds'),
    (r'\bBeholdeth\b', 'Beholds'),
    (r'\bvexeth\b', 'vexes'),
    (r'\bVexeth\b', 'Vexes'),
    (r'\bmoveth\b', 'moves'),
    (r'\bMoveth\b', 'Moves'),
    (r'\bliveth\b', 'lives'),
    (r'\bLiveth\b', 'Lives'),
    (r'\bdieth\b', 'dies'),
    (r'\bDieth\b', 'Dies'),
    (r'\beateth\b', 'eats'),
    (r'\bEateth\b', 'Eats'),
    (r'\bdrinketh\b', 'drinks'),
    (r'\bDrinketh\b', 'Drinks'),
    (r'\bsleepeth\b', 'sleeps'),
    (r'\bSleepeth\b', 'Sleeps'),
    (r'\bawaketh\b', 'awakes'),
    (r'\bAwaketh\b', 'Awakes'),
    (r'\bsavoureth\b', 'savors'),
    (r'\bSavoureth\b', 'Savors'),
    (r'\bsuffereth\b', 'suffers'),
    (r'\bSuffereth\b', 'Suffers'),
    (r'\bprovideth\b', 'provides'),
    (r'\bProvideth\b', 'Provides'),
    (r'\bdivideth\b', 'divides'),
    (r'\bDivideth\b', 'Divides'),
    (r'\bsatisfieth\b', 'satisfies'),
    (r'\bSatisfieth\b', 'Satisfies'),
    (r'\bjustifieth\b', 'justifies'),
    (r'\bJustifieth\b', 'Justifies'),
    (r'\bmagnifieth\b', 'magnifies'),
    (r'\bMagnifieth\b', 'Magnifies'),
    (r'\bmocketh\b', 'mocks'),
    (r'\bMocketh\b', 'Mocks'),
    (r'\bspoileth\b', 'spoils'),
    (r'\bSpoileth\b', 'Spoils'),
    (r'\bdestroyeth\b', 'destroys'),
    (r'\bDestroyeth\b', 'Destroys'),
    (r'\bsaveth\b', 'saves'),
    (r'\bSaveth\b', 'Saves'),
    (r'\bdelivereth\b', 'delivers'),
    (r'\bDelivereth\b', 'Delivers'),
    (r'\bpunisheth\b', 'punishes'),
    (r'\bPunisheth\b', 'Punishes'),
    (r'\bproveth\b', 'proves'),
    (r'\bProveth\b', 'Proves'),
    (r'\bdiscovereth\b', 'discovers'),
    (r'\bDiscovereth\b', 'Discovers'),
    (r'\boppresseth\b', 'oppresses'),
    (r'\bOppresseth\b', 'Oppresses'),
    (r'\bquencheth\b', 'quenches'),
    (r'\bQuencheth\b', 'Quenches'),
    (r'\bperisheth\b', 'perishes'),
    (r'\bperformeth\b', 'performs'),
    (r'\bPerformeth\b', 'Performs'),
    (r'\bnourisheth\b', 'nourishes'),
    (r'\bNourisheth\b', 'Nourishes'),
    (r'\bgreeveth\b', 'grieves'),
    (r'\bbreaketh\b', 'breaks'),
    (r'\bBreaketh\b', 'Breaks'),
    (r'\bsmiteth\b', 'smites'),
    (r'\bSmiteth\b', 'Smites'),
    (r'\bdraweth\b', 'draws'),
    (r'\bDraweth\b', 'Draws'),
    (r'\bweareth\b', 'wears'),
    (r'\bWeareth\b', 'Wears'),
    (r'\bbindeth\b', 'binds'),
    (r'\bBindeth\b', 'Binds'),
    (r'\bopeneth\b', 'opens'),
    (r'\bOpeneth\b', 'Opens'),
    (r'\bshutteth\b', 'shuts'),
    (r'\bShutteth\b', 'Shuts'),
    (r'\bcleanseth\b', 'cleanses'),
    (r'\bCleanseth\b', 'Cleanses'),
    (r'\bdefileth\b', 'defiles'),
    (r'\bDefileth\b', 'Defiles'),
    (r'\bbeginneth\b', 'begins'),
    (r'\bBeginneth\b', 'Begins'),
    (r'\bendeth\b', 'ends'),
    (r'\bEndeth\b', 'Ends'),
    (r'\bswelleth\b', 'swells'),
    (r'\bSwelleth\b', 'Swells'),
    (r'\bfaileth\b', 'fails'),
    (r'\bFaileth\b', 'Fails'),
    (r'\bjoineth\b', 'joins'),
    (r'\bJoineth\b', 'Joins'),
    (r'\baboundeth\b', 'abounds'),
    (r'\bAboundeth\b', 'Abounds'),
    (r'\bissueth\b', 'issues'),
    (r'\bIssueth\b', 'Issues'),
    (r'\benvieth\b', 'envies'),
    (r'\bEnvieth\b', 'Envies'),
    (r'\bsoweth\b', 'sows'),
    (r'\bSoweth\b', 'Sows'),
    (r'\breapeth\b', 'reaps'),
    (r'\bReapeth\b', 'Reaps'),
    (r'\bplougheth\b', 'plows'),
    (r'\bPlougheth\b', 'Plows'),
    (r'\bdoubleth\b', 'doubles'),
    (r'\bDoubleth\b', 'Doubles'),
    (r'\bpiercieth\b', 'pierces'),
    (r'\bpiercheth\b', 'pierces'),
    (r'\bpierceth\b', 'pierces'),
    (r'\bPierceth\b', 'Pierces'),
    (r'\btearcheth\b', 'tears'),
    (r'\bteareth\b', 'tears'),
    (r'\bTeareth\b', 'Tears'),
    (r'\briseth\b', 'rises'),
    (r'\bfalleth\b', 'falls'),
    (r'\bFalleth\b', 'Falls'),
    (r'\barseth\b', 'arises'),
    (r'\bsmotheth\b', 'smothers'),
    (r'\bquaketh\b', 'quakes'),
    (r'\bQuaketh\b', 'Quakes'),
    (r'\btrembleth\b', 'trembles'),
    (r'\bTrembleth\b', 'Trembles'),
    (r'\bsnareth\b', 'snares'),
    (r'\bSnareth\b', 'Snares'),
    (r'\bcatcheth\b', 'catches'),
    (r'\bCatcheth\b', 'Catches'),
    (r'\bgatherest\b', 'gather'),
    (r'\boutpoureth\b', 'pours out'),
    (r'\bweareth\b', 'wears'),
    (r'\bclotheth\b', 'clothes'),
    (r'\bClotheth\b', 'Clothes'),
    (r'\bunderstandeth\b', 'understands'),
    (r'\bUnderstandeth\b', 'Understands'),
    (r'\bcommeth\b', 'comes'),
    (r'\bCommeth\b', 'Comes'),
    (r'\bpraiseth\b', 'praises'),
    (r'\bPraiseth\b', 'Praises'),
    (r'\bpreserveth\b', 'preserves'),
    (r'\bPreserveth\b', 'Preserves'),
    (r'\binstructeth\b', 'instructs'),
    (r'\bInstructeth\b', 'Instructs'),
    (r'\bcorrecteth\b', 'corrects'),
    (r'\bCorrecteth\b', 'Corrects'),
    (r'\bchasteneth\b', 'chastens'),
    (r'\bChasteneth\b', 'Chastens'),
    (r'\binheriteth\b', 'inherits'),
    (r'\bInheriteth\b', 'Inherits'),
    (r'\bgaineth\b', 'gains'),
    (r'\bGaineth\b', 'Gains'),
    (r'\bloseth\b', 'loses'),
    (r'\bLoseth\b', 'Loses'),
    (r'\bfindeth\b', 'finds'),
    (r'\bFindeth\b', 'Finds'),
    (r'\bseeketh\b', 'seeks'),
    (r'\bSeeketh\b', 'Seeks'),
    (r'\bknocketh\b', 'knocks'),
    (r'\bKnocketh\b', 'Knocks'),
    (r'\boweth\b', 'owes'),
    (r'\bOweth\b', 'Owes'),
    (r'\bowneth\b', 'owns'),
    (r'\bOwneth\b', 'Owns'),
    # Catch-all generic -eth pattern as last resort, narrow
    # (Disabled to avoid false positives like "betweeneth", names ending in eth, etc.)
]

# Common archaic vocabulary
VOCAB = [
    (r'\bunto\b', 'to'),
    (r'\bUnto\b', 'To'),
    (r'\bwhilst\b', 'while'),
    (r'\bWhilst\b', 'While'),
    (r'\bamongst\b', 'among'),
    (r'\bAmongst\b', 'Among'),
    (r'\bbetwixt\b', 'between'),
    (r'\bBetwixt\b', 'Between'),
    (r'\bnay\b', 'no'),
    (r'\bNay\b', 'No'),
    (r'\byea\b', 'yes'),
    # Don't replace "Yea" at sentence-start because in apocrypha it often functions
    # as an emphatic "Yes, indeed" — leave capitalized form
    (r'\bperadventure\b', 'perhaps'),
    (r'\bPeradventure\b', 'Perhaps'),
    (r'\boftentimes\b', 'often'),
    (r'\bOftentimes\b', 'Often'),
    (r'\bwhensoever\b', 'whenever'),
    (r'\bWhensoever\b', 'Whenever'),
    (r'\bwheresoever\b', 'wherever'),
    (r'\bWheresoever\b', 'Wherever'),
    (r'\bwhomsoever\b', 'whomever'),
    (r'\bWhomsoever\b', 'Whomever'),
    (r'\bwhosoever\b', 'whoever'),
    (r'\bWhosoever\b', 'Whoever'),
    (r'\bhowsoever\b', 'however'),
    (r'\bHowsoever\b', 'However'),
    (r'\bhereunto\b', 'to this'),
    (r'\bHereunto\b', 'To this'),
    (r'\btheretofore\b', 'before that'),
    (r'\bThereunto\b', 'To it'),
    (r'\bthereunto\b', 'to it'),
    (r'\bthereto\b', 'to it'),
    (r'\bThereto\b', 'To it'),
    (r'\btherewith\b', 'with it'),
    (r'\bTherewith\b', 'With it'),
    (r'\btherein\b', 'in it'),
    (r'\bTherein\b', 'In it'),
    (r'\bthereon\b', 'on it'),
    (r'\bThereon\b', 'On it'),
    (r'\btherefrom\b', 'from it'),
    (r'\bTherefrom\b', 'From it'),
    (r'\bhereunto\b', 'to this'),
    (r'\bhereof\b', 'of this'),
    (r'\bHereof\b', 'Of this'),
    (r'\bhereto\b', 'to this'),
    (r'\bHereto\b', 'To this'),
    (r'\bherein\b', 'in this'),
    (r'\bHerein\b', 'In this'),
    (r'\bhereon\b', 'on this'),
    (r'\bHereon\b', 'On this'),
    (r'\bwhereby\b', 'by which'),
    (r'\bWhereby\b', 'By which'),
    (r'\bwherein\b', 'in which'),
    (r'\bWherein\b', 'In which'),
    (r'\bwhereof\b', 'of which'),
    (r'\bWhereof\b', 'Of which'),
    (r'\bwhereto\b', 'to which'),
    (r'\bWhereto\b', 'To which'),
    (r'\bwhereunto\b', 'to which'),
    (r'\bWhereunto\b', 'To which'),
    (r'\bwhereon\b', 'on which'),
    (r'\bWhereon\b', 'On which'),
    (r'\bwherefrom\b', 'from which'),
    (r'\bWherefrom\b', 'From which'),
    (r'\bwherewith\b', 'with which'),
    (r'\bWherewith\b', 'With which'),
    # Double negatives / idioms
    (r'\bsuffered him not\b', 'did not allow him'),
    (r'\bgive thanks unto\b', 'give thanks to'),
    (r'\bgave thanks unto\b', 'gave thanks to'),
    # spake → spoke
    (r'\bspake\b', 'spoke'),
    (r'\bSpake\b', 'Spoke'),
    (r'\bbade\b', 'told'),  # bade often means commanded/told; context-sensitive
    (r'\bsmote\b', 'struck'),
    (r'\bSmote\b', 'Struck'),
    (r'\bsmitten\b', 'struck'),
    (r'\bSmitten\b', 'Struck'),
    (r'\bgat\b', 'got'),  # past tense of get
    (r'\bgotten\b', 'gotten'),  # leave
    (r'\bbrethren\b', 'brothers'),
    (r'\bBrethren\b', 'Brothers'),
    (r'\boldness\b', 'old age'),
    (r'\bMine own\b', 'My own'),
    (r'\bmine own\b', 'my own'),
]

# Sacred name restorations.
# In the Apocrypha, "the LORD" rarely appears (it's a Greek text using kurios).
# But the eBible.org KJV uses "Lord" extensively. We restore conservatively:
# - "the LORD" (small caps in 1611) → YAHUAH (where it represents the Tetragrammaton)
# - "the Lord" → "the Lord" (left as formal title in most apocryphal contexts since
#   underlying is Greek kurios, not the Tetragrammaton)
# However, our source from eBible.org has already collapsed LORD to Lord.
# So we use a conservative rule: leave "Lord" alone in most apocryphal Greek texts
# (the books were composed in Greek and use kurios), but apply YAHUAH restoration
# in:
#   - 1 Esdras passages that parallel Ezra-Nehemiah Hebrew (where LORD appears)
#   - The Prayer of Manasseh ("O Lord Almighty God of our fathers")
#   - The Song of the Three Children (Hebrew origin liturgy)
#   - Susanna's prayers (Hebrew/Aramaic source tradition)
# Rather than try to context-detect, we apply a moderate rule:
# Use "YAHUAH (the Lord)" for the very first "the Lord" in each chapter,
# then leave subsequent Lord references as is (avoids visual saturation).
# This matches the Jasher convention from his existing volume.
# For the bare term "God" → leave as is (covers both Father and Formed contexts).
# However, for first occurrence of "God" in a given chapter, apply Elohim parenthetical.

# We will do the parenthetical restoration in the rendering pass, not in the
# raw modernization. The raw modernization is just for archaic English.

def modernize_text(text):
    # Apply thine-predicate first (must run before generic thine→yours)
    for pat, rep in THINE_PREDICATE:
        text = re.sub(pat, rep, text)
    # Apply thine-before-vowel
    for pat, rep in THINE_BEFORE_VOWEL:
        text = re.sub(pat, rep, text)
    # Apply pronoun forms (incl. generic thine → yours)
    for pat, rep in VERB_FORMS:
        text = re.sub(pat, rep, text)
    # Apply mine fixes (must run before generic ye/thee/thou might affect surrounding text)
    for pat, rep in MINE_FIXES:
        text = re.sub(pat, rep, text)
    # Apply verb endings
    for pat, rep in VERB_ENDINGS:
        text = re.sub(pat, rep, text)
    # Apply vocab
    for pat, rep in VOCAB:
        text = re.sub(pat, rep, text)
    return text

if __name__ == "__main__":
    total_before = 0
    total_after = 0
    for fn in sorted(os.listdir(SRC)):
        if not fn.endswith(".txt"):
            continue
        in_path = os.path.join(SRC, fn)
        out_path = os.path.join(OUT, fn)
        with open(in_path, "r", encoding="utf-8") as f:
            t = f.read()
        before = len(t.split())
        modern = modernize_text(t)
        after = len(modern.split())
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(modern)
        total_before += before
        total_after += after
        print(f"{fn}: {before:,} → {after:,} words")
    print(f"\nTOTAL: {total_before:,} → {total_after:,} words")
