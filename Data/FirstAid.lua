-- Artisan: First Aid Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/first-aid-leveling-guide-burning-crusade-classic
-- First Aid does not occupy a profession slot - every character can learn it.
-- Expert First Aid requires buying a book (not from a trainer).
-- Artisan First Aid requires completing the Triage quest (level 35, skill 225).
-- Master First Aid requires buying a book in Hellfire Peninsula.

ArtisanData = ArtisanData or {}

ArtisanData["First Aid"] = {
    professionName = "First Aid",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Spell_Holy_SealOfSacrifice",

    steps = {
        -- -- 1-150: Apprentice / Journeyman ----------------------------
        {
            skillStart   = 1,  skillEnd = 40,
            recipeName   = "Linen Bandage",
            outputItemId = 1251,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Linen Cloth", itemId = 2589, quantity = 50 },
            },
        },
        {
            skillStart   = 40, skillEnd = 80,
            recipeName   = "Heavy Linen Bandage",
            outputItemId = 2581,
            quantity     = 65, color = "orange",
            materials = {
                { name = "Linen Cloth", itemId = 2589, quantity = 130 },
            },
            notes = "Visit your trainer and learn Journeyman First Aid at skill 75!",
        },
        {
            isTrainer     = true,
            skillStart    = 75, skillEnd = 76,
            recipeName    = "Learn Journeyman First Aid",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Any First Aid trainer in a major city. Also learn Wool Bandage while there.",
        },
        {
            skillStart   = 80, skillEnd = 115,
            recipeName   = "Wool Bandage",
            outputItemId = 3530,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Wool Cloth", itemId = 2592, quantity = 60 },
            },
        },
        {
            skillStart   = 115, skillEnd = 150,
            recipeName   = "Heavy Wool Bandage",
            outputItemId = 3531,
            quantity     = 60, color = "orange",
            materials = {
                { name = "Wool Cloth", itemId = 2592, quantity = 120 },
            },
        },

        -- -- 150-225: Expert -------------------------------------------
        {
            isTrainer     = true,
            skillStart    = 150, skillEnd = 151,
            recipeName    = "Learn Expert First Aid (Book)",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Buy 'Expert First Aid - Under Wraps' from Deneb Walker (A) in Arathi Highlands or Balai Lok'Wein (H) in Dustwallow Marsh. BUY ALL THREE BOOKS while there: Expert First Aid, Manual: Heavy Silk Bandage, and Manual: Mageweave Bandage. Also learn Silk Bandage from your trainer before leaving!",
        },
        {
            skillStart   = 150, skillEnd = 180,
            recipeName   = "Silk Bandage",
            outputItemId = 6450,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Silk Cloth", itemId = 4306, quantity = 50 },
            },
            notes = "Must learn from trainer after using the Expert First Aid book.",
        },
        {
            skillStart   = 180, skillEnd = 210,
            recipeName   = "Heavy Silk Bandage",
            outputItemId = 6451,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Silk Cloth", itemId = 4306, quantity = 100 },
            },
            notes = "Learn from 'Manual: Heavy Silk Bandage' (right-click in bag).",
        },
        {
            skillStart   = 210, skillEnd = 225,
            recipeName   = "Mageweave Bandage",
            outputItemId = 8544,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Mageweave Cloth", itemId = 4338, quantity = 30 },
            },
            notes = "Learn from 'Manual: Mageweave Bandage'. You'll continue making these after the Triage quest.",
        },

        -- -- 225-300: Artisan ------------------------------------------
        {
            isTrainer     = true,
            skillStart    = 225, skillEnd = 226,
            recipeName    = "Learn Artisan First Aid (Triage Quest)",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Complete 'Alliance Trauma' (A) or 'Horde Trauma' (H) quest, then the 'Triage' quest in Dustwallow Marsh (A: Doctor VanHowzen) or Arathi Highlands (H: Doctor Gregory Victor). Tips: prioritize critically injured patients first, pre-select next patient, position yourself centrally. Bring 100x Mageweave and 70x Runecloth for the steps ahead.",
        },
        {
            skillStart   = 225, skillEnd = 240,
            recipeName   = "Mageweave Bandage",
            outputItemId = 8544,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Mageweave Cloth", itemId = 4338, quantity = 30 },
            },
        },
        {
            skillStart   = 240, skillEnd = 260,
            recipeName   = "Heavy Mageweave Bandage",
            outputItemId = 8545,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Mageweave Cloth", itemId = 4338, quantity = 60 },
            },
            notes = "Learn from Doctor VanHowzen (A) or Doctor Gregory Victor (H).",
        },
        {
            skillStart   = 260, skillEnd = 290,
            recipeName   = "Runecloth Bandage",
            outputItemId = 14529,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Runecloth", itemId = 14047, quantity = 50 },
            },
            notes = "Learn from the same doctor NPC.",
        },
        {
            skillStart   = 290, skillEnd = 300,
            recipeName   = "Heavy Runecloth Bandage",
            outputItemId = 14530,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Runecloth", itemId = 14047, quantity = 30 },
            },
            notes = "Learn from the same doctor NPC at skill 290.",
        },

        -- -- 300-375: Master (TBC) -------------------------------------
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master First Aid (Book)",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Buy 'Master First Aid - Doctor in the House' from Aresella (H) at Falcon Watch or Burko (A) at Temple of Telhamat in Hellfire Peninsula. Buy 'Manual: Netherweave Bandage' and 'Manual: Heavy Netherweave Bandage' from the same NPC!",
        },
        {
            skillStart   = 300, skillEnd = 330,
            recipeName   = "Heavy Runecloth Bandage",
            outputItemId = 14530,
            quantity     = 70, color = "orange",
            materials = {
                { name = "Runecloth", itemId = 14047, quantity = 140 },
            },
            notes = "Continue with Runecloth while it's still orange. Netherweave will be available soon.",
        },
        {
            skillStart   = 330, skillEnd = 360,
            recipeName   = "Netherweave Bandage",
            outputItemId = 21990,
            quantity     = 45, color = "orange",
            materials = {
                { name = "Netherweave Cloth", itemId = 21877, quantity = 45 },
            },
            notes = "Learn from 'Manual: Netherweave Bandage'. Netherweave drops from humanoids throughout Outland.",
        },
        {
            skillStart   = 360, skillEnd = 375,
            recipeName   = "Heavy Netherweave Bandage",
            outputItemId = 21991,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Netherweave Cloth", itemId = 21877, quantity = 40 },
            },
            notes = "Learn from 'Manual: Heavy Netherweave Bandage'. Congratulations on 375!",
        },
    },
}
