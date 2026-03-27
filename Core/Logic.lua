-- Artisan: Core Logic
-- Uses GetSkillLineInfo() for TBC Classic compatibility.
-- GetProfessions() does NOT exist in TBC Classic (added in Cataclysm).

ArtisanLogic = {}

local PROF_NAME_MAP = {
    ["Alchemy"]        = "Alchemy",
    ["Tailoring"]      = "Tailoring",
    ["Blacksmithing"]  = "Blacksmithing",
    ["Engineering"]    = "Engineering",
    ["Leatherworking"] = "Leatherworking",
    ["Enchanting"]     = "Enchanting",
    ["Jewelcrafting"]  = "Jewelcrafting",
    ["Cooking"]        = "Cooking",
    ["First Aid"]      = "First Aid",
    ["Herbalism"]      = "Herbalism",
    ["Mining"]         = "Mining",
    ["Skinning"]       = "Skinning",
    ["Fishing"]        = "Fishing",
}

-- ============================================================
-- GET PLAYER PROFESSIONS
-- Uses GetSkillLineInfo() which is the correct TBC Classic API.
-- GetProfessions() was added in Cataclysm and does not exist here.
-- ============================================================
function ArtisanLogic:GetPlayerProfessions()
    local found = {}
    local numSkills = GetNumSkillLines()
    for i = 1, numSkills do
        -- GetSkillLineInfo full signature (TBC Classic):
        -- name, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, ...
        -- Position 5 is numTempPoints (always 0), position 7 is the actual skill cap.
        local name, isHeader, _, rank, _, _, maxRank = GetSkillLineInfo(i)
        if not isHeader and name then
            local dataKey = PROF_NAME_MAP[name]
            if dataKey and ArtisanData and ArtisanData[dataKey] then
                table.insert(found, {
                    name    = name,
                    dataKey = dataKey,
                    rank    = rank or 0,
                    maxRank = maxRank or ArtisanData[dataKey].maxSkill,
                })
            end
        end
    end
    return found
end

-- ============================================================
-- GET ALL AVAILABLE GUIDES (fallback when player has none)
-- ============================================================
function ArtisanLogic:GetAllGuides()
    local list = {}
    if not ArtisanData then return list end
    for key, data in pairs(ArtisanData) do
        table.insert(list, {
            name    = data.professionName,
            dataKey = key,
            rank    = 0,
            maxRank = data.maxSkill,
        })
    end
    table.sort(list, function(a, b) return a.name < b.name end)
    return list
end

-- ============================================================
-- GET CURRENT STEP
-- ============================================================
function ArtisanLogic:GetCurrentStep(dataKey, currentSkill)
    local data = ArtisanData and ArtisanData[dataKey]
    if not data then return 1, nil end

    for i, step in ipairs(data.steps) do
        if currentSkill >= step.skillStart and currentSkill < step.skillEnd then
            return i, step
        end
    end
    if currentSkill >= data.maxSkill then
        return #data.steps, data.steps[#data.steps]
    end
    return 1, data.steps[1]
end

-- ============================================================
-- GET MATERIALS NEEDED (from current step onward)
-- ============================================================
function ArtisanLogic:GetMaterialsNeeded(dataKey, fromStepIndex, maxSkillCap)
    local data = ArtisanData and ArtisanData[dataKey]
    if not data then return {} end

    -- Build a set of every item that is itself CRAFTED by a step in this guide.
    -- Materials whose itemId appears in this set are intermediate products -
    -- their raw ingredients are already costed in the shopping list, so we
    -- display them but do NOT add their price to the total.
    local craftedOutputs = {}
    for _, step in ipairs(data.steps) do
        if step.outputItemId and not step.isTrainer and not step.isGathering then
            craftedOutputs[step.outputItemId] = true
        end
    end

    local needed = {}
    for i = fromStepIndex, #data.steps do
        local step = data.steps[i]
        -- Skip steps at or above the skill cap filter (e.g. hide 300+ content)
        if maxSkillCap and step.skillStart >= maxSkillCap then
            -- filtered out
        elseif not step.isTrainer and not step.isGathering and step.materials then
            for _, mat in ipairs(step.materials) do
                if needed[mat.itemId] then
                    needed[mat.itemId].quantity = needed[mat.itemId].quantity + mat.quantity
                else
                    needed[mat.itemId] = {
                        name      = mat.name,
                        itemId    = mat.itemId,
                        quantity  = mat.quantity,
                        isCrafted = craftedOutputs[mat.itemId] == true,
                    }
                end
            end
        end
    end

    local list = {}
    for _, m in pairs(needed) do
        m.have      = self:GetItemCount(m.itemId)
        m.stillNeed = math.max(0, m.quantity - m.have)
        -- Only price raw materials, not crafted intermediates
        if not m.isCrafted then
            m.priceEach = self:GetTSMPrice(m.itemId)
            if m.priceEach and m.stillNeed > 0 then
                m.totalPrice = m.priceEach * m.stillNeed
            end
        end
        table.insert(list, m)
    end
    table.sort(list, function(a, b)
        -- Raw materials first, then crafted intermediates
        if a.isCrafted ~= b.isCrafted then return not a.isCrafted end
        return a.name < b.name
    end)
    return list
