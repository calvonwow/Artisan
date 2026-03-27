-- Artisan: Fishing Data (1-375 TBC Anniversary)
-- Fishing is a pure gathering profession. No materials to buy - just a fishing pole and lures.
-- LURES (apply to pole before fishing):
--   Shiny Bauble (item 5482) +25 skill, 10 min  - sold by most Fishing Supply vendors
--   Nightcrawlers (item 6835) +50 skill, 10 min  - sold by most Fishing Supply vendors
--   Aquadynamic Fish Attractor (item 6533) +75 skill, 60 min - sold at Fishing Supplies, AH
--   Bright Baubles (item 6532) +75 skill, 10 min  - sold by Old Man Heming in Booty Bay
-- POLES (equip for passive bonus):
--   Strong Fishing Pole (item 6365)  +5 skill  - sold by Fishing Supply vendors
--   Seth's Graphite Fishing Pole (item 25978) +20 skill - from quest "Rather Be Fishin'" in Terokkar
--   Arcanite Fishing Pole (item 19022) +35 skill - reward from Stranglethorn Fishing Extravaganza

ArtisanData = ArtisanData or {}

ArtisanData["Fishing"] = {
    professionName = "Fishing",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Trade_Fishing",

    steps = {
        -- 1-75: Apprentice
        {
            skillStart  = 1, skillEnd = 75,
            isGathering = true,
            zoneName    = "Starting Zone Ponds",
            herbs = {
                { name = "Raw Brilliant Smallfish", itemId = 6291 },
                { name = "Raw Longjaw Mud Snapper",  itemId = 6289 },
            },
            notes = "Apply a Shiny Bauble lure before every cast or fish will escape. Fish any lake, river, or coastal water in your starting zone (Durotar, Mulgore, Elwynn, Dun Morogh, Teldrassil, etc.). Turn on sound - the bobber splash tells you when to click. Equip a Strong Fishing Pole (+5 skill) from any Fishing Supply vendor. Learn Journeyman Fishing at your trainer when you hit 50.",
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Fishing",
            charLevel     = 5,
            grantsMaxRank = 150,
            notes         = "Any Fishing trainer in a major city. Ask a guard for directions and choose Fishing from the professions menu.",
        },

        -- 75-150: Journeyman
        {
            skillStart  = 75, skillEnd = 150,
            isGathering = true,
            zoneName    = "Capital City Waters",
            herbs = {
                { name = "Raw Bristle Whisker Catfish", itemId = 6308 },
                { name = "Raw Longjaw Mud Snapper",     itemId = 6289 },
                { name = "Oily Blackmouth",             itemId = 6358 },
            },
            notes = "Fish capital city waters: Orgrimmar (Valleys of Honor/Spirits), Thunder Bluff (central pond), Darnassus (Temple Gardens lake), Ironforge (Forlorn Cavern/Mystic Ward). Capital cities allow fishing at any skill level without lures. Alt: Fish Loch Modan (A) or Barrens rivers (H).",
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Buy Expert Fishing - The Bass and You (Book)",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Purchase the book from Old Man Heming in Booty Bay, Stranglethorn Vale (inside The Happy Bobber shop, lowest platform). Costs 1g. Also buy 40x Bright Baubles (+75 skill, 10 min) while you are here - you will need them for 150-225.",
        },

        -- 150-225: Expert
        {
            skillStart  = 150, skillEnd = 225,
            isGathering = true,
            zoneName    = "Dustwallow Marsh",
            herbs = {
                { name = "Raw Bristle Whisker Catfish", itemId = 6308 },
                { name = "Raw Spotted Yellowtail",      itemId = 4603 },
                { name = "Firefin Snapper",             itemId = 6361 },
            },
            notes = "Fish anywhere in Dustwallow Marsh with Bright Baubles applied (+75 skill, 10 min - bought from Old Man Heming in Booty Bay). Artisan fishing quest starts here at skill 225, so staying here is efficient. Use Nightcrawlers or Aquadynamic Fish Attractor if Bright Baubles run out.",
        },
        {
            isTrainer     = true,
            skillStart    = 225, skillEnd = 226,
            recipeName    = "Nat Pagle, Angler Extreme (Artisan Quest)",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Find Nat Pagle on a small island SW of Theramore Isle in Dustwallow Marsh (swim/boat required). He asks for 4 rare fish from specific locations: (1) Feralas Ahi - small pool SE of Dire Maul in Feralas; (2) Misty Reed Mahi Mahi - Swamp of Sorrows coastline; (3) Sar'theris Striker - Desolace coast; (4) Savage Coast Blue Sailfin - NW coast of Stranglethorn Vale. Fish the special pools in those zones. Bright Baubles required. Turn them all in to Nat Pagle to learn Artisan Fishing.",
        },

        -- 225-300: Artisan
        {
            skillStart  = 225, skillEnd = 300,
            isGathering = true,
            zoneName    = "Feralas / Azshara / Eastern Plaguelands",
            herbs = {
                { name = "Raw Nightfin Snapper",    itemId = 13759 },
                { name = "Raw Sunscale Salmon",     itemId = 13760 },
                { name = "Raw Whitescale Salmon",   itemId = 13889 },
                { name = "Stonescale Eel",          itemId = 13754 },
            },
            notes = "Use Bright Baubles at 225-250 to avoid missed catches. Good zones: Feralas rivers (225-280), Azshara coast for Stonescale Eels and Essences of Water (250-300), Eastern Plaguelands lakes (280-300) for Raw Whitescale Salmon. Do NOT fish Outland water below skill 300 - escape rate is too high to be efficient. Train Master Fishing before heading through the Dark Portal.",
        },
        {
            isTrainer     = true,
            skillStart    = 275, skillEnd = 276,
            recipeName    = "Buy Master Fishing - The Art of Angling (Book)",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Purchase from Juno Dufrain at Cenarion Refuge in Zangarmarsh (both factions, costs 5g). Read the book to unlock skill 375. Also buy Aquadynamic Fish Attractors (+75 skill, 60 min) from him for the Outland grind.",
        },

        -- 300-375: Master (Outland)
        {
            skillStart  = 300, skillEnd = 350,
            isGathering = true,
            zoneName    = "Zangarmarsh",
            herbs = {
                { name = "Spotted Feltail",    itemId = 27425 },
                { name = "Zangarian Sporefish", itemId = 27429 },
                { name = "Barbed Gill Trout",   itemId = 27422 },
            },
            notes = "Fish the lakes around Cenarion Refuge and Telredor. Use Aquadynamic Fish Attractors (+75 skill, 60 min). Fish POOLS when you can find them - Spotted Feltail Schools are the most common and give consistent catches. Note: Outland requires 400 EFFECTIVE skill (base + lures/pole) to fish without escapes. With a +75 lure and skill 330 you hit 405 effective and fish clean. Spotted Feltail and Sporefish are used in Cooking for raid food (Feltail Delight, Blackened Sporefish).",
        },
        {
            skillStart  = 350, skillEnd = 375,
            isGathering = true,
            zoneName    = "Terokkar Forest / Nagrand",
            herbs = {
                { name = "Golden Darter",        itemId = 27438 },
                { name = "Furious Crawdad",       itemId = 27439 },
                { name = "Icefin Bluefish",       itemId = 27437 },
                { name = "Figluster's Mudfish",   itemId = 27435 },
            },
            notes = "Terokkar: fish rivers and lakes (avoid flying-restricted areas and the Shattrath lake). Highland Mixed Schools in Terokkar give Furious Crawdad - used in Spicy Crawdad (best Stamina food in TBC). Needs ~430 effective skill to avoid escapes there. Nagrand (345-375): fish Skysong/Sunspring/Halaa lakes for Icefin Bluefish (used in Golden Fish Sticks, best Healing Power food). Pickup Old Man Barlo's daily fishing quests (level 70, skill 350+, N of Shattrath) for a Bag of Fishing Treasures with rare rewards including Weather-Beaten Journal (unlocks Find Fish minimap tracking). Congratulations on 375!",
        },
    },
}
