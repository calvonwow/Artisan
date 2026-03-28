-- Artisan: Cooking Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/cooking-leveling-guide-tbc-classic
-- Spices, flour, and water are sold by Cooking Supply vendors near trainers.
-- Artisan Cooking requires completing the Clamlette Surprise quest at skill 225.

ArtisanData = ArtisanData or {}

ArtisanData["Cooking"] = {
    professionName = "Cooking",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\INV_Misc_Food_15",

    steps = {
        -- -- 1-65: Apprentice ------------------------------------------
        {
            skillStart   = 1,  skillEnd = 40,
            recipeName   = "Spice Bread",
            outputItemId = 30816,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Simple Flour", itemId = 30817, quantity = 60 },
                { name = "Mild Spices",  itemId = 2678,  quantity = 60 },
            },
            notes = "Both materials sold by Cooking Supply vendors near your trainer. Do NOT buy from AH.",
        },
        {
            skillStart   = 40, skillEnd = 65,
            recipeName   = "Roasted Boar Meat",
            outputItemId = 2681,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Chunk of Boar Meat", itemId = 769, quantity = 35 },
            },
            notes = "Alt: Spiced Wolf Meat (35x Stringy Wolf Meat), Smoked Bear Meat (25x Bear Meat - recipe from vendors), or any fish recipe from fishing vendors. All Journeyman-learnable trainer recipes work here.",
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Cooking",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Available from any Cooking trainer in a major city. Requires level 10.",
        },

        -- -- 65-130: Journeyman ----------------------------------------
        {
            skillStart   = 65, skillEnd = 110,
            recipeName   = "Boiled Clams",
            outputItemId = 5525,
            quantity     = 65, color = "orange",
            materials = {
                { name = "Clam Meat",           itemId = 5503, quantity = 65 },
                { name = "Refreshing Spring Water", itemId = 159, quantity = 65 },
            },
            notes = "Clam Meat drops from crabs and clams in coastal zones. Alt: Coyote Steak (65x Coyote Meat), Longjaw Mud Snapper (65x raw fish from fishing vendors). Use whichever meat is cheapest.",
        },
        {
            skillStart   = 110, skillEnd = 130,
            recipeName   = "Crab Cake",
            outputItemId = 2683,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Crawler Meat", itemId = 2674, quantity = 25 },
                { name = "Mild Spices",  itemId = 2678, quantity = 25 },
            },
            notes = "Alt: Dry Pork Ribs (25x Boar Ribs, 25x Mild Spices). Use trainer recipe.",
        },

        -- -- 130-225: Expert -------------------------------------------
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Cooking (Book)",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Buy 'Expert Cookbook' from Wulan (H) in Desolace (Shadowprey Village) or Shandrina (A) in Ashenvale. Also buy 'Recipe: Roast Raptor' from Hammon Karwn (A) or Keena (H) in Arathi Highlands for 175-225.",
        },
        {
            skillStart   = 130, skillEnd = 175,
            recipeName   = "Curiously Tasty Omelet",
            outputItemId = 3665,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Raptor Egg", itemId = 3685, quantity = 50 },
            },
            notes = "Recipe sold by Kendor Kabonka in Stormwind City (A) or Keena in Arathi Highlands (H). Raptor Eggs drop from all raptors. Alt: Bristle Whisker Catfish (50x raw fish, recipe from fishing vendors).",
        },
        {
            skillStart   = 175, skillEnd = 225,
            recipeName   = "Roast Raptor",
            outputItemId = 12210,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Raptor Flesh", itemId = 12184, quantity = 50 },
            },
            notes = "Recipe sold by Hammon Karwn (A) or Keena (H) in Arathi Highlands. Raptor Flesh drops from higher-level raptors (Stranglethorn Vale, Un'Goro). Alt: Soothing Turtle Bisque (50x Turtle Meat, quest recipe) or Mithril Headed Trout.",
        },

        -- -- 225-300: Artisan ------------------------------------------
        {
            isTrainer     = true,
            skillStart    = 225, skillEnd = 226,
            recipeName    = "Learn Artisan Cooking (Quest)",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Complete the 'Clamlette Surprise' quest in Gadgetzan, Tanaris. Requires: 12x Giant Egg, 10x Zesty Clam Meat, 20x Alterac Swiss. Start from Zamja in Orgrimmar (H) or Daryl Riknussun in Ironforge (A). Bring your leveling mats with you.",
        },
        {
            skillStart   = 225, skillEnd = 250,
            recipeName   = "Monster Omelet",
            outputItemId = 12218,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Giant Egg", itemId = 12207, quantity = 25 },
            },
            notes = "Recipe from Himmik in Winterspring (Everlook inn), Malygen (A) or Bale (H) in Felwood. Giant Eggs drop from Owlbeasts in Winterspring and Hinterlands. Alt: Spotted Yellowtail (25x raw fish), Tender Wolf Steak (25x Tender Wolf Meat).",
        },
        {
            skillStart   = 250, skillEnd = 285,
            recipeName   = "Juicy Bear Burger",
            outputItemId = 35565,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Bear Flank", itemId = 35562, quantity = 40 },
            },
            notes = "Recipe from Bale (H) or Malygen (A) in Felwood. Bear Flank drops from bears at ~50% rate. Alt: Runn Tum Tuber Surprise (Giant Mushroom) if you have access.",
        },
        {
            skillStart   = 285, skillEnd = 300,
            recipeName   = "Tender Wolf Steak",
            outputItemId = 18045,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Tender Wolf Meat", itemId = 12208, quantity = 20 },
            },
            notes = "Recipe from Dirge Quikcleave in Gadgetzan, Tanaris. Tender Wolf Meat drops from wolves in high-level zones.",
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Cooking",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "The Rokk in Shattrath City (Lower City, Horde/Alliance). Also offers a daily cooking quest that rewards rare recipes. Learn all available Outland recipes while you're there.",
        },

        -- -- 300-375: Master (TBC) -------------------------------------
        {
            skillStart   = 300, skillEnd = 325,
            recipeName   = "Ravager Dog",
            outputItemId = 27655,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Ravager Flesh", itemId = 27674, quantity = 35 },
            },
            notes = "Recipe from Innkeeper Biribi (H) or Innkeeper Kerp (A) in Hellfire Peninsula, or various vendors in Outland. Ravager Flesh drops from Ravagers in HFP - easy to farm while leveling.",
        },
        {
            skillStart   = 325, skillEnd = 350,
            recipeName   = "Roasted Clefthoof",
            outputItemId = 27658,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Clefthoof Meat", itemId = 27678, quantity = 35 },
            },
            notes = "Recipe from various Outland vendors. Clefthoof Meat drops from Clefthoofs in Nagrand (excellent farming area). Alt: Talbuk Steak (35x Talbuk Venison from Nagrand Talbuk mobs).",
        },
        {
            skillStart   = 350, skillEnd = 365,
            recipeName   = "Crunchy Serpent",
            outputItemId = 31673,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Serpent Flesh", itemId = 31671, quantity = 20 },
            },
            notes = "Recipe from various Outland vendors. Serpent Flesh drops from snakes and serpents throughout Outland. Alt: Warp Burger (20x Warped Flesh from Warp Stalkers in Terokkar).",
        },
        {
            skillStart   = 365, skillEnd = 375,
            recipeName   = "Mok'Nathal Short Ribs",
            outputItemId = 31672,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Mok'Nathal Shortrib", itemId = 38867, quantity = 15 },
            },
            notes = "Recipe from Gnil Mok'nathal (H) in Blade's Edge Mountains at Mok'Nathal Village or from Cooking daily quest rewards. Mok'Nathal Shortrib drops from the Blade's Edge bear mobs. Alt: Spicy Crawdad (fish from Highland Mixed Schools in Terokkar) if you have Fishing. Congratulations on 375!",
        },
    },
}