end

-- ============================================================
-- ITEM ICON  (for shopping list & material display)
-- Uses GetItemInfo which returns the icon as the 10th value.
-- Returns nil if item not yet cached (client will cache on use).
-- ============================================================
function ArtisanLogic:GetItemIcon(itemId)
    local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemId)
    return icon  -- e.g. "Interface\\Icons\\INV_Misc_Herb_Felweed"
end

-- ============================================================
-- SPELL / RECIPE ICON
-- ============================================================
function ArtisanLogic:GetRecipeIcon(spellId)
    if not spellId then return nil end
    return GetSpellTexture(spellId)
end

-- ============================================================
-- INVENTORY LOOKUP
-- TSM stores counts in TSM.characters[name].bags/bank/mail
-- keyed by itemString ("i:12345"). We try the public API first,
-- then fall back to reading the internal table directly.
-- ============================================================
function ArtisanLogic:GetItemCount(itemId)
    local itemString = "i:" .. itemId

    -- Method 1: TSM4 modern API (GetCustomPriceValue with NumInventory)
    if TSM_API and TSM_API.GetCustomPriceValue then
        local ok, count = pcall(TSM_API.GetCustomPriceValue, "NumInventory", itemString)
        if ok and count and count > 0 then return count end
    end

    -- Method 2: TSM4 GetPlayerTotals (older TSM4 Classic builds)
    if TSM_API and TSM_API.GetPlayerTotals then
        local ok, count = pcall(TSM_API.GetPlayerTotals, itemString)
        if ok and count and count > 0 then return count end
    end

    -- Method 3: Read TSM.characters table directly
    -- TSM stores: TSM.characters[charName].bags[itemString] = count
    -- Also .bank, .mail, .reagentbank
    if TSM and TSM.characters then
        local total = 0
        for _, cdata in pairs(TSM.characters) do
            total = total + (cdata.bags        and cdata.bags[itemString]        or 0)
            total = total + (cdata.bank        and cdata.bank[itemString]        or 0)
            total = total + (cdata.mail        and cdata.mail[itemString]        or 0)
            total = total + (cdata.reagentbank and cdata.reagentbank[itemString] or 0)
        end
        if total > 0 then return total end
    end

    -- Fallback: current character bags only (no TSM)
    return GetItemCount(itemId) or 0
end

-- ============================================================
-- TSM PRICE
-- Price source strings in TSM4 on TBC Classic are lowercase.
-- Try AtrValue (Auctionator) first - most accurate on Anniversary
-- since TSM's own dbmarket feed is delayed. Fall back to dbmarket,
-- then dbregionmarketavg.
-- ============================================================
function ArtisanLogic:GetTSMPrice(itemId)
    if not TSM_API then return nil end
    local item = "i:" .. itemId
    -- Auctionator price (most accurate on Anniversary realms)
    local ok, p = pcall(function() return TSM_API.GetCustomPriceValue("first(AtrValue,DBMarket,DBRegionMarketAvg)", item) end)
    if ok and p and p > 0 then return p end
    -- Explicit fallbacks if the formula string isn't supported
    local ok2, p2 = pcall(function() return TSM_API.GetCustomPriceValue("dbmarket", item) end)
    if ok2 and p2 and p2 > 0 then return p2 end
    local ok3, p3 = pcall(function() return TSM_API.GetCustomPriceValue("dbregionmarketavg", item) end)
    if ok3 and p3 and p3 > 0 then return p3 end
    return nil
end

function ArtisanLogic:IsTSMAvailable() return TSM_API ~= nil end

-- ============================================================
-- FORMAT MONEY
-- ============================================================
function ArtisanLogic:FormatMoney(copper)
    if not copper or copper <= 0 then return "0c" end
    local g = math.floor(copper / 10000)
    local s = math.floor((copper % 10000) / 100)
    local c = copper % 100
    local r = ""
    if g > 0 then r = r .. "|cFFFFD700" .. g .. "g|r " end
    if s > 0 then r = r .. "|cFFC0C0C0" .. s .. "s|r " end
    if c > 0 or r == "" then r = r .. "|cFFB87333" .. c .. "c|r" end
    return r
end

function ArtisanLogic:GetTotalLevelingCost(dataKey, fromStep, maxSkillCap)
    if not self:IsTSMAvailable() then return nil end
    local total = 0
    for _, m in ipairs(self:GetMaterialsNeeded(dataKey, fromStep, maxSkillCap)) do
        if m.totalPrice then total = total + m.totalPrice end
    end
    return total > 0 and total or nil
end
