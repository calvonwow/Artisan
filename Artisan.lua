-- Artisan: Main Entry Point
-- Minimap button uses polar coordinate positioning (cos/sin angle math)
-- and SetMaskTexture to clip the icon into a perfect circle.

local ADDON_NAME = "Artisan"
local DEFAULTS   = { version = "0.3.0", lastProfession = nil, minimapAngle = 225, hideAbove300 = false }

-- ============================================================
-- EVENTS
-- ============================================================
local eventFrame = CreateFrame("Frame", "ArtisanEventFrame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("SKILL_LINES_CHANGED")
eventFrame:RegisterEvent("BAG_UPDATE_DELAYED")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == ADDON_NAME then
        if not ArtisanDB then ArtisanDB = {} end
        for k, v in pairs(DEFAULTS) do
            if ArtisanDB[k] == nil then ArtisanDB[k] = v end
        end
        -- Pre-request GetItemInfo for every item in every guide immediately
        -- at load time.  By the time the player opens the window, the server
        -- will have responded and icons will be in the cache.
        if ArtisanData then
            for _, profData in pairs(ArtisanData) do
                for _, step in ipairs(profData.steps or {}) do
                    if step.outputItemId then GetItemInfo(step.outputItemId) end
                    for _, mat in ipairs(step.materials or {}) do
                        GetItemInfo(mat.itemId)
                    end
                end
            end
        end
        print("|cFF00CCFFArtisan|r loaded.  |cFFFFD700/art|r to open.")

    elseif event == "PLAYER_ENTERING_WORLD" then
        if ArtisanUI and ArtisanDB and ArtisanDB.lastProfession then
            ArtisanUI.currentDataKey = ArtisanDB.lastProfession
        end

    elseif event == "SKILL_LINES_CHANGED" then
        -- Auto-update the open window whenever any skill level changes.
        if ArtisanUI and ArtisanUI.mainFrame and ArtisanUI.mainFrame:IsShown() then
            ArtisanUI:OnSkillUpdate()
        end

    elseif event == "BAG_UPDATE_DELAYED" then
        -- Re-render the shopping list when bags change so the "Est:" total
        -- and the Have/Buy columns stay current as materials are picked up.
        if ArtisanUI and ArtisanUI.mainFrame and ArtisanUI.mainFrame:IsShown()
        and ArtisanUI.currentTab == "shopping" then
            ArtisanUI:RenderShoppingList()
        end
    end
end)

-- ============================================================
-- SLASH COMMANDS
-- ============================================================
SLASH_ARTISAN1 = "/artisan"
SLASH_ARTISAN2 = "/art"

SlashCmdList["ARTISAN"] = function(msg)
    local cmd = (msg or ""):lower():match("^%s*(.-)%s*$")
    if cmd == "" or cmd == "show" or cmd == "open" then
        ArtisanUI:Toggle()
    elseif cmd == "hide" or cmd == "close" then
        if ArtisanUI.mainFrame then ArtisanUI.mainFrame:Hide() end
    elseif cmd == "reset" then
        if ArtisanUI.mainFrame then
            ArtisanUI.mainFrame:ClearAllPoints()
            ArtisanUI.mainFrame:SetPoint("CENTER")
        end
        print("|cFF00CCFFArtisan|r: Window position reset.")
    elseif cmd == "status" then
        print("|cFF00CCFFArtisan|r status:")
        print(ArtisanLogic:IsTSMAvailable() and "  TSM: |cFF00FF00Connected|r (inventory tracking active)" or "  TSM: |cFFFF4444Not found|r (install TSM for cross-character inventory)")
    elseif cmd == "help" then
        print("|cFF00CCFFArtisan|r: /art [show|hide|reset|status|help]")
    else
        print("|cFF00CCFFArtisan|r: Unknown command. /art help")
    end
end

