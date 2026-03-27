-- Artisan: Herbalism Data (1-375 TBC Anniversary)
-- isGathering steps use zones[] instead of materials[].
-- herbs[] is for display/tooltip only - no quantity tracking needed.

ArtisanData = ArtisanData or {}

ArtisanData["Herbalism"] = {
    professionName = "Herbalism",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\INV_Misc_Herb_01",

    steps = {
        -- ── Classic Phase 1-300 ──────────────────────────────────
        {
            skillStart  = 1,  skillEnd = 50,
            isGathering = true,
            zoneName    = "Any Starter Zone",
            herbs = {
                { name = "Peacebloom",  itemId = 2447 },
                { name = "Silverleaf",  itemId = 765  },
                { name = "Earthroot",   itemId = 2449 },
            },
            notes = "Any starting zone works. Pick everything in sight - Durotar, Elwynn, Tirisfal all have plenty.",
        },
        -- Journeyman rank
        {
            isTrainer      = true,
            skillStart     = 50, skillEnd = 51,
            recipeName     = "Learn Journeyman Herbalism",
            charLevel      = 10,
            grantsMaxRank  = 150,
            notes          = "Available from any Herbalism trainer in a major city.",
        },
        {
            skillStart  = 50, skillEnd = 100,
            isGathering = true,
            zoneName    = "Barrens / Silverpine Forest",
            herbs = {
                { name = "Mageroyal",   itemId = 785  },
                { name = "Briarthorn",  itemId = 2450 },
                { name = "Earthroot",   itemId = 2449 },
            },
            notes = "Barrens has dense Mageroyal. Silverpine is great for Briarthorn and Earthroot.",
        },
        {
            skillStart  = 100, skillEnd = 115,
            isGathering = true,
            zoneName    = "Stonetalon Mountains / Ashenvale",
            herbs = {
                { name = "Briarthorn",  itemId = 2450 },
                { name = "Mageroyal",   itemId = 785  },
                { name = "Stranglekelp", itemId = 3820 },
            },
            notes = "Stonetalon Mountain sides are packed with Briarthorn and Mageroyal.",
        },
        {
            skillStart  = 115, skillEnd = 130,
            isGathering = true,
            zoneName    = "Hillsbrad Foothills / Ashenvale",
            herbs = {
                { name = "Bruiseweed",      itemId = 2453 },
                { name = "Wild Steelbloom", itemId = 3355 },
                { name = "Kingsblood",      itemId = 3356 },
            },
            notes = "Hillsbrad has consistent Bruiseweed. Kingsblood requires skill 125 so focus Bruiseweed first.",
        },
        -- Expert rank
        {
            isTrainer      = true,
            skillStart     = 125, skillEnd = 126,
            recipeName     = "Learn Expert Herbalism",
            charLevel      = 20,
            grantsMaxRank  = 225,
            notes          = "Available from any Herbalism trainer in a major city.",
        },
        {
            skillStart  = 125, skillEnd = 160,
            isGathering = true,
            zoneName    = "Arathi Highlands / Thousand Needles",
            herbs = {
                { name = "Wild Steelbloom", itemId = 3355 },
                { name = "Kingsblood",      itemId = 3356 },
                { name = "Liferoot",        itemId = 3357 },
            },
            notes = "Arathi mountain sides are the best for Wild Steelbloom. Liferoot requires skill 150.",
        },
        {
            skillStart  = 160, skillEnd = 185,
            isGathering = true,
            zoneName    = "Swamp of Sorrows / Arathi Highlands",
            herbs = {
                { name = "Khadgar's Whisker", itemId = 3358 },
                { name = "Fadeleaf",          itemId = 3818 },
                { name = "Goldthorn",         itemId = 3821 },
            },
            notes = "Swamp of Sorrows is the best spot for Fadeleaf. Khadgar's Whisker requires skill 185.",
        },
        {
            skillStart  = 185, skillEnd = 230,
            isGathering = true,
            zoneName    = "Hinterlands / Feralas",
            herbs = {
                { name = "Goldthorn",         itemId = 3821 },
                { name = "Khadgar's Whisker", itemId = 3358 },
                { name = "Stranglekelp",      itemId = 3820 },
            },
            notes = "Hinterlands has great Goldthorn density. Run circuits around the outer edges.",
        },
        -- Artisan rank
        {
            isTrainer      = true,
            skillStart     = 200, skillEnd = 201,
            recipeName     = "Learn Artisan Herbalism",
            charLevel      = 35,
            grantsMaxRank  = 300,
            notes          = "Available from any Herbalism trainer in a major city.",
        },
        {
            skillStart  = 230, skillEnd = 270,
            isGathering = true,
            zoneName    = "Felwood",
            herbs = {
                { name = "Gromsblood",  itemId = 8846  },
                { name = "Sungrass",    itemId = 8838  },
                { name = "Dreamfoil",   itemId = 13463 },
            },
            notes = "Felwood is ideal here - Plaguebloom and Dreamfoil also give skill points. Pick everything green.",
        },
        {
            skillStart  = 270, skillEnd = 300,
            isGathering = true,
            zoneName    = "Un'Goro Crater / Eastern Plaguelands",
            herbs = {
                { name = "Golden Sansam",      itemId = 13464 },
                { name = "Dreamfoil",          itemId = 13463 },
                { name = "Mountain Silversage", itemId = 13465 },
            },
            notes = "Un'Goro has dense Golden Sansam and Dreamfoil. Eastern Plaguelands also has Mountain Silversage.",
        },
        -- Master rank: Outland required
        {
            isTrainer      = true,
            skillStart     = 275, skillEnd = 276,
            recipeName     = "Learn Master Herbalism",
            charLevel      = 50,
            grantsMaxRank  = 375,
            notes          = "Ruak Stronghorn at Thrallmar (H) or Rorelien at Honor Hold (A) in Hellfire Peninsula. Requires skill 275.",
        },

        -- ── TBC Phase 300-375 ────────────────────────────────────
        {
            skillStart  = 300, skillEnd = 325,
            isGathering = true,
            zoneName    = "Hellfire Peninsula",
            herbs = {
                { name = "Felweed",        itemId = 22785 },
                { name = "Dreaming Glory", itemId = 22786 },
            },
            notes = "Hellfire Peninsula is packed with Felweed. Run wide loops over the open fields.",
        },
        {
            skillStart  = 325, skillEnd = 340,
            isGathering = true,
            zoneName    = "Zangarmarsh",
            herbs = {
                { name = "Ragveil",        itemId = 22787 },
                { name = "Felweed",        itemId = 22785 },
                { name = "Dreaming Glory", itemId = 22786 },
            },
            notes = "Zangarmarsh is herb-dense. The NW corner around Marshlight Lake is especially rich. Loot Bog Lords after killing them - they count as herb nodes.",
        },
        {
            skillStart  = 340, skillEnd = 355,
            isGathering = true,
            zoneName    = "Nagrand / Blade's Edge Mountains",
            herbs = {
                { name = "Dreaming Glory", itemId = 22786 },
                { name = "Felweed",        itemId = 22785 },
                { name = "Terocone",       itemId = 22789 },
            },
            notes = "Nagrand and Blade's Edge both have good Dreaming Glory on rocky outcroppings. Terocone grows near tree bases.",
        },
        {
            skillStart  = 355, skillEnd = 365,
            isGathering = true,
            zoneName    = "Shadowmoon Valley / Blade's Edge",
            herbs = {
                { name = "Nightmare Vine", itemId = 22792 },
                { name = "Dreaming Glory", itemId = 22786 },
            },
            notes = "Nightmare Vine requires skill 365 to gather. Farm Dreaming Glory until you hit 365, then switch.",
        },
        {
            skillStart  = 365, skillEnd = 375,
            isGathering = true,
            zoneName    = "Netherstorm / Shadowmoon Valley",
            herbs = {
                { name = "Netherbloom",    itemId = 22791 },
                { name = "Nightmare Vine", itemId = 22792 },
                { name = "Mana Thistle",   itemId = 22793 },
            },
            notes = "Netherstorm has the best Netherbloom density. Mana Thistle only spawns in flight-accessible areas. Congratulations on 375!",
        },
    },
}
