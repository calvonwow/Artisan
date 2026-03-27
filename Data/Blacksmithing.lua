-- Artisan: Blacksmithing Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/blacksmithing-leveling-guide-burning-crusade-classic
-- Grinding Stones are intermediate products - make them as needed.
-- Steel Bar = 1x Iron Bar + 1x Coal (smelt at forge; Coal sold by BS Supply vendors).

ArtisanData = ArtisanData or {}

ArtisanData["Blacksmithing"] = {
    professionName = "Blacksmithing",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Trade_BlackSmithing",

    steps = {
        -- -- 1-75: Apprentice ------------------------------------
        {
            skillStart   = 1,  skillEnd = 30,
            recipeName   = "Rough Sharpening Stone",
            outputItemId = 2862,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Rough Stone", itemId = 2835, quantity = 40 },
            },
        },
        {
            skillStart   = 30, skillEnd = 65,
            recipeName   = "Rough Grinding Stone",
            outputItemId = 3470,
            quantity     = 55, color = "orange",
            materials = {
                { name = "Rough Stone", itemId = 2835, quantity = 110 },
            },
            notes = "Save the Rough Grinding Stones - needed later for Silver Rod.",
        },
        {
            skillStart   = 65, skillEnd = 75,
            recipeName   = "Coarse Sharpening Stone",
            outputItemId = 2863,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Coarse Stone", itemId = 2836, quantity = 25 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Blacksmithing",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Available from any Blacksmithing trainer in a major city.",
        },

        -- -- 75-125: Journeyman ----------------------------------
        {
            skillStart   = 75, skillEnd = 90,
            recipeName   = "Coarse Grinding Stone",
            outputItemId = 3478,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Coarse Stone", itemId = 2836, quantity = 70 },
            },
            notes = "Save all Coarse Grinding Stones - needed for Patterned Bronze Bracers and Golden Rod.",
        },
        {
            skillStart   = 90, skillEnd = 100,
            recipeName   = "Runed Copper Belt",
            outputItemId = 2857,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Copper Bar", itemId = 2840, quantity = 100 },
            },
        },
        {
            skillStart   = 100, skillEnd = 105,
            recipeName   = "Silver Rod",
            outputItemId = 6338,
            quantity     = 5,  color = "orange",
            materials = {
                { name = "Silver Bar",          itemId = 2842, quantity = 5  },
                { name = "Rough Grinding Stone", itemId = 3470, quantity = 10 },
            },
            notes = "Silver Rod is used as a material in Enchanting rods - sells well on AH. Skip and make more Runed Copper Belts if you have no Silver Bars.",
        },
        {
            skillStart   = 105, skillEnd = 110,
            recipeName   = "Runed Copper Belt",
            outputItemId = 2857,
            quantity     = 5,  color = "orange",
            materials = {
                { name = "Copper Bar", itemId = 2840, quantity = 50 },
            },
        },
        {
            skillStart   = 110, skillEnd = 125,
            recipeName   = "Rough Bronze Leggings",
            outputItemId = 2865,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Bronze Bar", itemId = 2841, quantity = 90 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Blacksmithing",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Available from any Blacksmithing trainer in a major city.",
        },

        -- -- 125-225: Expert -------------------------------------
        {
            skillStart   = 125, skillEnd = 140,
            recipeName   = "Heavy Grinding Stone",
            outputItemId = 3486,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Heavy Stone", itemId = 2838, quantity = 105 },
            },
            notes = "Save all Heavy Grinding Stones - needed for Iron and Steel items ahead.",
        },
        {
            skillStart   = 140, skillEnd = 150,
            recipeName   = "Patterned Bronze Bracers",
            outputItemId = 2868,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Bronze Bar",          itemId = 2841, quantity = 50 },
                { name = "Coarse Grinding Stone", itemId = 3478, quantity = 20 },
            },
        },
        {
            skillStart   = 150, skillEnd = 155,
            recipeName   = "Golden Rod",
            outputItemId = 11128,
            quantity     = 5,  color = "orange",
            materials = {
                { name = "Gold Bar",             itemId = 3577, quantity = 5  },
                { name = "Coarse Grinding Stone", itemId = 3478, quantity = 10 },
            },
            notes = "Golden Rod is used for Enchanting rods - sells well on AH.",
        },
        {
            skillStart   = 155, skillEnd = 165,
            recipeName   = "Green Iron Leggings",
            outputItemId = 3842,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Iron Bar",           itemId = 3575, quantity = 80 },
                { name = "Heavy Grinding Stone", itemId = 3486, quantity = 10 },
                { name = "Green Dye",           itemId = 2605, quantity = 10 },
            },
            notes = "Green Dye is sold by Tailoring and Leatherworking supply vendors.",
        },
        {
            skillStart   = 165, skillEnd = 190,
            recipeName   = "Green Iron Bracers",
            outputItemId = 3835,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Iron Bar",   itemId = 3575, quantity = 150 },
                { name = "Green Dye", itemId = 2605, quantity = 25  },
            },
        },
        {
            skillStart   = 190, skillEnd = 200,
            recipeName   = "Golden Scale Bracers",
            outputItemId = 6040,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Steel Bar",           itemId = 3859, quantity = 50 },
                { name = "Heavy Grinding Stone", itemId = 3486, quantity = 20 },
            },
            notes = "Alliance players: save 6 of these for the Armorsmithing specialization quest.",
        },
        {
            skillStart   = 200, skillEnd = 210,
            recipeName   = "Solid Grinding Stone",
            outputItemId = 7966,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Solid Stone", itemId = 7912, quantity = 120 },
            },
            notes = "Keep at least 10 Solid Grinding Stones for the 225-235 Steel Plate Helm step.",
        },
        {
            skillStart   = 210, skillEnd = 225,
            recipeName   = "Heavy Mithril Gauntlet",
            outputItemId = 7919,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Mithril Bar",      itemId = 3860, quantity = 90 },
                { name = "Mageweave Cloth",  itemId = 4338, quantity = 60 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 225, skillEnd = 226,
            recipeName    = "Learn Artisan Blacksmithing",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Available from any Blacksmithing trainer in a major city.",
        },
        -- Optional specialization step
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Choose Specialization (Optional)",
            charLevel     = 40,
            notes         = "At skill 200 and character level 40 you can specialize in Armorsmithing or Weaponsmithing to craft powerful gear. This is completely optional and can be done later. See the Blacksmithing Specializations guide on wow-professions.com for full details on each path.",
        },

        -- -- 225-300: Artisan ------------------------------------
        {
            skillStart   = 225, skillEnd = 235,
            recipeName   = "Steel Plate Helm",
            outputItemId = 7922,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Steel Bar",           itemId = 3859, quantity = 140 },
                { name = "Solid Grinding Stone", itemId = 7966, quantity = 10  },
            },
            notes = "Horde players: save 4 Steel Plate Helms for the Armorsmithing specialization quest.",
        },
        {
            skillStart   = 235, skillEnd = 250,
            recipeName   = "Mithril Spurs",
            outputItemId = 7969,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Mithril Bar",          itemId = 3860, quantity = 60 },
                { name = "Solid Grinding Stone",  itemId = 7966, quantity = 45 },
            },
            notes = "Plans: Mithril Spurs is an AH world drop - check AH first. Alt: 15x Mithril Coif (150 Mithril Bar, 90 Mageweave Cloth).",
        },
        {
            skillStart   = 250, skillEnd = 260,
            recipeName   = "Dense Sharpening Stone",
            outputItemId = 12404,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Dense Stone", itemId = 12365, quantity = 20 },
            },
        },
        {
            skillStart   = 260, skillEnd = 270,
            recipeName   = "Mithril Spurs",
            outputItemId = 7969,
            quantity     = 20, color = "yellow",
            materials = {
                { name = "Mithril Bar",          itemId = 3860, quantity = 80 },
                { name = "Solid Grinding Stone",  itemId = 7966, quantity = 60 },
            },
            notes = "Yellow - recipe goes green at 265, may need several extra. Alt (trainer): 8x Heavy Mithril Boots (112 Mithril Bar, 32 Thick Leather).",
        },
        {
            skillStart   = 270, skillEnd = 295,
            recipeName   = "Imperial Plate Bracers",
            outputItemId = 12425,
            quantity     = 25, color = "yellow",
            materials = {
                { name = "Thorium Bar", itemId = 12359, quantity = 300 },
            },
            notes = "Get the recipe from Derotain Mudsipper in Tanaris (requires level 50, skill 265+). Bring 40x Thorium Bar to unlock the Imperial Plate quest chain.",
        },
        {
            skillStart   = 295, skillEnd = 300,
            recipeName   = "Thorium Helm",
            outputItemId = 12410,
            quantity     = 5,  color = "yellow",
            materials = {
                { name = "Thorium Bar",         itemId = 12359, quantity = 120 },
                { name = "Star Ruby",            itemId = 7910,  quantity = 5   },
                { name = "Yellow Power Crystal", itemId = 11188, quantity = 20  },
            },
            notes = "Plans: Thorium Helm is a world drop — check the AH. Yellow recipe. Alt: continue crafting Imperial Plate Bracers to reach 300.",
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Blacksmithing",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Rohok at Thrallmar (H) or Humphry at Honor Hold (A) in Hellfire Peninsula.",
        },

        -- -- 300-375: Master (TBC) -------------------------------
        {
            skillStart   = 300, skillEnd = 310,
            recipeName   = "Fel Iron Chain Coif",
            outputItemId = 23493,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Fel Iron Bar", itemId = 23445, quantity = 40 },
            },
            notes = "Any Fel Iron recipe from your trainer works here. Pick whichever is cheapest to craft.",
        },
        {
            skillStart   = 310, skillEnd = 320,
            recipeName   = "Fel Iron Breastplate",
            outputItemId = 23489,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Fel Iron Bar", itemId = 23445, quantity = 120 },
            },
        },
        {
            skillStart   = 320, skillEnd = 335,
            recipeName   = "Adamantite Sharpening Stone",
            outputItemId = 23529,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Adamantite Bar", itemId = 23446, quantity = 60 },
                { name = "Primal Earth",   itemId = 22452, quantity = 30 },
            },
            notes = "Adamantite Sharpening Stone is a strong consumable - sells consistently on AH.",
        },
        {
            skillStart   = 335, skillEnd = 350,
            recipeName   = "Adamantite Rapier",
            outputItemId = 23505,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Adamantite Bar", itemId = 23446, quantity = 180 },
            },
            notes = "Yellow recipe - goes yellow at 345, make 20 if unlucky.",
        },
        {
            skillStart   = 350, skillEnd = 360,
            recipeName   = "Adamantite Sharpening Stone",
            outputItemId = 23529,
            quantity     = 30, color = "yellow",
            materials = {
                { name = "Adamantite Bar", itemId = 23446, quantity = 30  },
                { name = "Mote of Earth",  itemId = 22573, quantity = 60  },
            },
            notes = "Yellow - Mote of Earth drops from Adamantite nodes in Outland (10 Motes = 1 Primal Earth).",
        },
        {
            skillStart   = 360, skillEnd = 375,
            recipeName   = "Khorium Belt",
            outputItemId = 23524,
            quantity     = 10, color = "yellow",
            materials = {
                { name = "Khorium Bar",  itemId = 23449, quantity = 50 },
                { name = "Primal Water", itemId = 21885, quantity = 35 },
                { name = "Primal Mana",  itemId = 22457, quantity = 35 },
            },
            notes = "Plans from Aldor/Scryer quartermaster at Revered. Alt: Felsteel Gloves (Plans drop in Auchenai Crypts, only 6x Felsteel Bar each and sell well). Congratulations on 375!",
        },
    },
}
