-- Artisan: Tailoring Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/tailoring-leveling-guide-burning-crusade-classic
-- All outputItemIds verified on wowhead.com/tbc
-- Items omitting outputItemId fall back to the Tailoring profession icon.

ArtisanData = ArtisanData or {}

ArtisanData["Tailoring"] = {
    professionName = "Tailoring",
    icon           = "Interface\\Icons\\Trade_Tailoring",
    maxSkill       = 375,

    steps = {
        -- -- 1-75: Linen -----------------------------------------
        {
            skillStart   = 1,  skillEnd = 45,
            recipeName   = "Bolt of Linen Cloth",
            outputItemId = 2996,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Linen Cloth", itemId = 2589, quantity = 120 },
            },
            notes = "Stop making these if you reach 45. You will need more later so keep them.",
        },
        {
            skillStart   = 40, skillEnd = 67,
            recipeName   = "Linen Belt",
            outputItemId = 7026,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Bolt of Linen Cloth", itemId = 2996, quantity = 35 },
                { name = "Coarse Thread",        itemId = 2320, quantity = 35 },
            },
        },
        {
            skillStart   = 67, skillEnd = 75,
            recipeName   = "Reinforced Linen Cape",
            outputItemId = 2580,
            quantity     = 8, color = "orange",
            materials = {
                { name = "Bolt of Linen Cloth", itemId = 2996, quantity = 16 },
                { name = "Coarse Thread",        itemId = 2320, quantity = 24 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 75, skillEnd = 76,
            recipeName    = "Learn Journeyman Tailoring",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Available from any Tailoring trainer in a major city. You can vendor remaining Coarse Thread - you won't need it again.",
        },

        -- -- 75-125: Wool -----------------------------------------
        {
            skillStart   = 75, skillEnd = 100,
            recipeName   = "Bolt of Woolen Cloth",
            outputItemId = 2997,
            quantity     = 45, color = "orange",
            materials = {
                { name = "Wool Cloth", itemId = 2592, quantity = 135 },
            },
            notes = "Keep all the bolts - used in the next two steps.",
        },
        {
            skillStart   = 100, skillEnd = 110,
            recipeName   = "Simple Kilt",
            outputItemId = 10047,
            quantity     = 13, color = "orange",
            materials = {
                { name = "Bolt of Linen Cloth", itemId = 2996, quantity = 52 },
                { name = "Fine Thread",          itemId = 2321, quantity = 13 },
            },
            notes = "Uses Bolt of Linen Cloth, not Wool. This is the most efficient filler step here.",
        },
        {
            skillStart   = 110, skillEnd = 125,
            recipeName   = "Double-stitched Woolen Shoulders",
            outputItemId = 4314,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Bolt of Woolen Cloth", itemId = 2997, quantity = 45 },
                { name = "Fine Thread",           itemId = 2321, quantity = 30 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Tailoring",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Available from any Tailoring trainer in a major city. Buy 36x Blue Dye, 83x Fine Thread, 10x Bleach, 40x Red Dye for the next section.",
        },

        -- -- 125-215: Silk ----------------------------------------
        {
            skillStart   = 125, skillEnd = 145,
            recipeName   = "Bolt of Silk Cloth",
            outputItemId = 4305,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Silk Cloth", itemId = 4306, quantity = 240 },
            },
            notes = "Keep all bolts - used heavily in upcoming steps.",
        },
        {
            skillStart   = 145, skillEnd = 160,
            recipeName   = "Azure Silk Hood",
            outputItemId = 7048,
            quantity     = 18, color = "orange",
            materials = {
                { name = "Bolt of Silk Cloth", itemId = 4305, quantity = 36 },
                { name = "Blue Dye",            itemId = 6260, quantity = 36 },
                { name = "Fine Thread",          itemId = 2321, quantity = 18 },
            },
        },
        {
            skillStart   = 160, skillEnd = 170,
            recipeName   = "Silk Headband",
            outputItemId = 7050,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Bolt of Silk Cloth", itemId = 4305, quantity = 30 },
                { name = "Fine Thread",         itemId = 2321, quantity = 20 },
            },
        },
        {
            skillStart   = 170, skillEnd = 175,
            recipeName   = "Formal White Shirt",
            outputItemId = 4334,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Bolt of Silk Cloth", itemId = 4305, quantity = 15 },
                { name = "Bleach",             itemId = 2324, quantity = 10 },
                { name = "Fine Thread",         itemId = 2321, quantity = 5  },
            },
            notes = "Bleach is sold by Reagents/Trade vendors.",
        },
        {
            skillStart   = 175, skillEnd = 185,
            recipeName   = "Bolt of Mageweave",
            outputItemId = 4339,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Mageweave Cloth", itemId = 4338, quantity = 300 },
            },
            notes = "Make all 60 bolts now - used in upcoming steps.",
        },
        {
            skillStart   = 185, skillEnd = 205,
            recipeName   = "Crimson Silk Vest",
            outputItemId = 7058,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Bolt of Silk Cloth", itemId = 4305, quantity = 80 },
                { name = "Red Dye",            itemId = 2604, quantity = 40 },
                { name = "Fine Thread",         itemId = 2321, quantity = 40 },
            },
        },
        {
            skillStart   = 205, skillEnd = 215,
            recipeName   = "Crimson Silk Pantaloons",
            outputItemId = 7062,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Bolt of Silk Cloth", itemId = 4305, quantity = 40 },
                { name = "Red Dye",            itemId = 2604, quantity = 20 },
                { name = "Silken Thread",       itemId = 4291, quantity = 20 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 215, skillEnd = 216,
            recipeName    = "Learn Artisan Tailoring",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Available from any Tailoring trainer in a major city. Buy 20x Silken Thread, 71x Heavy Silken Thread, 20x Red Dye for the next section.",
        },

        -- -- 215-300: Mageweave / Runecloth -----------------------
        {
            skillStart   = 220, skillEnd = 230,
            recipeName   = "Black Mageweave Gloves",
            outputItemId = 10003,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Bolt of Mageweave",  itemId = 4339, quantity = 20 },
                { name = "Heavy Silken Thread", itemId = 8343, quantity = 20 },
            },
        },
        {
            skillStart   = 230, skillEnd = 250,
            recipeName   = "Black Mageweave Headband",
            outputItemId = 10024,
            quantity     = 23, color = "orange",
            materials = {
                { name = "Bolt of Mageweave",  itemId = 4339, quantity = 69 },
                { name = "Heavy Silken Thread", itemId = 8343, quantity = 46 },
            },
        },
        {
            skillStart   = 250, skillEnd = 260,
            recipeName   = "Bolt of Runecloth",
            outputItemId = 14048,
            quantity     = 80, color = "orange",
            materials = {
                { name = "Runecloth", itemId = 14047, quantity = 400 },
            },
            notes = "Make all 80 bolts now - used in both of the next two steps.",
        },
        {
            skillStart   = 260, skillEnd = 275,
            recipeName   = "Runecloth Belt",
            outputItemId = 13856,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Bolt of Runecloth", itemId = 14048, quantity = 75 },
                { name = "Rune Thread",        itemId = 14341, quantity = 25 },
            },
            notes = "Rune Thread is sold by Tailoring trainers.",
        },
        {
            skillStart   = 275, skillEnd = 300,
            recipeName   = "Runecloth Gloves",
            outputItemId = 13863,
            quantity     = 20, color = "yellow",
            materials = {
                { name = "Bolt of Runecloth", itemId = 14048, quantity = 80 },
                { name = "Rugged Leather",    itemId = 8170,  quantity = 80 },
                { name = "Rune Thread",        itemId = 14341, quantity = 20 },
            },
            notes = "Yellow at 290. Recipe learned from trainer in major cities. Alt: Runecloth Bag (5x Bolt of Runecloth, 2x Rugged Leather, 1x Rune Thread) - Pattern sold by Qia in Everlook, Winterspring.",
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Tailoring",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Dalinna at Thrallmar (H) or Hama at Honor Hold (A) in Hellfire Peninsula. Rune Thread is sold by your trainer.",
        },

        -- -- 300-375: Netherweave / TBC ---------------------------
        {
            skillStart   = 300, skillEnd = 325,
            recipeName   = "Bolt of Netherweave",
            outputItemId = 21840,
            quantity     = 100, color = "orange",
            materials = {
                { name = "Netherweave Cloth", itemId = 21877, quantity = 600 },
            },
            notes = "Make all 100 now - you'll need them for all remaining steps. Rune Thread is sold by your trainer.",
        },
        {
            skillStart   = 325, skillEnd = 350,
            recipeName   = "Bolt of Imbued Netherweave",
            outputItemId = 21842,
            quantity     = 102, color = "orange",
            materials = {
                { name = "Bolt of Netherweave", itemId = 21840, quantity = 306 },
                { name = "Arcane Dust",          itemId = 22445, quantity = 204 },
            },
            notes = "Pattern sold by Eiin in Shattrath City Lower City. Requires a Mana Loom (right next to the vendor). Make all 102 now - used in the final step.",
        },
        {
            skillStart   = 350, skillEnd = 375,
            recipeName   = "Imbued Netherweave Tunic",
            outputItemId = 21862,
            quantity     = 17, color = "yellow",
            materials = {
                { name = "Bolt of Imbued Netherweave", itemId = 21842, quantity = 102 },
                { name = "Netherweb Spider Silk",       itemId = 21881, quantity = 34  },
                { name = "Rune Thread",                 itemId = 14341, quantity = 17  },
            },
            notes = "Pattern sold by Arrond in Shadowmoon Valley (neutral Scryers rep required - can be bought from AH or a friend). Yellow - may need extras. Congratulations on 375!",
        },
    },
}
