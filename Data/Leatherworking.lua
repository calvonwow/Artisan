-- Artisan: Leatherworking Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/leatherworking-leveling-guide-burning-crusade-classic
-- Threads/dyes/salts are sold by Leatherworking Supply vendors near your trainer.

ArtisanData = ArtisanData or {}

ArtisanData["Leatherworking"] = {
    professionName = "Leatherworking",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Trade_LeatherWorking",

    steps = {
        -- -- 1-55: Apprentice ------------------------------------------
        {
            skillStart   = 1,  skillEnd = 20,
            recipeName   = "Light Leather",
            outputItemId = 2318,
            quantity     = 19, color = "orange",
            materials = {
                { name = "Ruined Leather Scraps", itemId = 2934, quantity = 57 },
            },
            notes = "3 Ruined Leather Scraps = 1 Light Leather. Start here if you have scraps from skinning. Skip to Light Armor Kit if you don't.",
        },
        {
            skillStart   = 20, skillEnd = 45,
            recipeName   = "Light Armor Kit",
            outputItemId = 2304,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Light Leather", itemId = 2318, quantity = 40 },
            },
        },
        {
            skillStart   = 45, skillEnd = 55,
            recipeName   = "Handstitched Leather Cloak",
            outputItemId = 7276,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Light Leather",  itemId = 2318, quantity = 40 },
                { name = "Coarse Thread",  itemId = 2320, quantity = 20 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Leatherworking",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Any Leatherworking trainer in a major city.",
        },

        -- -- 55-135: Journeyman ----------------------------------------
        {
            skillStart   = 55,  skillEnd = 100,
            recipeName   = "Embossed Leather Gloves",
            outputItemId = 4239,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Light Leather",  itemId = 2318, quantity = 150 },
                { name = "Coarse Thread",  itemId = 2320, quantity = 100 },
            },
        },
        {
            skillStart   = 100, skillEnd = 120,
            recipeName   = "Fine Leather Belt",
            outputItemId = 4246,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Light Leather",  itemId = 2318, quantity = 150 },
                { name = "Coarse Thread",  itemId = 2320, quantity = 50  },
            },
            notes = "Keep these - you may need some to make Dark Leather Belt at 120.",
        },
        {
            skillStart   = 120, skillEnd = 135,
            recipeName   = "Dark Leather Boots",
            outputItemId = 2315,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Medium Leather", itemId = 2319, quantity = 80 },
                { name = "Fine Thread",    itemId = 2321, quantity = 40 },
                { name = "Gray Dye",       itemId = 4340, quantity = 20 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Leatherworking",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Any Leatherworking trainer in a major city.",
        },

        -- -- 135-205: Expert -------------------------------------------
        {
            skillStart   = 135, skillEnd = 150,
            recipeName   = "Dark Leather Pants",
            outputItemId = 5961,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Medium Leather", itemId = 2319, quantity = 300 },
                { name = "Gray Dye",       itemId = 4340, quantity = 25  },
                { name = "Fine Thread",    itemId = 2321, quantity = 25  },
            },
        },
        {
            skillStart   = 150, skillEnd = 155,
            recipeName   = "Heavy Leather",
            outputItemId = 4234,
            quantity     = 7, color = "orange",
            materials = {
                { name = "Medium Leather", itemId = 2319, quantity = 35 },
            },
            notes = "5 Medium Leather → 1 Heavy Leather. Alt: Heavy Leather Ball if you have the pattern.",
        },
        {
            skillStart   = 155, skillEnd = 165,
            recipeName   = "Cured Heavy Hide",
            outputItemId = 4236,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Heavy Hide", itemId = 4235, quantity = 20 },
                { name = "Salt",       itemId = 4289, quantity = 60 },
            },
            notes = "Heavy Hide has a low drop rate - buy from AH. Save all 20 Cured Heavy Hide for Barbaric Shoulders and Guardian Gloves. Alt if no Heavy Hide: 35x Heavy Armor Kit (175 Heavy Leather, 155-180).",
        },
        {
            skillStart   = 165, skillEnd = 180,
            recipeName   = "Heavy Armor Kit",
            outputItemId = 4265,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Heavy Leather", itemId = 4234, quantity = 75 },
                { name = "Fine Thread",   itemId = 2321, quantity = 15 },
            },
        },
        {
            skillStart   = 180, skillEnd = 190,
            recipeName   = "Barbaric Shoulders",
            outputItemId = 5964,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Heavy Leather",    itemId = 4234, quantity = 80 },
                { name = "Cured Heavy Hide", itemId = 4236, quantity = 10 },
                { name = "Fine Thread",      itemId = 2321, quantity = 20 },
            },
        },
        {
            skillStart   = 190, skillEnd = 200,
            recipeName   = "Guardian Gloves",
            outputItemId = 5966,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Heavy Leather",    itemId = 4234, quantity = 40 },
                { name = "Cured Heavy Hide", itemId = 4236, quantity = 10 },
                { name = "Silken Thread",    itemId = 4291, quantity = 10 },
            },
        },
        {
            skillStart   = 200, skillEnd = 205,
            recipeName   = "Thick Armor Kit",
            outputItemId = 8173,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Thick Leather",  itemId = 4304, quantity = 25 },
                { name = "Silken Thread",  itemId = 4291, quantity = 5  },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Learn Artisan Leatherworking",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Any Leatherworking trainer in a major city. At skill 225 and level 40 you can specialize in Dragonscale, Elemental, or Tribal Leatherworking (optional).",
        },

        -- -- 205-300: Artisan ------------------------------------------
        {
            skillStart   = 205, skillEnd = 235,
            recipeName   = "Nightscape Headband",
            outputItemId = 8176,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Thick Leather",  itemId = 4304, quantity = 200 },
                { name = "Silken Thread",  itemId = 4291, quantity = 80  },
            },
            notes = "Sells to vendors for more than Thick Armor Kit. More Silken Thread cost but net cheaper.",
        },
        {
            skillStart   = 235, skillEnd = 250,
            recipeName   = "Nightscape Pants",
            outputItemId = 8193,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Thick Leather",  itemId = 4304, quantity = 210 },
                { name = "Silken Thread",  itemId = 4291, quantity = 60  },
            },
        },
        {
            skillStart   = 250, skillEnd = 265,
            recipeName   = "Rugged Armor Kit",
            outputItemId = 15564,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Rugged Leather", itemId = 8170, quantity = 125 },
            },
        },
        {
            skillStart   = 265, skillEnd = 290,
            recipeName   = "Wicked Leather Bracers",
            outputItemId = 15084,
            quantity     = 28, color = "orange",
            materials = {
                { name = "Rugged Leather", itemId = 8170, quantity = 224 },
                { name = "Black Dye",      itemId = 2325, quantity = 28  },
                { name = "Rune Thread",    itemId = 14341, quantity = 28 },
            },
        },
        {
            skillStart   = 290, skillEnd = 300,
            recipeName   = "Wicked Leather Headband",
            outputItemId = 15086,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Rugged Leather", itemId = 8170,  quantity = 120 },
                { name = "Black Dye",      itemId = 2325,  quantity = 10  },
                { name = "Rune Thread",    itemId = 14341, quantity = 10  },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Leatherworking",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Barim Spilthoof at Thrallmar (H) or Brumman at Honor Hold (A) in Hellfire Peninsula. Also available from Darmari in Shattrath City.",
        },

        -- -- 300-375: Master (TBC) -------------------------------------
        {
            skillStart   = 300, skillEnd = 325,
            recipeName   = "Knothide Armor Kit",
            outputItemId = 25650,
            quantity     = 30, color = "yellow",
            materials = {
                { name = "Knothide Leather", itemId = 21887, quantity = 120 },
            },
            notes = "First convert any Knothide Leather Scraps to Knothide Leather at your trainer. Yellow recipe - may need a few extra. Alt: Wicked Leather Belt up to 325 if Rugged Leather is cheap (~400x needed).",
        },
        {
            skillStart   = 325, skillEnd = 335,
            recipeName   = "Heavy Knothide Leather",
            outputItemId = 23793,
            quantity     = 222, color = "orange",
            materials = {
                { name = "Knothide Leather", itemId = 21887, quantity = 1110 },
            },
            notes = "Pattern: Heavy Knothide Leather is sold by Cro Threadstrong in Shattrath City (limited supply - 2-6 min respawn). You only need ~222 for later steps; stop at 335 and craft more as needed.",
        },
        {
            skillStart   = 335, skillEnd = 350,
            recipeName   = "Thick Draenic Vest",
            outputItemId = 25671,
            quantity     = 20, color = "yellow",
            materials = {
                { name = "Knothide Leather", itemId = 21887, quantity = 280 },
                { name = "Rune Thread",      itemId = 14341, quantity = 60  },
            },
            notes = "Yellow for 10 points - may need a few extra to reach 350. Rune Thread sold by LW supply vendors.",
        },
        {
            skillStart   = 350, skillEnd = 365,
            recipeName   = "Heavy Knothide Armor Kit",
            outputItemId = 34330,
            quantity     = 50, color = "yellow",
            materials = {
                { name = "Heavy Knothide Leather", itemId = 23793, quantity = 150 },
            },
            notes = "Green for the last 5 points - quantity varies (usually 35-60). Good consumable for pre-raid gearing.",
        },
        {
            skillStart   = 365, skillEnd = 370,
            recipeName   = "Drums of Battle",
            outputItemId = 29529,
            quantity     = 6, color = "yellow",
            materials = {
                { name = "Heavy Knothide Leather",   itemId = 23793, quantity = 36 },
                { name = "Thick Clefthoof Leather",  itemId = 25708, quantity = 24 },
            },
            notes = "Recipe sold by Almaador in Shattrath City (Terrace of Light). Requires Honored with The Sha'tar. Drums of Battle are a valuable raiding consumable.",
        },
        {
            skillStart   = 370, skillEnd = 375,
            recipeName   = "Drums of Panic",
            outputItemId = 29532,
            quantity     = 6, color = "yellow",
            materials = {
                { name = "Heavy Knothide Leather", itemId = 23793, quantity = 36 },
                { name = "Fel Hide",               itemId = 25707, quantity = 24 },
            },
            notes = "Recipe sold by Alurmi inside Caverns of Time. Requires Honored with Keepers of Time. Yellow - may need 1-2 extra. Congratulations on 375!",
        },
    },
}
