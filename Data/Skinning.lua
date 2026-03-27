-- Artisan: Skinning Data (1-375 TBC Anniversary)
-- Source: wow-professions.com/tbc/skinning-leveling-guide-tbc-classic
-- Pure gathering profession - all steps use isGathering with zone routes.
-- Skill formula: under 100 = (skill/10)+10 max mob level; 100+ = skill/5 max level.
-- Must have a Skinning Knife in bags at all times (sold near LW/General vendors).

ArtisanData = ArtisanData or {}

ArtisanData["Skinning"] = {
    professionName = "Skinning",
    maxSkill       = 375,
    icon           = "Interface\\Icons\\INV_Misc_Pelt_Wolf_01",

    steps = {
        {
            skillStart  = 1, skillEnd = 75,
            isGathering = true,
            zoneName    = "Durotar / Dun Morogh",
            herbs = {
                { name = "Ruined Leather Scraps", itemId = 2934 },
                { name = "Light Leather",         itemId = 2318 },
            },
            notes = "Buy a Skinning Knife from any Leatherworking Supply or General vendor - it must be in your bags. Skin every beast while questing in your starting zone. Horde: circuit around Orgrimmar toward Sen'jin Village. Alliance: circuit around Ironforge lake toward Loch Modan. Learn Journeyman Skinning at your trainer by skill 50.",
        },
        {
            isTrainer     = true,
            skillStart    = 50, skillEnd = 51,
            recipeName    = "Learn Journeyman Skinning",
            charLevel     = 5,
            grantsMaxRank = 150,
            notes         = "Thuwd in Orgrimmar (H) or Balthus Stoneflayer in Ironforge (A). Also available from guards - ask for directions.",
        },
        {
            skillStart  = 75, skillEnd = 130,
            isGathering = true,
            zoneName    = "The Barrens / Loch Modan / Wetlands",
            herbs = {
                { name = "Light Leather",  itemId = 2318 },
                { name = "Medium Leather", itemId = 2319 },
            },
            notes = "Horde: skin beasts heading south from Crossroads to Camp Taurajo, then into Thousand Needles. Learn Expert Skinning at Dranh in Camp Taurajo when you reach 125. Alliance: follow the river south through Loch Modan, then fly to Wetlands. Learn Expert Skinning at Balthus Stoneflayer in Ironforge (125+).",
        },
        {
            isTrainer     = true,
            skillStart    = 125, skillEnd = 126,
            recipeName    = "Learn Expert Skinning",
            charLevel     = 20,
            grantsMaxRank = 225,
            notes         = "Dranh at Camp Taurajo in The Barrens (H) or Balthus Stoneflayer in Ironforge (A). Must reach at least skill 125 before you can learn it.",
        },
        {
            skillStart  = 130, skillEnd = 205,
            isGathering = true,
            zoneName    = "Thousand Needles / Arathi Highlands",
            herbs = {
                { name = "Medium Leather", itemId = 2319 },
                { name = "Heavy Leather",  itemId = 4234 },
                { name = "Heavy Hide",     itemId = 4235 },
            },
            notes = "Thousand Needles has abundant skinnable beasts along the cliffs. Move to Arathi Highlands at 155+ to skin level 31-35 Raptors near Stromgarde. Heavy Hide is a rare drop worth saving for Leatherworking.",
        },
        {
            isTrainer     = true,
            skillStart    = 200, skillEnd = 201,
            recipeName    = "Learn Artisan Skinning",
            charLevel     = 35,
            grantsMaxRank = 300,
            notes         = "Kulleg Stonehorn at Camp Mojache in Feralas (H) or Balthus Stoneflayer in Ironforge (A). Must have skill 205+ before you can learn it.",
        },
        {
            skillStart  = 205, skillEnd = 280,
            isGathering = true,
            zoneName    = "Feralas / Un'Goro Crater",
            herbs = {
                { name = "Heavy Leather",  itemId = 4234 },
                { name = "Thick Leather",  itemId = 4304 },
                { name = "Thick Hide",     itemId = 8169 },
            },
            notes = "Start around Camp Mojache (205-230). Move to the Yeti cave at 230 - Yetis give great skill-ups and Heavy Hide. Head to Un'Goro Crater at 260 for Thick Leather from raptors, gorillas and devilsaurs. Stay on the outer walls to avoid elites.",
        },
        {
            skillStart  = 280, skillEnd = 300,
            isGathering = true,
            zoneName    = "Un'Goro Crater / Eastern Plaguelands",
            herbs = {
                { name = "Thick Leather", itemId = 4304 },
                { name = "Rugged Leather", itemId = 8170 },
                { name = "Rugged Hide",   itemId = 8171 },
            },
            notes = "Continue in Un'Goro or head to Eastern Plaguelands for Plaguebats and undead beasts. Rich Thorium Veins are here if you have Mining too. Learn Master Skinning before entering Outland.",
        },
        {
            isTrainer     = true,
            skillStart    = 275, skillEnd = 276,
            recipeName    = "Learn Master Skinning",
            charLevel     = 50,
            grantsMaxRank = 375,
            notes         = "Moorutu at Thrallmar (H) in Hellfire Peninsula - near the inn behind a mammoth bone. Jelena Nightsky at Honor Hold (A) - inside the inn. Also Seymour in Shattrath City (both factions). Requires Skinning 275.",
        },
        {
            skillStart  = 300, skillEnd = 330,
            isGathering = true,
            zoneName    = "Hellfire Peninsula",
            herbs = {
                { name = "Knothide Leather",       itemId = 21887 },
                { name = "Knothide Leather Scraps", itemId = 25649 },
            },
            notes = "Start with Starving Helboars near Zeth'gor (300-305), then Deranged Helboars (305-310), then Razorfang Hatchlings and Ravagers (310+). Dense beast population makes HFP the fastest 300-330 zone. Knothide Leather Scraps combine 5:1 into Knothide Leather at the Leatherworking trainer.",
        },
        {
            skillStart  = 330, skillEnd = 375,
            isGathering = true,
            zoneName    = "Nagrand",
            herbs = {
                { name = "Knothide Leather",      itemId = 21887 },
                { name = "Thick Clefthoof Leather", itemId = 25708 },
                { name = "Fel Hide",              itemId = 25707 },
            },
            notes = "Kill and skin Talbuks and Clefthoofs across Nagrand. At skill 360 you can skin every mob in Outland. Clefthoofs drop Thick Clefthoof Leather (needed for LW Drums of Battle), Felboars and Felbats drop Fel Hide (needed for LW Drums of Panic). Congratulations on 375!",
        },
    },
}
