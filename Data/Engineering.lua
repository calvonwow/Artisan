-- Artisan: Engineering Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/engineering-leveling-guide-burning-crusade-classic
-- Intermediate items (Bolts, Casings, Frames, etc.) are crafted in bulk early
-- so they appear as isCrafted in the shopping list rather than showing AH prices.

ArtisanData = ArtisanData or {}

ArtisanData["Engineering"] = {
    professionName = "Engineering",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Trade_Engineering",

    steps = {
        -- -- 1-75: Apprentice ------------------------------------------
        {
            skillStart   = 1,  skillEnd = 30,
            recipeName   = "Rough Blasting Powder",
            outputItemId = 4357,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Rough Stone", itemId = 2835, quantity = 60 },
            },
            notes = "Save all 60 - you'll need them for Rough Copper Bombs at 51.",
        },
        {
            skillStart   = 30, skillEnd = 50,
            recipeName   = "Handful of Copper Bolts",
            outputItemId = 4359,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Copper Bar", itemId = 2840, quantity = 30 },
            },
            notes = "Save all 30 - needed for Rough Copper Bomb.",
        },
        {
            skillStart   = 50, skillEnd = 51,
            recipeName   = "Arclight Spanner",
            outputItemId = 6219,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Copper Bar", itemId = 2840, quantity = 6 },
            },
            notes = "Required tool - keep it in your bags at all times or you can't craft Engineering items.",
        },
        {
            skillStart   = 51, skillEnd = 75,
            recipeName   = "Rough Copper Bomb",
            outputItemId = 4360,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Copper Bar",               itemId = 2840, quantity = 30 },
                { name = "Handful of Copper Bolts",  itemId = 4359, quantity = 30 },
                { name = "Rough Blasting Powder",    itemId = 4357, quantity = 60 },
                { name = "Linen Cloth",              itemId = 2589, quantity = 30 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Engineering",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Any Engineering trainer in a major city. Gnomes receive +15 Engineering skill from their racial, letting recipes stay orange 15 extra points.",
        },

        -- -- 75-135: Journeyman ----------------------------------------
        {
            skillStart   = 75,  skillEnd = 90,
            recipeName   = "Coarse Blasting Powder",
            outputItemId = 4364,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Coarse Stone", itemId = 2836, quantity = 60 },
            },
            notes = "Save all 60 - needed for Coarse Dynamite.",
        },
        {
            skillStart   = 90,  skillEnd = 100,
            recipeName   = "Coarse Dynamite",
            outputItemId = 4365,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Coarse Blasting Powder", itemId = 4364, quantity = 60 },
                { name = "Linen Cloth",            itemId = 2589, quantity = 20 },
            },
        },
        {
            skillStart   = 100, skillEnd = 105,
            recipeName   = "Silver Contact",
            outputItemId = 4404,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Silver Bar", itemId = 2842, quantity = 5 },
            },
            notes = "Silver Contacts are used in mid-level Engineering crafts. Alt: Flying Tiger Goggles if Silver Bar is expensive.",
        },
        {
            skillStart   = 105, skillEnd = 125,
            recipeName   = "Bronze Tube",
            outputItemId = 4371,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Bronze Bar",  itemId = 2841, quantity = 50 },
                { name = "Weak Flux",   itemId = 2880, quantity = 25 },
            },
            notes = "Weak Flux is sold by Engineering Supply vendors near your trainer. Save all tubes - needed for Standard Scope.",
        },
        {
            skillStart   = 125, skillEnd = 135,
            recipeName   = "Standard Scope",
            outputItemId = 4406,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Bronze Tube",  itemId = 4371, quantity = 10 },
                { name = "Moss Agate",   itemId = 1206, quantity = 10 },
            },
            notes = "Alt: Heavy Blasting Powder (1x Heavy Stone each) if Moss Agate is expensive.",
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Engineering",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Any Engineering trainer in a major city.",
        },

        -- -- 135-200: Expert -------------------------------------------
        {
            skillStart   = 135, skillEnd = 155,
            recipeName   = "Heavy Blasting Powder & Whirring Bronze Gizmo",
            outputItemId = 4375,
            quantity     = 45, color = "orange",
            materials = {
                { name = "Heavy Stone",  itemId = 2838, quantity = 30 },
                { name = "Bronze Bar",   itemId = 2841, quantity = 30 },
                { name = "Wool Cloth",   itemId = 2592, quantity = 15 },
            },
            notes = "Make 30x Heavy Blasting Powder AND 15x Whirring Bronze Gizmo simultaneously. Save both - they're used for Explosive Sheep at 160.",
        },
        {
            skillStart   = 155, skillEnd = 175,
            recipeName   = "Bronze Framework",
            outputItemId = 4382,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Bronze Bar",      itemId = 2841, quantity = 30 },
                { name = "Medium Leather",  itemId = 2319, quantity = 15 },
                { name = "Wool Cloth",      itemId = 2592, quantity = 15 },
            },
            notes = "Save all - needed for Explosive Sheep at 160.",
        },
        {
            skillStart   = 160, skillEnd = 175,
            recipeName   = "Explosive Sheep",
            outputItemId = 4384,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Heavy Blasting Powder", itemId = 4377, quantity = 30 },
                { name = "Whirring Bronze Gizmo", itemId = 4375, quantity = 15 },
                { name = "Bronze Framework",      itemId = 4382, quantity = 15 },
                { name = "Wool Cloth",            itemId = 2592, quantity = 30 },
            },
            notes = "Keep 5x Explosive Sheep if choosing Goblin Engineering at 200.",
        },
        {
            skillStart   = 175, skillEnd = 194,
            recipeName   = "Solid Blasting Powder",
            outputItemId = 10505,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Solid Stone", itemId = 7912, quantity = 120 },
            },
            notes = "Save all 60 - needed for Mithril-tier bombs at 238.",
        },
        {
            skillStart   = 194, skillEnd = 195,
            recipeName   = "Gyromatic Micro-Adjustor",
            outputItemId = 10498,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Steel Bar", itemId = 3859, quantity = 4 },
            },
            notes = "Required tool for many high-level Engineering recipes. Keep it in your bags alongside the Arclight Spanner.",
        },
        {
            skillStart   = 195, skillEnd = 200,
            recipeName   = "Mithril Tube",
            outputItemId = 10559,
            quantity     = 7, color = "orange",
            materials = {
                { name = "Mithril Bar", itemId = 3860, quantity = 21 },
            },
            notes = "Stop at 200. Keep 6x Mithril Tube - needed if you choose Gnomish Engineering.",
        },
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Learn Artisan Engineering",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Any Engineering trainer in a major city. At skill 200 and level 30 you can specialize in Gnomish or Goblin Engineering - both paths have powerful unique items.",
        },

        -- -- 200-300: Artisan ------------------------------------------
        {
            skillStart   = 200, skillEnd = 215,
            recipeName   = "Unstable Trigger",
            outputItemId = 10560,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Mithril Bar",          itemId = 3860, quantity = 20 },
                { name = "Mageweave Cloth",      itemId = 4338, quantity = 20 },
                { name = "Solid Blasting Powder", itemId = 10505, quantity = 20 },
            },
            notes = "Save all 20 - needed for Hi-Explosive Bomb at 238.",
        },
        {
            skillStart   = 215, skillEnd = 238,
            recipeName   = "Mithril Casing",
            outputItemId = 10561,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Mithril Bar", itemId = 3860, quantity = 120 },
            },
            notes = "Save all 40 - needed for Hi-Explosive Bomb.",
        },
        {
            skillStart   = 238, skillEnd = 250,
            recipeName   = "Hi-Explosive Bomb",
            outputItemId = 10562,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Mithril Casing",       itemId = 10561, quantity = 40 },
                { name = "Unstable Trigger",     itemId = 10560, quantity = 20 },
                { name = "Solid Blasting Powder", itemId = 10505, quantity = 40 },
            },
        },
        {
            skillStart   = 250, skillEnd = 260,
            recipeName   = "Dense Blasting Powder",
            outputItemId = 15992,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Dense Stone", itemId = 12365, quantity = 60 },
            },
            notes = "Make at least 30; keep at least 15 for Thorium Shells at 285.",
        },
        {
            skillStart   = 260, skillEnd = 285,
            recipeName   = "Thorium Widget",
            outputItemId = 15994,
            quantity     = 35, color = "yellow",
            materials = {
                { name = "Thorium Bar",  itemId = 12359, quantity = 105 },
                { name = "Runecloth",    itemId = 14047, quantity = 35  },
            },
            notes = "Yellow for the last few points - may need to make a few extra to reach 285.",
        },
        {
            skillStart   = 285, skillEnd = 300,
            recipeName   = "Thorium Shells",
            outputItemId = 15993,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Thorium Bar",          itemId = 12359, quantity = 30 },
                { name = "Dense Blasting Powder", itemId = 15992, quantity = 15 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Engineering",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Lebowski at Honor Hold (A) or Zebig at Thrallmar (H) in Hellfire Peninsula. Also K. Lee Smallfry (A) at Telredor and Mack Diver (H) at Zabra'jin in Zangarmarsh.",
        },

        -- -- 300-375: Master (TBC) -------------------------------------
        -- Craft intermediates first - they're used in all later recipes.
        -- These appear as "Crafted" in the shopping list (not purchased).
        {
            skillStart   = 300, skillEnd = 310,
            recipeName   = "Handful of Fel Iron Bolts (bulk)",
            outputItemId = 23783,
            quantity     = 114, color = "orange",
            materials = {
                { name = "Fel Iron Bar", itemId = 23445, quantity = 114 },
            },
            notes = "Craft all 114 now - used in Fel Iron Bomb (320) and Adamantite Rifle (360-370). Free skill points.",
        },
        {
            skillStart   = 305, skillEnd = 310,
            recipeName   = "Elemental Blasting Powder (bulk)",
            outputItemId = 23781,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Mote of Fire",  itemId = 22574, quantity = 20 },
                { name = "Mote of Earth", itemId = 22573, quantity = 40 },
            },
            notes = "Each craft produces 4 powder, giving 80 total. Used in Fel Iron Bomb (320) and White Smoke Flare (335-355). Free skill points.",
        },
        {
            skillStart   = 307, skillEnd = 318,
            recipeName   = "Fel Iron Casing (bulk)",
            outputItemId = 23782,
            quantity     = 52, color = "orange",
            materials = {
                { name = "Fel Iron Bar", itemId = 23445, quantity = 156 },
            },
            notes = "Craft all 52 now - used in Fel Iron Bomb (320) and Adamantite Rifle (360-370). Free skill points.",
        },
        {
            skillStart   = 320, skillEnd = 325,
            recipeName   = "Fel Iron Bomb",
            outputItemId = 23736,
            quantity     = 7, color = "orange",
            materials = {
                { name = "Fel Iron Casing",          itemId = 23782, quantity = 14 },
                { name = "Handful of Fel Iron Bolts", itemId = 23783, quantity = 14 },
                { name = "Elemental Blasting Powder", itemId = 23781, quantity = 7  },
            },
        },
        {
            skillStart   = 325, skillEnd = 335,
            recipeName   = "Adamantite Frame",
            outputItemId = 23784,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Adamantite Bar", itemId = 23446, quantity = 120 },
                { name = "Primal Earth",   itemId = 22452, quantity = 30  },
            },
            notes = "Craft all 30 now - used in Adamantite Rifle (360-370). You can stop at 335 and make more later. Alt if unlucky: a few Adamantite Grenades (spell 30311).",
        },
        {
            skillStart   = 335, skillEnd = 355,
            recipeName   = "White Smoke Flare",
            outputItemId = 23768,
            quantity     = 70, color = "yellow",
            materials = {
                { name = "Elemental Blasting Powder", itemId = 23781, quantity = 70 },
                { name = "Netherweave Cloth",          itemId = 21877, quantity = 70 },
            },
            notes = "Recipe is sold by Wind Trader Lathrai in Shattrath City and Captured Gnome/Feera/Yatheon (limited supply). This will be green for most of it - approximate quantity.",
        },
        {
            skillStart   = 355, skillEnd = 360,
            recipeName   = "Khorium Power Core",
            outputItemId = 23786,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Khorium Bar",  itemId = 23449, quantity = 15 },
                { name = "Primal Fire",  itemId = 21884, quantity = 5  },
            },
            notes = "Save all 5 - each one is used in the Field Repair Bot 110G at 370-375.",
        },
        {
            skillStart   = 360, skillEnd = 370,
            recipeName   = "Adamantite Rifle",
            outputItemId = 23746,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Fel Iron Casing",           itemId = 23782, quantity = 45 },
                { name = "Adamantite Frame",          itemId = 23784, quantity = 30 },
                { name = "Handful of Fel Iron Bolts", itemId = 23783, quantity = 60 },
            },
            notes = "Recipe sold by Viggz Shinesparked in Shattrath City, or Feera (A)/Yatheon (H) - limited supply. Yellow recipe, may need a few extra.",
        },
        {
            skillStart   = 370, skillEnd = 375,
            recipeName   = "Field Repair Bot 110G",
            outputItemId = 34113,
            quantity     = 5, color = "yellow",
            materials = {
                { name = "Adamantite Bar",            itemId = 23446, quantity = 40 },
                { name = "Handful of Fel Iron Bolts", itemId = 23783, quantity = 40 },
                { name = "Khorium Power Core",        itemId = 23786, quantity = 5  },
            },
            notes = "Yellow recipe - may need to make more than 5. Congratulations on 375!",
        },
    },
}