-- ============================================================
-- MINIMAP BUTTON
-- ----------------------------------------------------------------
-- Spec taken directly from the working Calculator addon (LibDBIcon
-- exact measurements):
--   button:  34 x 34
--   overlay: MiniMap-TrackingBorder  53x53  @ TOPLEFT (0, 0)
--   bg:      UI-Minimap-Background   20x20  @ TOPLEFT (7, -5)
--   icon:    Trade_Alchemy           17x17  @ TOPLEFT (7, -6)
-- Position: polar coords  cos(angle)*80, sin(angle)*80 from
--           Minimap center.  Angle saved to ArtisanDB.
-- ============================================================

local minimapAngle = 220

local mb = CreateFrame("Button", "ArtisanMinimapButton", Minimap)
mb:SetWidth(34)
mb:SetHeight(34)
mb:SetFrameStrata("MEDIUM")
mb:SetFrameLevel(8)
mb:RegisterForClicks("anyUp")
mb:RegisterForDrag("LeftButton")

-- Outer chrome ring (drawn on top of everything)
local mbOverlay = mb:CreateTexture(nil, "OVERLAY")
mbOverlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
mbOverlay:SetSize(53, 53)
mbOverlay:SetPoint("TOPLEFT", mb, "TOPLEFT", 0, 0)

-- Circular background (the dark circle that icons sit on)
local mbBg = mb:CreateTexture(nil, "BACKGROUND")
mbBg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
mbBg:SetSize(20, 20)
mbBg:SetPoint("TOPLEFT", mb, "TOPLEFT", 7, -5)

-- Icon: original Trade_Alchemy icon restored
local mbIcon = mb:CreateTexture(nil, "ARTWORK")
mbIcon:SetTexture("Interface\\Icons\\Trade_Alchemy")
mbIcon:SetSize(17, 17)
mbIcon:SetPoint("TOPLEFT", mb, "TOPLEFT", 7, -6)
mbIcon:SetTexCoord(0.05, 0.95, 0.05, 0.95)

-- -- Position helper -----------------------------------------
local function placeBtn()
    local r = math.rad(minimapAngle)
    mb:ClearAllPoints()
    mb:SetPoint("CENTER", Minimap, "CENTER", math.cos(r) * 80, math.sin(r) * 80)
end

-- Wait for PLAYER_LOGIN so ArtisanDB is fully loaded before positioning
local mbLoginFrame = CreateFrame("Frame")
mbLoginFrame:RegisterEvent("PLAYER_LOGIN")
mbLoginFrame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    minimapAngle = (ArtisanDB and ArtisanDB.minimapAngle) or 220
    placeBtn()
end)

-- -- Drag to reposition ---------------------------------------
mb:SetScript("OnDragStart", function()
    mb:SetScript("OnUpdate", function()
        local scale = UIParent:GetEffectiveScale()
        local cx, cy = GetCursorPosition()
        local mx, my = Minimap:GetCenter()
        if mx then
            minimapAngle = math.deg(math.atan2((cy / scale) - my, (cx / scale) - mx))
            if ArtisanDB then ArtisanDB.minimapAngle = minimapAngle end
            placeBtn()
        end
    end)
end)
mb:SetScript("OnDragStop", function() mb:SetScript("OnUpdate", nil) end)

-- -- Click ----------------------------------------------------
mb:SetScript("OnClick", function()
    ArtisanUI:Toggle()
end)

-- -- Tooltip -------------------------------------------------
mb:SetScript("OnEnter", function()
    GameTooltip:SetOwner(mb, "ANCHOR_LEFT")
    GameTooltip:AddLine("|cFF00CCFFArtisan|r - Profession Guide")
    GameTooltip:AddLine("Click to open / close.", 1, 1, 1)
    GameTooltip:AddLine("Drag to reposition.", 0.8, 0.8, 0.8)
    GameTooltip:Show()
end)
mb:SetScript("OnLeave", function() GameTooltip:Hide() end)
