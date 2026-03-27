-- Artisan: Enchanting Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/enchanting-leveling-guide-burning-crusade-classic
-- Most enchanting spells don't produce a tradeable item (outputItemId = nil).
-- Rods, wands, and oils DO produce items and show correct tooltips.
-- "quantity" = number of times the enchant is cast / items crafted.

ArtisanData = ArtisanData or {}

ArtisanData["Enchanting"] = {
    professionName = "Enchanting",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Trade_Engraving",

    steps = {
        -- -- 1-50: Apprentice ------------------------------------------
        {
            skillStart   = 1, skillEnd = 2,
            recipeName   = "Runed Copper Rod",
            outputItemId = 6218,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Copper Rod",          itemId = 6217,  quantity = 1 },
                { name = "Strange Dust",         itemId = 10940, quantity = 1 },
                { name = "Lesser Magic Essence", itemId = 10938, quantity = 1 },
            },
            notes = "Copper Rod is sold by Trade Supply and Enchanting Supply vendors near your trainer - DO NOT buy from AH. Blood Elf racial gives +10 Enchanting skill.",
        },
        {
            skillStart   = 2, skillEnd = 50,
            recipeName   = "Enchant Bracer: Minor Health",
            outputItemId = nil,
            quantity     = 88, color = "orange",
            materials = {
                { name = "Strange Dust", itemId = 10940, quantity = 88 },
            },
            notes = "Enchant any cheap bracers from AH. Disenchanting green items is an alternative to buying dust.",
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Enchanting",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Any Enchanting trainer in a major city.",
        },

        -- -- 50-135: Journeyman ----------------------------------------
        {
            skillStart   = 50,  skillEnd = 90,
            recipeName   = "Enchant Bracer: Minor Health",
            outputItemId = nil,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Strange Dust", itemId = 10940, quantity = 40 },
            },
            notes = "Continue if Strange Dust is cheap. Alt if Greater Magic Essence is cheap: skip ahead to Greater Magic Wand.",
        },
        {
            skillStart   = 90,  skillEnd = 100,
            recipeName   = "Enchant Bracer: Minor Stamina",
            outputItemId = nil,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Strange Dust", itemId = 10940, quantity = 30 },
            },
        },
        {
            skillStart   = 100, skillEnd = 101,
            recipeName   = "Runed Silver Rod",
            outputItemId = 6339,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Silver Rod",          itemId = 6338,  quantity = 1 },
                { name = "Strange Dust",         itemId = 10940, quantity = 6 },
                { name = "Greater Magic Essence", itemId = 10939, quantity = 3 },
            },
            notes = "Silver Rod is crafted by Blacksmiths and sold on AH.",
        },
        {
            skillStart   = 101, skillEnd = 110,
            recipeName   = "Greater Magic Wand",
            outputItemId = 11288,
            quantity     = 9, color = "orange",
            materials = {
                { name = "Simple Wood",           itemId = 11251, quantity = 9 },
                { name = "Greater Magic Essence", itemId = 10939, quantity = 9 },
            },
            notes = "Simple Wood sold by Trade Supply vendors or found in fishing. Wands can be sold to other players.",
        },
        {
            skillStart   = 110, skillEnd = 135,
            recipeName   = "Enchant Cloak: Minor Agility",
            outputItemId = 11039,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Lesser Astral Essence", itemId = 10998, quantity = 25 },
            },
            notes = "Formula: Enchant Cloak - Minor Agility is sold by Kulwia (H) in Stonetalon Mountains or Dalria (A) in Ashenvale (limited supply, 30-50 min respawn). Alt: 28x Enchant 2H Weapon - Minor Impact if Astral Essence is expensive.",
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Enchanting",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Any Enchanting trainer in a major city.",
        },

        -- -- 135-225: Expert -------------------------------------------
        {
            skillStart   = 135, skillEnd = 155,
            recipeName   = "Enchant Bracer: Lesser Stamina",
            outputItemId = nil,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Soul Dust", itemId = 11083, quantity = 40 },
            },
        },
        {
            skillStart   = 155, skillEnd = 156,
            recipeName   = "Runed Golden Rod",
            outputItemId = 11130,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Golden Rod",          itemId = 11128, quantity = 1 },
                { name = "Iridescent Pearl",    itemId = 5500,  quantity = 1 },
                { name = "Greater Astral Essence", itemId = 11082, quantity = 2 },
                { name = "Soul Dust",           itemId = 11083, quantity = 2 },
            },
            notes = "Golden Rod is crafted by Blacksmiths (sold on AH). Iridescent Pearl is fished or found in clams.",
        },
        {
            skillStart   = 156, skillEnd = 185,
            recipeName   = "Enchant Bracer: Lesser Strength",
            outputItemId = 11101,
            quantity     = 40, color = "yellow",
            materials = {
                { name = "Soul Dust", itemId = 11083, quantity = 80 },
            },
            notes = "Formula sold by Kulwia (H) / Dalria (A) - same vendors as Minor Agility. Goes yellow at 165. Alt at 165: 20x Enchant Bracer - Spirit if Lesser Mystic Essence is cheap.",
        },
        {
            skillStart   = 185, skillEnd = 200,
            recipeName   = "Enchant Bracer: Strength",
            outputItemId = nil,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Vision Dust", itemId = 11137, quantity = 15 },
            },
        },
        {
            skillStart   = 200, skillEnd = 201,
            recipeName   = "Runed Truesilver Rod",
            outputItemId = 11145,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Truesilver Rod",       itemId = 11144, quantity = 1 },
                { name = "Black Pearl",          itemId = 7971,  quantity = 1 },
                { name = "Greater Mystic Essence", itemId = 11135, quantity = 2 },
                { name = "Vision Dust",          itemId = 11137, quantity = 2 },
            },
            notes = "Truesilver Rod from Blacksmiths on AH.",
        },
        {
            skillStart   = 201, skillEnd = 220,
            recipeName   = "Enchant Bracer: Strength",
            outputItemId = nil,
            quantity     = 25, color = "yellow",
            materials = {
                { name = "Vision Dust", itemId = 11137, quantity = 25 },
            },
            notes = "Yellow - buy enough dust for about 25 casts.",
        },
        {
            skillStart   = 220, skillEnd = 225,
            recipeName   = "Enchant Cloak: Greater Defense",
            outputItemId = nil,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Vision Dust", itemId = 11137, quantity = 15 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Learn Artisan Enchanting",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Any Enchanting trainer in a major city.",
        },

        -- -- 225-300: Artisan ------------------------------------------
        {
            skillStart   = 225, skillEnd = 235,
            recipeName   = "Enchant Gloves: Agility",
            outputItemId = nil,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Lesser Nether Essence", itemId = 11174, quantity = 5  },
                { name = "Vision Dust",           itemId = 11137, quantity = 5  },
            },
            notes = "Alt if no Lesser Nether Essence: 10x Enchant Cloak: Greater Defense.",
        },
        {
            skillStart   = 235, skillEnd = 250,
            recipeName   = "Enchant Chest: Superior Health",
            outputItemId = nil,
            quantity     = 25, color = "orange",
            materials = {
                { name = "Vision Dust", itemId = 11137, quantity = 150 },
            },
        },
        {
            skillStart   = 250, skillEnd = 265,
            recipeName   = "Lesser Mana Oil",
            outputItemId = 20747,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Dream Dust",   itemId = 11176, quantity = 60 },
                { name = "Purple Lotus", itemId = 8831,  quantity = 40 },
                { name = "Crystal Vial", itemId = 8925,  quantity = 20 },
            },
            notes = "Recipe sold by Kania in Silithus (upstairs in the inn). Crystal Vial sold by Mishta in Silithus. Can make up to 270 if Purple Lotus is cheap.",
        },
        {
            skillStart   = 265, skillEnd = 290,
            recipeName   = "Enchant Shield: Greater Stamina",
            outputItemId = 16217,
            quantity     = 27, color = "orange",
            materials = {
                { name = "Dream Dust", itemId = 11176, quantity = 270 },
            },
            notes = "Recipe sold by Daniel Bartlett in Undercity (H) or Mythrin'dir in Darnassus (A). Binds when picked up - must buy on your Enchanter! Limited supply.",
        },
        {
            skillStart   = 290, skillEnd = 299,
            recipeName   = "Enchant Cloak: Superior Defense",
            outputItemId = 16224,
            quantity     = 9, color = "orange",
            materials = {
                { name = "Illusion Dust", itemId = 16204, quantity = 72 },
            },
            notes = "Formula sold by Lorelae Wintersong in Moonglade at Nighthaven (limited supply, 15-20 min respawn). Buy Formula: Runed Arcanite Rod from her too while you're there!",
        },
        {
            skillStart   = 299, skillEnd = 300,
            recipeName   = "Runed Arcanite Rod",
            outputItemId = 16207,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Arcanite Rod",          itemId = 16206, quantity = 1 },
                { name = "Golden Pearl",          itemId = 13926, quantity = 1 },
                { name = "Illusion Dust",         itemId = 16204, quantity = 10 },
                { name = "Greater Eternal Essence", itemId = 16203, quantity = 4 },
                { name = "Large Brilliant Shard",  itemId = 14344, quantity = 2 },
            },
            notes = "Formula from Lorelae Wintersong in Moonglade (same vendor). Arcanite Rod from Blacksmiths/AH.",
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Enchanting",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Felannia at Thrallmar (H) or Johan Barnes at Honor Hold (A) in Hellfire Peninsula - both on the second floor of the Wizard's Tower.",
        },

        -- -- 300-375: Master (TBC) -------------------------------------
        {
            skillStart   = 300, skillEnd = 301,
            recipeName   = "Runed Fel Iron Rod",
            outputItemId = 22461,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Fel Iron Rod",          itemId = 25843, quantity = 1 },
                { name = "Greater Eternal Essence", itemId = 16203, quantity = 4 },
                { name = "Large Brilliant Shard",  itemId = 14344, quantity = 6 },
            },
            notes = "Fel Iron Rod is crafted by Blacksmiths. Required to apply many TBC enchants.",
        },
        {
            skillStart   = 301, skillEnd = 310,
            recipeName   = "Bracer - Assault",
            outputItemId = nil,
            quantity     = 9, color = "orange",
            materials = {
                { name = "Arcane Dust", itemId = 22445, quantity = 54 },
            },
        },
        {
            skillStart   = 310, skillEnd = 316,
            recipeName   = "Bracer - Brawn",
            outputItemId = nil,
            quantity     = 6, color = "orange",
            materials = {
                { name = "Arcane Dust", itemId = 22445, quantity = 36 },
            },
        },
        {
            skillStart   = 316, skillEnd = 330,
            recipeName   = "Gloves - Assault",
            outputItemId = nil,
            quantity     = 16, color = "yellow",
            materials = {
                { name = "Arcane Dust", itemId = 22445, quantity = 128 },
            },
            notes = "Alt if Greater Planar Essence is cheap: 10x Chest - Major Spirit (20 Greater Planar Essence, 320-330).",
        },
        {
            skillStart   = 330, skillEnd = 335,
            recipeName   = "Shield - Major Stamina",
            outputItemId = 28282,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Arcane Dust", itemId = 22445, quantity = 75 },
            },
            notes = "Formula sold by Madame Ruby in Shattrath City (Lower City, limited supply). Buy Formula: Superior Wizard Oil from her at the same time!",
        },
        {
            skillStart   = 335, skillEnd = 340,
            recipeName   = "Shield - Resilience",
            outputItemId = nil,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Large Prismatic Shard",  itemId = 22449, quantity = 5  },
                { name = "Lesser Planar Essence",  itemId = 22447, quantity = 20 },
            },
            notes = "Alt: continue Shield - Major Stamina if Large Prismatic Shard is too expensive.",
        },
        {
            skillStart   = 340, skillEnd = 350,
            recipeName   = "Superior Wizard Oil",
            outputItemId = 22522,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Arcane Dust",   itemId = 22445, quantity = 45 },
                { name = "Nightmare Vine", itemId = 22792, quantity = 15 },
                { name = "Imbued Vial",   itemId = 18256, quantity = 15 },
            },
            notes = "Recipe from Madame Ruby in Shattrath. Imbued Vials from Trade Supply vendors. Yellow recipe, may need extra. Alt: 5x Enchant Gloves - Major Strength if no Nightmare Vine.",
        },
        {
            skillStart   = 350, skillEnd = 351,
            recipeName   = "Runed Adamantite Rod",
            outputItemId = 22462,
            quantity     = 1, color = "orange",
            materials = {
                { name = "Adamantite Rod",        itemId = 25844, quantity = 1 },
                { name = "Primal Might",          itemId = 23571, quantity = 1 },
                { name = "Greater Planar Essence", itemId = 22446, quantity = 8 },
                { name = "Large Prismatic Shard",  itemId = 22449, quantity = 8 },
            },
            notes = "Formula sold by Vodesiin at Temple of Telhamat (A) in Hellfire Peninsula, or Rungor at Stonebreaker Hold (H) in Terokkar Forest. Adamantite Rod from Blacksmiths. Primal Might from Alchemists.",
        },
        {
            skillStart   = 351, skillEnd = 360,
            recipeName   = "Enchant Gloves - Major Strength",
            outputItemId = nil,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Arcane Dust",           itemId = 22445, quantity = 180 },
                { name = "Greater Planar Essence", itemId = 22446, quantity = 15  },
            },
            notes = "Yellow - quantity is approximate. This is the cheapest option in this range.",
        },
        {
            skillStart   = 360, skillEnd = 370,
            recipeName   = "Enchant Ring - Striking",
            outputItemId = 22535,
            quantity     = 10, color = "yellow",
            materials = {
                { name = "Large Prismatic Shard", itemId = 22449, quantity = 80 },
                { name = "Arcane Dust",          itemId = 22445, quantity = 240 },
            },
            notes = "Formula sold by Ythyar in Karazhan. Requires Revered with The Consortium. Can only be cast on your own rings.",
        },
        {
            skillStart   = 370, skillEnd = 375,
            recipeName   = "Enchant Ring - Healing Power",
            outputItemId = 22537,
            quantity     = 5, color = "yellow",
            materials = {
                { name = "Large Prismatic Shard",  itemId = 22449, quantity = 40 },
                { name = "Greater Planar Essence", itemId = 22446, quantity = 50 },
                { name = "Arcane Dust",            itemId = 22445, quantity = 100 },
            },
            notes = "Formula sold by Almaador in Shattrath (Terrace of Light). Requires Revered with The Sha'tar. Can only be cast on your own rings. Congratulations on 375!",
        },
    },
}
