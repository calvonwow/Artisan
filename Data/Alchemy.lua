-- Artisan: Alchemy Data (1-375 TBC Anniversary)
-- isTrainer steps: skillEnd = skillStart+1 so step detection works normally.

ArtisanData = ArtisanData or {}

ArtisanData["Alchemy"] = {
    professionName = "Alchemy",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\Trade_Alchemy",

    steps = {
        {
            skillStart   = 1, skillEnd = 60,
            recipeName   = "Minor Healing Potion",
            outputItemId = 118,
            quantity     = 65, color = "orange",
            materials = {
                { name = "Peacebloom",  itemId = 2447, quantity = 65 },
                { name = "Silverleaf",  itemId = 765,  quantity = 65 },
                { name = "Empty Vial",  itemId = 3371, quantity = 65 },
            },
            notes = "Keep all 65 potions - used in the next step.",
        },
        -- Journeyman rank must be trained before skill hits 75
        {
            isTrainer    = true,
            skillStart   = 60, skillEnd = 61,
            recipeName   = "Learn Journeyman Alchemy",
            charLevel    = 10,
            grantsMaxRank  = 150,
            notes        = "Available from any Alchemy trainer in a major city.",
        },
        {
            skillStart   = 60, skillEnd = 110,
            recipeName   = "Lesser Healing Potion",
            outputItemId = 858,
            quantity     = 65, color = "orange",
            materials = {
                { name = "Minor Healing Potion", itemId = 118,  quantity = 65 },
                { name = "Briarthorn",           itemId = 2450, quantity = 65 },
                { name = "Leaded Vial",          itemId = 3372, quantity = 65 },
            },
        },
        -- Expert rank must be trained before skill hits 150
        {
            isTrainer    = true,
            skillStart   = 110, skillEnd = 111,
            recipeName   = "Learn Expert Alchemy",
            charLevel    = 20,
            grantsMaxRank  = 225,
            notes        = "Available from any Alchemy trainer in a major city.",
        },
        {
            skillStart   = 110, skillEnd = 140,
            recipeName   = "Healing Potion",
            outputItemId = 929,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Bruiseweed",  itemId = 2453, quantity = 35 },
                { name = "Briarthorn",  itemId = 2450, quantity = 35 },
                { name = "Leaded Vial", itemId = 3372, quantity = 35 },
            },
        },
        {
            skillStart   = 140, skillEnd = 155,
            recipeName   = "Lesser Mana Potion",
            outputItemId = 3385,
            quantity     = 20, color = "orange",
            materials = {
                { name = "Mageroyal",    itemId = 785,  quantity = 20 },
                { name = "Stranglekelp", itemId = 3820, quantity = 20 },
                { name = "Leaded Vial",  itemId = 3372, quantity = 20 },
            },
            notes = "Turns yellow at 145 - may need a few extra.",
        },
        {
            skillStart   = 155, skillEnd = 185,
            recipeName   = "Greater Healing Potion",
            outputItemId = 1710,
            quantity     = 35, color = "orange",
            materials = {
                { name = "Liferoot",    itemId = 3357, quantity = 35 },
                { name = "Kingsblood",  itemId = 3356, quantity = 35 },
                { name = "Leaded Vial", itemId = 3372, quantity = 35 },
            },
        },
        {
            skillStart   = 185, skillEnd = 210,
            recipeName   = "Elixir of Agility",
            outputItemId = 8949,
            quantity     = 30, color = "orange",
            materials = {
                { name = "Stranglekelp", itemId = 3820, quantity = 30 },
                { name = "Goldthorn",    itemId = 3821, quantity = 30 },
                { name = "Leaded Vial",  itemId = 3372, quantity = 30 },
            },
        },
        -- Artisan rank must be trained before skill hits 225
        {
            isTrainer    = true,
            skillStart   = 210, skillEnd = 211,
            recipeName   = "Learn Artisan Alchemy",
            charLevel    = 35,
            grantsMaxRank  = 300,
            notes        = "Available from any Alchemy trainer in a major city.",
        },
        {
            skillStart   = 210, skillEnd = 215,
            recipeName   = "Elixir of Greater Defense",
            outputItemId = 8951,
            quantity     = 5, color = "orange",
            materials = {
                { name = "Wild Steelbloom",  itemId = 3355, quantity = 5 },
                { name = "Goldthorn",   itemId = 3821, quantity = 5 },
                { name = "Leaded Vial", itemId = 3372, quantity = 5 },
            },
        },
        {
            skillStart   = 215, skillEnd = 230,
            recipeName   = "Superior Healing Potion",
            outputItemId = 3928,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Sungrass",          itemId = 8838, quantity = 15 },
                { name = "Khadgar's Whisker", itemId = 3358, quantity = 15 },
                { name = "Crystal Vial",      itemId = 8925, quantity = 15 },
            },
        },
        {
            skillStart   = 230, skillEnd = 265,
            recipeName   = "Elixir of Detect Undead",
            outputItemId = 9154,
            quantity     = 45, color = "yellow",
            materials = {
                { name = "Arthas' Tears", itemId = 8836, quantity = 45 },
                { name = "Crystal Vial",  itemId = 8925, quantity = 45 },
            },
            notes = "Yellow recipe - quantities include buffer. May need extras.",
        },
        {
            skillStart   = 265, skillEnd = 285,
            recipeName   = "Superior Mana Potion",
            outputItemId = 13443,
            quantity     = 30, color = "yellow",
            materials = {
                { name = "Sungrass",     itemId = 8838, quantity = 60 },
                { name = "Blindweed",    itemId = 8839, quantity = 60 },
                { name = "Crystal Vial", itemId = 8925, quantity = 30 },
            },
            notes = "Yellow recipe - quantities include buffer.",
        },
        {
            skillStart   = 285, skillEnd = 300,
            recipeName   = "Major Healing Potion",
            outputItemId = 13446,
            quantity     = 20, color = "yellow",
            materials = {
                { name = "Golden Sansam",       itemId = 13464, quantity = 40 },
                { name = "Mountain Silversage",  itemId = 13465, quantity = 20 },
                { name = "Crystal Vial",         itemId = 8925,  quantity = 20 },
            },
        },
        -- Master rank: must travel to Outland before skill hits 300
        {
            isTrainer    = true,
            skillStart   = 300, skillEnd = 301,
            recipeName   = "Learn Master Alchemy",
            charLevel    = 50,
            grantsMaxRank  = 375,
            notes        = "Alchemist Gribble at Honor Hold (A) or Apothecary Antonivich at Thrallmar (H) in Hellfire Peninsula. Also available from Lorokeem in Shattrath.",
        },

        -- TBC Phase 300-375
        {
            skillStart   = 300, skillEnd = 315,
            recipeName   = "Volatile Healing Potion",
            outputItemId = 28100,
            quantity     = 15, color = "orange",
            materials = {
                { name = "Felweed",     itemId = 22785, quantity = 30 },
                { name = "Ragveil",     itemId = 22787, quantity = 15 },
                { name = "Imbued Vial", itemId = 18256, quantity = 15 },
            },
            notes = "Imbued Vials sold by trade/alchemy supply vendors in Shattrath.",
        },
        {
            skillStart   = 315, skillEnd = 325,
            recipeName   = "Elixir of Healing Power",
            outputItemId = 22825,
            quantity     = 10, color = "orange",
            materials = {
                { name = "Dreaming Glory", itemId = 22786, quantity = 20 },
                { name = "Felweed",        itemId = 22785, quantity = 10 },
                { name = "Imbued Vial",    itemId = 18256, quantity = 10 },
            },
            notes = "Recipe sold by alchemy vendors. Check AH if unavailable.",
        },
        {
            skillStart   = 325, skillEnd = 340,
            recipeName   = "Mad Alchemist's Potion",
            outputItemId = 34440,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Ragveil",     itemId = 22787, quantity = 30 },
                { name = "Imbued Vial", itemId = 18256, quantity = 15 },
            },
            notes = "Yellow. Good if you have surplus Ragveil. Otherwise craft more Elixir of Healing Power.",
        },
        {
            skillStart   = 340, skillEnd = 350,
            recipeName   = "Super Mana Potion",
            outputItemId = 22832,
            quantity     = 10, color = "yellow",
            materials = {
                { name = "Dreaming Glory", itemId = 22786, quantity = 20 },
                { name = "Felweed",        itemId = 22785, quantity = 10 },
                { name = "Imbued Vial",    itemId = 18256, quantity = 10 },
            },
            notes = "Recipe: Super Mana Potion sold by Daga Ramba (H) or Haalrun (A).",
        },
        {
            skillStart   = 350, skillEnd = 360,
            recipeName   = "Elixir of Major Agility",
            outputItemId = 22831,
            quantity     = 10, color = "yellow",
            materials = {
                { name = "Felweed",        itemId = 22785, quantity = 10 },
                { name = "Nightmare Vine", itemId = 22792, quantity = 10 },
                { name = "Imbued Vial",    itemId = 18256, quantity = 10 },
            },
        },
        {
            skillStart   = 360, skillEnd = 375,
            recipeName   = "Super Healing Potion",
            outputItemId = 22829,
            quantity     = 15, color = "yellow",
            materials = {
                { name = "Netherbloom", itemId = 22791, quantity = 15 },
                { name = "Felweed",     itemId = 22785, quantity = 15 },
                { name = "Imbued Vial", itemId = 18256, quantity = 15 },
            },
            notes = "Yellow - may need extras. Congratulations on 375!",
        },
    },
}
