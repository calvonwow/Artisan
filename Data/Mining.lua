-- Artisan: Mining Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/mining-leveling-guide-tbc-classic
--
-- Primary: isGathering steps with zone routes.
-- Smelting alternative noted per-step: buy ores and smelt at any forge.
-- Shopping list shows ores only for the smelting craft steps (1-290 path).
-- Buy a Mining Pick from the Mining Supply vendor - must be in your bags.
-- Turn on Find Minerals on your minimap!

ArtisanData = ArtisanData or {}

ArtisanData["Mining"] = {
    professionName = "Mining",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\INV_Pick_02",

    steps = {
        -- -- 1-65: Copper -----------------------------------------
        {
            skillStart  = 1,  skillEnd = 65,
            isGathering = true,
            zoneName    = "Any Starter Zone",
            herbs = {
                { name = "Copper Ore",  itemId = 2770 },
            },
            notes = "Every starter zone has Copper. Durotar, Elwynn, Tirisfal, Dun Morogh all work. Night Elves must travel to Darkshore first - Teldrassil has no ore. Smelting alternative: see Smelt Copper step below.",
        },
        -- SMELTING ROUTE: buy ores and smelt at any forge for skill instead of mining.
        -- These steps populate the shopping list with ore quantities.
        {
            skillStart   = 1,   skillEnd = 65,
            recipeName   = "Smelt Copper",
            isAlt        = true,
            outputItemId = 2840,   -- Copper Bar
            quantity     = 120, color = "orange",
            materials = {
                { name = "Copper Ore", itemId = 2770, quantity = 120 },
            },
            notes = "Smelting route alternative. 120x Copper Ore → 120x Copper Bar at any forge. Copper Bars are also needed in large quantities for Blacksmithing.",
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Mining",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Available from any Mining trainer in a major city.",
        },

        -- -- 65-125: Tin / Silver ---------------------------------
        {
            skillStart  = 65, skillEnd = 125,
            isGathering = true,
            zoneName    = "Hillsbrad Foothills / Redridge Mountains",
            herbs = {
                { name = "Tin Ore",    itemId = 2771 },
                { name = "Silver Ore", itemId = 2775 },
            },
            notes = "Tin veins spawn along mountain sides. Hillsbrad and Redridge both have dense routes. Silver is a rare bonus replacing Tin nodes. Smelting alternative: see steps below.",
        },
        {
            skillStart   = 65,  skillEnd = 105,
            recipeName   = "Smelt Bronze",
            isAlt        = true,
            outputItemId = 2841,   -- Bronze Bar
            quantity     = 70, color = "orange",
            materials = {
                { name = "Copper Ore", itemId = 2770, quantity = 70 },
                { name = "Tin Ore",    itemId = 2771, quantity = 70 },
            },
            notes = "Smelting route: 1 Copper Ore + 1 Tin Ore → 1 Bronze Bar. Bronze Bars are needed for Blacksmithing (Rough Bronze Leggings, Patterned Bronze Bracers).",
        },
        {
            skillStart   = 105, skillEnd = 125,
            recipeName   = "Smelt Silver",
            isAlt        = true,
            outputItemId = 2842,   -- Silver Bar
            quantity     = 30, color = "orange",
            materials = {
                { name = "Silver Ore", itemId = 2775, quantity = 30 },
            },
            notes = "Smelting route: Silver Ore is a rare spawn replacing Tin/Iron nodes. Silver Bars are used in Blacksmithing (Silver Rod) and Enchanting.",
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Mining",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Available from any Mining trainer in a major city.",
        },

        -- -- 125-175: Iron / Gold ---------------------------------
        {
            skillStart  = 125, skillEnd = 175,
            isGathering = true,
            zoneName    = "Arathi Highlands / Thousand Needles",
            herbs = {
                { name = "Iron Ore", itemId = 2772 },
                { name = "Gold Ore", itemId = 2776 },
            },
            notes = "Arathi Highlands has great Iron density along the mountain perimeter - 4 caves worth clearing. Gold is a rare node replacing Iron. Smelting alternative: see steps below.",
        },
        {
            skillStart   = 125, skillEnd = 155,
            recipeName   = "Smelt Iron",
            isAlt        = true,
            outputItemId = 3575,   -- Iron Bar
            quantity     = 60, color = "orange",
            materials = {
                { name = "Iron Ore", itemId = 2772, quantity = 60 },
            },
            notes = "Smelting route: 1 Iron Ore → 1 Iron Bar. Iron Bars are used heavily in Blacksmithing (Green Iron Leggings, Green Iron Bracers). Steel Bar = Iron Bar + Coal (Coal sold by BS vendors).",
        },
        {
            skillStart   = 155, skillEnd = 175,
            recipeName   = "Smelt Gold",
            isAlt        = true,
            outputItemId = 3577,   -- Gold Bar
            quantity     = 25, color = "orange",
            materials = {
                { name = "Gold Ore", itemId = 2776, quantity = 25 },
            },
            notes = "Smelting route: Gold Ore is a rare node replacing Iron. Gold Bars used in Blacksmithing (Golden Rod, Golden Scale Bracers via Golden Rod).",
        },

        -- -- 175-230: Mithril / Truesilver ------------------------
        {
            skillStart  = 175, skillEnd = 230,
            isGathering = true,
            zoneName    = "Hinterlands / Tanaris",
            herbs = {
                { name = "Mithril Ore",    itemId = 3858 },
                { name = "Truesilver Ore", itemId = 7911 },
            },
            notes = "Hinterlands has excellent Mithril along the outer ring. Tanaris also works well. Truesilver is a rare bonus node. Smelting alternative: see steps below.",
        },
        {
            skillStart   = 175, skillEnd = 230,
            recipeName   = "Smelt Mithril",
            isAlt        = true,
            outputItemId = 3860,   -- Mithril Bar
            quantity     = 300, color = "orange",
            materials = {
                { name = "Mithril Ore", itemId = 3858, quantity = 300 },
            },
            notes = "Smelting route: 300x Mithril Ore → 300x Mithril Bar. Mithril Bars are used heavily in Blacksmithing (Heavy Mithril Gauntlet, Mithril Spurs, Mithril Coif). Skill gains slow after 225.",
        },
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Learn Artisan Mining",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Available from any Mining trainer in a major city.",
        },

        -- -- 230-290: Truesilver / Thorium ------------------------
        {
            skillStart  = 230, skillEnd = 290,
            isGathering = true,
            zoneName    = "Un'Goro Crater / Eastern Plaguelands",
            herbs = {
                { name = "Mithril Ore",    itemId = 3858  },
                { name = "Thorium Ore",    itemId = 10620 },
                { name = "Truesilver Ore", itemId = 7911  },
            },
            notes = "Small Thorium Veins start at 245 skill. Un'Goro has dense nodes on the outer walls. Eastern Plaguelands is great for Rich Thorium at 275+. Smelting stops giving skill at 290.",
        },
        {
            skillStart   = 230, skillEnd = 250,
            recipeName   = "Smelt Truesilver",
            isAlt        = true,
            outputItemId = 6037,   -- Truesilver Bar
            quantity     = 60, color = "orange",
            materials = {
                { name = "Truesilver Ore", itemId = 7911, quantity = 60 },
            },
            notes = "Smelting route: Truesilver is a rare spawn in Iron/Mithril zones. Truesilver Bars used in Blacksmithing (Truesilver Rod) and Enchanting.",
        },
        {
            skillStart   = 250, skillEnd = 290,
            recipeName   = "Smelt Thorium",
            isAlt        = true,
            outputItemId = 12359,  -- Thorium Bar
            quantity     = 175, color = "orange",
            materials = {
                { name = "Thorium Ore", itemId = 10620, quantity = 175 },
            },
            notes = "Smelting route: 175x Thorium Ore → 175x Thorium Bar. Thorium Bars are used extensively in Blacksmithing (Imperial Plate set, Thorium Helm). Smelting stops giving skill at 290 - must mine after this.",
        },

        -- -- 275-300: Rich Thorium ---------------------------------
        {
            skillStart  = 290, skillEnd = 300,
            isGathering = true,
            zoneName    = "Winterspring / Eastern Plaguelands",
            herbs = {
                { name = "Thorium Ore", itemId = 10620 },
            },
            notes = "No smelting recipe gives skill points after 290 - you must mine nodes. Rich Thorium Veins require 275 skill and stay yellow through ~340. Both Winterspring and EPL have dense Rich Thorium routes.",
        },
        {
            isTrainer     = true,
            skillStart    = 275, skillEnd = 276,
            recipeName    = "Learn Master Mining",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Hurnak Grimmord at Honor Hold (A) or Krugosh at Thrallmar (H) in Hellfire Peninsula. Requires Mining 275. Also available from trainers in Shattrath.",
        },

        -- -- TBC: 300-325 Fel Iron ---------------------------------
        {
            skillStart  = 300, skillEnd = 325,
            isGathering = true,
            zoneName    = "Hellfire Peninsula",
            herbs = {
                { name = "Fel Iron Ore", itemId = 23424 },
            },
            notes = "Hellfire Peninsula is the only zone with Fel Iron - no other ore type spawns here so nodes are very dense. Run wide circuits across the open plains. Fel Iron gives skill all the way to 375 but less frequently after 325.",
        },

        -- -- TBC: 325-350 Adamantite ------------------------------
        {
            skillStart  = 325, skillEnd = 350,
            isGathering = true,
            zoneName    = "Zangarmarsh / Terokkar Forest",
            herbs = {
                { name = "Fel Iron Ore",   itemId = 23424 },
                { name = "Adamantite Ore", itemId = 23425 },
            },
            notes = "Adamantite Deposit requires 325 skill. Zangarmarsh and Terokkar both have good mixed routes. Continue picking up Fel Iron - it still gives skill points here.",
        },

        -- -- TBC: 350-375 Rich Adamantite / Khorium ---------------
        {
            skillStart  = 350, skillEnd = 375,
            isGathering = true,
            zoneName    = "Nagrand",
            herbs = {
                { name = "Adamantite Ore",      itemId = 23425 },
                { name = "Adamantite Ore", itemId = 23425 },
            },
            notes = "Nagrand has the best Adamantite density in Outland. Rich Adamantite Deposit requires 350 skill and drops Motes of Earth (~50% chance - 10 Motes = 1 Primal Earth). Run circuits through Sunspring Post, around Oshu'gun to Telaar, then north through Garadar. Khorium Veins (requires 375) occasionally spawn in place of Adamantite nodes across all Outland. Congratulations on 375!",
        },
    },
}
