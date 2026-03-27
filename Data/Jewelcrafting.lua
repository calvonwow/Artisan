-- Artisan: Jewelcrafting Data (1-375 TBC Anniversary)
-- Item IDs verified via wowhead.com/tbc - all TBC JC items added in patch 2.0.1
-- Confirmed: 20816=Delicate Copper Wire, 20817=Bronze Setting, 20823=Gloom Band,
--   20828=Ring of Twilight Shadows, 20950=Pendant of Agate Shield,
--   20960=Engraved Truesilver Ring, 20963=Mithril Filigree, 20964=Aquamarine Signet,
--   21755=Aquamarine Pendant of the Warrior, 25439=Tigerseye Band
-- outputItemId=nil below = item could not be confirmed (no wrong tooltip shown)
-- itemId=21752 for Thorium Setting (both output and material, confirmed)

ArtisanData = ArtisanData or {}

ArtisanData["Jewelcrafting"] = {
    professionName = "Jewelcrafting",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\INV_Misc_Gem_01",

    steps = {
        -- 1-50: Apprentice
        {
            skillStart   = 1,  skillEnd = 35,
            recipeName   = "Delicate Copper Wire",
            outputItemId = 20816,
            quantity     = 55, color = "orange",
            materials = {
                { name = "Copper Bar", itemId = 2840, quantity = 110 },
            },
            notes = "Buy a Jeweler's Kit from the Jewelcrafting Supply vendor. Save all wires - used in many early recipes. Draenei racial gives +5 JC skill.",
        },
        {
            skillStart   = 35, skillEnd = 50,
            recipeName   = "Tigerseye Band",
            outputItemId = 25439,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Tigerseye",            itemId = 818,   quantity = 15 },
                { name = "Delicate Copper Wire", itemId = 20816, quantity = 15 },
            },
            notes = "Alt: 15x Malachite Pendant (15 Malachite, 15 Delicate Copper Wire).",
        },
        {
            isTrainer     = true,
            skillStart    = 20, skillEnd = 21,
            recipeName    = "Learn Prospecting",
            charLevel     = 5,
            notes         = "Prospecting (skill 20): uses 5 raw ore to yield Adamantite Powder and/or gems.",
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Jewelcrafting",
            charLevel     = 10,
            grantsMaxRank = 150,
            notes         = "Kalinda in Silvermoon City (H) or Farii in The Exodar (A).",
        },

        -- 50-125: Journeyman
        {
            skillStart   = 50,  skillEnd = 80,
            recipeName   = "Bronze Setting",
            outputItemId = 20817,
            quantity     = 50, color = "orange",
            materials = {
                { name = "Bronze Bar", itemId = 2841, quantity = 100 },
            },
            notes = "Save all Bronze Settings - used in rings and pendants through skill 150.",
        },
        {
            skillStart   = 80,  skillEnd = 100,
            recipeName   = "Gloom Band",
            outputItemId = 20823,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Bronze Setting",       itemId = 20817, quantity = 20 },
                { name = "Shadowgem",            itemId = 1210,  quantity = 40 },
                { name = "Delicate Copper Wire", itemId = 20816, quantity = 40 },
            },
            notes = "Alt: 25x Simple Pearl Ring (25 Small Lustrous Pearl, 25 Bronze Setting, 50 Copper Bar) or Ring of Silver Might (2 Silver Bar each).",
        },
        {
            skillStart   = 100, skillEnd = 110,
            recipeName   = "Ring of Twilight Shadows",
            outputItemId = 20828,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Shadowgem",  itemId = 1210, quantity = 20 },
                { name = "Bronze Bar", itemId = 2841, quantity = 20 },
            },
        },
        {
            skillStart   = 110, skillEnd = 120,
            recipeName   = "Heavy Stone Statue",
            outputItemId = 25881,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Heavy Stone", itemId = 2838, quantity = 80 },
            },
            notes = "If Heavy Stone is cheap, extend to 130.",
        },
        {
            skillStart   = 120, skillEnd = 150,
            recipeName   = "Pendant of the Agate Shield",
            outputItemId = 20950,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Moss Agate",    itemId = 1206,  quantity = 30 },
                { name = "Bronze Setting", itemId = 20817, quantity = 30 },
            },
            notes = "Recipe sold by Jandia (H) in Thousand Needles or Neal Allen (A) in Wetlands (limited supply). Alt: Amulet of the Moon if Lesser Moonstone < Moss Agate.",
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Jewelcrafting",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Kalinda in Silvermoon City (H) or Farii in The Exodar (A).",
        },

        -- 150-225: Expert
        {
            skillStart   = 150, skillEnd = 180,
            recipeName   = "Mithril Filigree",
            outputItemId = 20963,
            quantity     = 71, color = "yellow",
            materials = {
                { name = "Mithril Bar", itemId = 3860, quantity = 142 },
            },
            notes = "Yellow for last few points. Save ALL - used in Engraved Truesilver Ring and Aquamarine Pendant of the Warrior.",
        },
        {
            skillStart   = 180, skillEnd = 185,
            recipeName   = "Solid Stone Statue",
            outputItemId = 25882,
            quantity     = 9, color = "orange",
            materials = {
                { name = "Solid Stone", itemId = 7912, quantity = 90 },
            },
            notes = "If Solid Stone is cheap, extend to 190.",
        },
        {
            skillStart   = 185, skillEnd = 210,
            recipeName   = "Engraved Truesilver Ring",
            outputItemId = 20960,
            quantity     = 28, color = "yellow",
            materials = {
                { name = "Truesilver Bar",  itemId = 6037,  quantity = 28 },
                { name = "Mithril Filigree", itemId = 20963, quantity = 56 },
            },
            notes = "Yellow for last few points. Alt: 25x Citrine Ring of Rapid Healing (25 Citrine, 50 Elemental Water, 50 Mithril Bar).",
        },
        {
            skillStart   = 210, skillEnd = 220,
            recipeName   = "Aquamarine Signet",
            outputItemId = 20964,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Aquamarine",    itemId = 7909, quantity = 30 },
                { name = "Flask of Mojo", itemId = 8151, quantity = 40 },
            },
            notes = "Flask of Mojo drops from Trolls (Zul'Farrak, Hinterlands, STV).",
        },
        {
            skillStart   = 220, skillEnd = 225,
            recipeName   = "Aquamarine Pendant of the Warrior",
            outputItemId = 21755,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Aquamarine",       itemId = 7909,  quantity = 5  },
                { name = "Mithril Filigree", itemId = 20963, quantity = 15 },
            },
        },
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Learn Artisan Jewelcrafting",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Kalinda in Silvermoon City (H) or Farii in The Exodar (A).",
        },

        -- 225-300: Artisan
        {
            skillStart   = 225, skillEnd = 250,
            recipeName   = "Thorium Setting",
            outputItemId = 21752,
            quantity     = 56, color = "orange",
            materials = {
                { name = "Thorium Bar", itemId = 12359, quantity = 56 },
            },
            notes = "Save all ~56 Thorium Settings - used in every gem ring/pendant through skill 300.",
        },
        {
            skillStart   = 250, skillEnd = 260,
            recipeName   = "Ruby Pendant of Fire",
            outputItemId = 21764,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Star Ruby",       itemId = 7910,  quantity = 10 },
                { name = "Thorium Setting", itemId = 21752, quantity = 10 },
            },
        },
        {
            skillStart   = 260, skillEnd = 281,
            recipeName   = "Simple Opal Ring",
            outputItemId = 21767,
            quantity     = 21, color = "orange",
            materials = {
                { name = "Large Opal",      itemId = 12799, quantity = 21 },
                { name = "Thorium Setting", itemId = 21752, quantity = 21 },
            },
            notes = "Alt: Diamond Focus Ring (1 Azerothian Diamond, 1 Thorium Setting) if Large Opal > Azerothian Diamond.",
        },
        {
            skillStart   = 281, skillEnd = 291,
            recipeName   = "Emerald Lion Ring",
            outputItemId = 29160,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Huge Emerald",    itemId = 12364, quantity = 10 },
                { name = "Thorium Setting", itemId = 21752, quantity = 10 },
            },
        },
        {
            skillStart   = 291, skillEnd = 300,
            recipeName   = "Diamond Focus Ring",
            outputItemId = 30422,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Azerothian Diamond", itemId = 12800, quantity = 10 },
                { name = "Thorium Setting",    itemId = 21752, quantity = 10 },
            },
            notes = "Design sold by Gelanthis in Silithus (limited supply).",
        },
        {
            isTrainer     = true,
            skillStart    = 300, skillEnd = 301,
            recipeName    = "Learn Master Jewelcrafting",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Kalaen at Thrallmar (H) or Tatiana at Honor Hold (A) in Hellfire Peninsula.",
        },

        -- 300-375: Master (TBC)
        {
            skillStart   = 300, skillEnd = 320,
            recipeName   = "TBC Common Gem Cuts (Orange)",
            outputItemId = nil,
            quantity     = 40, color = "orange",
            materials = {
                { name = "Blood Garnet (or mix of TBC common gems)", itemId = 23077, quantity = 40 },
            },
            notes = "Buy ~40 common TBC gems total - Blood Garnet 23077, Shadow Draenite 23079, Golden Draenite 23112, Deep Peridot 23076, Azure Moonstone 23111, Flame Spessarite 23110. Buy a variety so you can use multiple trainer-sold cut recipes.",
        },
        {
            skillStart   = 320, skillEnd = 325,
            recipeName   = "More TBC Common Gem Cuts",
            outputItemId = nil,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Golden Draenite (or similar)", itemId = 23112, quantity = 15 },
            },
            notes = "Learn all new cut designs from your trainer every 5 skill points.",
        },
        {
            skillStart   = 325, skillEnd = 340,
            recipeName   = "Mercurial Adamantite",
            outputItemId = 31079,
            quantity     = 12, color = "orange",
            materials = {
                { name = "Adamantite Powder", itemId = 24243, quantity = 48 },
                { name = "Primal Earth",      itemId = 22452, quantity = 12 },
            },
            notes = "Adamantite Powder comes from Prospecting Adamantite Ore (5 ore → ~1-4 powder). Save all 12 Mercurial Adamantite for next step.",
        },
        {
            skillStart   = 340, skillEnd = 350,
            recipeName   = "Heavy Adamantite Ring",
            outputItemId = 24078,
            quantity     = 12, color = "yellow",
            materials = {
                { name = "Adamantite Bar",       itemId = 23446, quantity = 12 },
                { name = "Mercurial Adamantite", itemId = 31079, quantity = 12 },
            },
            notes = "Yellow for several points. Alt: Figurine - Seaspray Albatross (4 Adamantite Powder + 4 Primal Water).",
        },
        {
            skillStart   = 350, skillEnd = 375,
            recipeName   = "Rare Gem Cuts / World Drop Recipes",
            outputItemId = nil,
            quantity     = 35, color = "yellow",
            materials = {
                { name = "Living Ruby (or Talasite/Dawnstone/Nightseye)", itemId = 23436, quantity = 35 },
            },
            notes = "350-360: World drop recipes (Living Ruby Pendant, Thick Felsteel Necklace) or keep cutting. 360-365: Sha'tar Honored - Ring of Arcane Shielding (2 Eternium Bar, 8 Primal Mana). 365-375: Lower City Revered - Felsteel Boar. Check daily JC quest. Congratulations on 375!",
        },
    },
}
