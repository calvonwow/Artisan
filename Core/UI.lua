-- Artisan: UI Layer
-- Icons added to guide steps (recipe icon) and shopping list (item icon).

ArtisanUI = {}

local C = {
    orange = "|cFFFF8000",
    yellow = "|cFFFFFF00",
    green  = "|cFF00FF00",
    gray   = "|cFF808080",
    white  = "|cFFFFFFFF",
    gold   = "|cFFFFD700",
    cyan   = "|cFF00CCFF",
    red    = "|cFFFF4444",
    reset  = "|r",
}

local FRAME_W    = 520
local FRAME_H    = 650
local PAD        = 12
local STEP_H     = 64
local ROW_H      = 24
local ICON_S     = 36
local MAT_ICON   = 18
local BAR_H      = 22
-- Custom frame layout constants (replaces Blizzard BasicFrameTemplate chrome)
local HEADER_H   = 34    -- title bar height in pixels
local ACCENT_H   = 2     -- gradient accent line below header
local TOP_CHROME = HEADER_H + ACCENT_H   -- 36px total top chrome
local ROW1_Y     = -(TOP_CHROME + 12)    -- -48:  dropdown / status row
local ROW2_Y     = -(TOP_CHROME + 36)    -- -72:  tab row
local BAR_Y      = -(TOP_CHROME + 64)    -- -100: skill progress bar
local CONTENT_Y  = -(TOP_CHROME + 96)    -- -132: guide / shopping panels

-- DEBUG: when true, dropdown shows all guides regardless of learned professions
local debugShowAll = false

-- ============================================================
-- HELPERS used only inside CreateMainFrame
-- ============================================================

-- One-pixel border line on a given side of a frame
local function MakeBorderLine(parent, side, r, g, b, a)
    local t = parent:CreateTexture(nil, "BORDER")
    t:SetColorTexture(r or 0.22, g or 0.24, b or 0.30, a or 1.0)
    if side == "TOP" then
        t:SetHeight(1)
        t:SetPoint("TOPLEFT",  parent, "TOPLEFT",  0,  0)
        t:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0,  0)
    elseif side == "BOTTOM" then
        t:SetHeight(1)
        t:SetPoint("BOTTOMLEFT",  parent, "BOTTOMLEFT",  0, 0)
        t:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
    elseif side == "LEFT" then
        t:SetWidth(1)
        t:SetPoint("TOPLEFT",    parent, "TOPLEFT",    0, 0)
        t:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 0)
    elseif side == "RIGHT" then
        t:SetWidth(1)
        t:SetPoint("TOPRIGHT",    parent, "TOPRIGHT",    0, 0)
        t:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
    end
    return t
end

-- TSM-style flat tab button:
-- inactive: dim text, no accent line
-- active:   bright text, gradient bottom accent, slightly lighter bg
local function MakeTSMTab(parent, label, w)
    local tab = CreateFrame("Button", nil, parent)
    tab:SetSize(w or 138, 28)

    local bg = tab:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.0, 0.0, 0.0, 0.0)  -- transparent by default
    tab._bg = bg

    -- Hover highlight (built-in HIGHLIGHT layer fades on mouse)
    local hl = tab:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetColorTexture(1.0, 1.0, 1.0, 0.04)

    local lbl = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    lbl:SetPoint("CENTER", 0, 1)
    lbl:SetText(label)
    tab._lbl   = lbl
    tab._label = label

    -- Active accent line (2px gradient at bottom edge)
    local aline = tab:CreateTexture(nil, "OVERLAY")
    aline:SetHeight(2)
    aline:SetPoint("BOTTOMLEFT",  tab, "BOTTOMLEFT",  4, 0)
    aline:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", -4, 0)
    aline:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    aline:SetGradient("HORIZONTAL",
        CreateColor(0.0, 0.80, 1.0, 1.0),
        CreateColor(0.55, 0.0, 0.88, 1.0))
    aline:Hide()
    tab._aline = aline

    function tab:Activate()
        self._bg:SetColorTexture(0.13, 0.16, 0.22, 1.0)
        self._lbl:SetTextColor(1.0, 1.0, 1.0, 1.0)
        self._aline:Show()
    end
    function tab:Deactivate()
        self._bg:SetColorTexture(0.0, 0.0, 0.0, 0.0)
        self._lbl:SetTextColor(0.50, 0.55, 0.65, 1.0)
        self._aline:Hide()
    end

    tab:Deactivate()
    return tab
end

-- Slim flat action button (Refresh, etc.)
local function MakeFlatButton(parent, label, w, h)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(w or 74, h or 22)

    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.14, 0.17, 0.23, 1.0)
    btn._bg = bg

    MakeBorderLine(btn, "TOP",    0.28, 0.32, 0.42, 0.8)
    MakeBorderLine(btn, "BOTTOM", 0.28, 0.32, 0.42, 0.8)
    MakeBorderLine(btn, "LEFT",   0.28, 0.32, 0.42, 0.8)
    MakeBorderLine(btn, "RIGHT",  0.28, 0.32, 0.42, 0.8)

    local lbl = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lbl:SetPoint("CENTER")
    lbl:SetText(label)
    lbl:SetTextColor(0.60, 0.78, 1.0, 1.0)
    btn._lbl = lbl  -- store so callers can tint it

    btn:SetScript("OnEnter", function()
        btn._bg:SetColorTexture(0.20, 0.24, 0.34, 1.0)
    end)
    btn:SetScript("OnLeave", function()
        btn._bg:SetColorTexture(0.14, 0.17, 0.23, 1.0)
    end)
    return btn
end

-- ============================================================
-- MAIN FRAME  (custom TSM-style, no Blizzard template)
-- ============================================================
function ArtisanUI:CreateMainFrame()
    if self.mainFrame then return end

    -- -- Root frame ----------------------------------------------
    local f = CreateFrame("Frame", "ArtisanMainFrame", UIParent)
    f:SetSize(FRAME_W, FRAME_H)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetClampedToScreen(true)
    f:SetFrameStrata("HIGH")
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop",  f.StopMovingOrSizing)
    f:Hide()

    -- -- Main background -----------------------------------------
    local mainBg = f:CreateTexture(nil, "BACKGROUND")
    mainBg:SetAllPoints()
    mainBg:SetColorTexture(0.085, 0.095, 0.115, 0.97)

    -- Outer border
    MakeBorderLine(f, "TOP")
    MakeBorderLine(f, "BOTTOM")
    MakeBorderLine(f, "LEFT")
    MakeBorderLine(f, "RIGHT")

    -- -- Header bar ----------------------------------------------
    local headerBg = f:CreateTexture(nil, "BACKGROUND")
    headerBg:SetHeight(HEADER_H)
    headerBg:SetPoint("TOPLEFT",  f, "TOPLEFT",  1, -1)
    headerBg:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -1)
    headerBg:SetColorTexture(0.12, 0.14, 0.18, 1.0)

    -- Thin separator at bottom of header bg
    local headerSep = f:CreateTexture(nil, "BORDER")
    headerSep:SetHeight(1)
    headerSep:SetPoint("TOPLEFT",  f, "TOPLEFT",  1, -(HEADER_H))
    headerSep:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -(HEADER_H))
    headerSep:SetColorTexture(0.06, 0.07, 0.09, 1.0)

    -- Gradient accent line (cyan -> purple)
    local accentLine = f:CreateTexture(nil, "ARTWORK")
    accentLine:SetHeight(ACCENT_H)
    accentLine:SetPoint("TOPLEFT",  f, "TOPLEFT",  1, -(HEADER_H + 1))
    accentLine:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -(HEADER_H + 1))
    accentLine:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    accentLine:SetGradient("HORIZONTAL",
        CreateColor(0.0, 0.80, 1.0, 1.0),
        CreateColor(0.55, 0.0, 0.88, 1.0))

    -- Addon icon in header (profession icon, 20x20)
    local headerIcon = f:CreateTexture(nil, "OVERLAY")
    headerIcon:SetSize(20, 20)
    headerIcon:SetPoint("LEFT", f, "TOPLEFT", 10, -(HEADER_H / 2))
    headerIcon:SetTexture("Interface\\Icons\\Trade_Alchemy")
    headerIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    f.headerIcon = headerIcon

    -- Title text
    local titleText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("LEFT", f, "TOPLEFT", 36, -(HEADER_H / 2))
    titleText:SetText("|cFF00CCFFArtisan|r  -  Profession Guide")
    f.titleText = titleText

    -- Close button (flat X, red on hover)
    local closeBtn = CreateFrame("Button", nil, f)
    closeBtn:SetSize(30, HEADER_H)
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -1)

    local closeBg = closeBtn:CreateTexture(nil, "BACKGROUND")
    closeBg:SetAllPoints()
    closeBg:SetColorTexture(0, 0, 0, 0)

    local closeX = closeBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    closeX:SetPoint("CENTER", 0, 0)
    closeX:SetText("X")
    closeX:SetTextColor(0.45, 0.48, 0.55, 1.0)

    closeBtn:SetScript("OnEnter", function()
        closeBg:SetColorTexture(0.72, 0.12, 0.10, 0.85)
        closeX:SetTextColor(1.0, 1.0, 1.0, 1.0)
    end)
    closeBtn:SetScript("OnLeave", function()
        closeBg:SetColorTexture(0, 0, 0, 0)
        closeX:SetTextColor(0.45, 0.48, 0.55, 1.0)
    end)
    closeBtn:SetScript("OnClick", function() f:Hide() end)

    -- Thin rule below all header chrome (top of content area)
    local contentRule = f:CreateTexture(nil, "BORDER")
    contentRule:SetHeight(1)
    contentRule:SetPoint("TOPLEFT",  f, "TOPLEFT",  0, -(TOP_CHROME + 1))
    contentRule:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, -(TOP_CHROME + 1))
    contentRule:SetColorTexture(0.18, 0.20, 0.26, 0.6)

    -- -- Row 1: Profession label + custom dropdown + show-all + status ----
    local ddLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ddLabel:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, ROW1_Y - 5)
    ddLabel:SetText("|cFF6677AA" .. "Profession:" .. "|r")

    -- Custom TSM-style dropdown -------------------------------------
    -- The "button" is a flat frame showing current selection + a caret.
    -- Clicking it toggles a popup list parented to UIParent (so it
    -- renders above everything) but positioned under the button.
    local DD_W, DD_H = 170, 24

    local ddBtn = CreateFrame("Button", "ArtisanDDButton", f)
    ddBtn:SetSize(DD_W, DD_H)
    ddBtn:SetPoint("TOPLEFT", f, "TOPLEFT", 84, ROW1_Y + 2)

    local ddBtnBg = ddBtn:CreateTexture(nil, "BACKGROUND")
    ddBtnBg:SetAllPoints()
    ddBtnBg:SetColorTexture(0.10, 0.12, 0.17, 1.0)

    MakeBorderLine(ddBtn, "TOP",    0.25, 0.28, 0.40, 0.9)
    MakeBorderLine(ddBtn, "BOTTOM", 0.25, 0.28, 0.40, 0.9)
    MakeBorderLine(ddBtn, "LEFT",   0.25, 0.28, 0.40, 0.9)
    MakeBorderLine(ddBtn, "RIGHT",  0.25, 0.28, 0.40, 0.9)

    local ddBtnHL = ddBtn:CreateTexture(nil, "HIGHLIGHT")
    ddBtnHL:SetAllPoints()
    ddBtnHL:SetColorTexture(1, 1, 1, 0.05)

    -- Selected-value label (left-aligned, truncated)
    local ddBtnText = ddBtn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ddBtnText:SetPoint("LEFT", ddBtn, "LEFT", 7, 0)
    ddBtnText:SetPoint("RIGHT", ddBtn, "RIGHT", -18, 0)
    ddBtnText:SetJustifyH("LEFT")
    ddBtnText:SetText("|cFF7788AA" .. "Select..." .. "|r")
    ddBtn._label = ddBtnText

    -- Caret (v) on right side
    local ddCaret = ddBtn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ddCaret:SetPoint("RIGHT", ddBtn, "RIGHT", -5, 0)
    ddCaret:SetText("|cFF5566AA" .. "v" .. "|r")

    -- Popup list frame (parented to UIParent so it floats above everything)
    local ddPopup = CreateFrame("Frame", "ArtisanDDPopup", UIParent)
    ddPopup:SetWidth(DD_W)
    ddPopup:SetFrameStrata("TOOLTIP")
    ddPopup:SetFrameLevel(200)
    ddPopup:Hide()

    local ddPopupBg = ddPopup:CreateTexture(nil, "BACKGROUND")
    ddPopupBg:SetAllPoints()
    ddPopupBg:SetColorTexture(0.08, 0.10, 0.14, 0.98)

    MakeBorderLine(ddPopup, "TOP",    0.25, 0.28, 0.40, 0.9)
    MakeBorderLine(ddPopup, "BOTTOM", 0.25, 0.28, 0.40, 0.9)
    MakeBorderLine(ddPopup, "LEFT",   0.25, 0.28, 0.40, 0.9)
    MakeBorderLine(ddPopup, "RIGHT",  0.25, 0.28, 0.40, 0.9)

    -- Popup positioning helper: anchors popup below the button
    local function PositionDDPopup()
        ddPopup:ClearAllPoints()
        ddPopup:SetPoint("TOPLEFT", ddBtn, "BOTTOMLEFT", 0, -2)
    end

    -- Close popup when clicking anywhere outside it
    local ddDismiss = CreateFrame("Frame", nil, UIParent)
    ddDismiss:SetAllPoints(UIParent)
    ddDismiss:SetFrameStrata("DIALOG")
    ddDismiss:SetFrameLevel(199)
    ddDismiss:EnableMouse(true)
    ddDismiss:Hide()
    ddDismiss:SetScript("OnMouseDown", function()
        ddPopup:Hide()
        ddDismiss:Hide()
        ddCaret:SetText("|cFF5566AA" .. "v" .. "|r")
    end)

    -- Public API expected by RefreshDropdown / Toggle
    ddBtn._popup   = ddPopup
    ddBtn._dismiss = ddDismiss
    ddBtn._caret   = ddCaret
    ddBtn._items   = {}     -- list of {text, value} built by RefreshDropdown
    ddBtn._value   = nil    -- currently selected dataKey

    -- Toggle popup open/closed
    ddBtn:SetScript("OnClick", function()
        if ddPopup:IsShown() then
            ddPopup:Hide()
            ddDismiss:Hide()
            ddCaret:SetText("|cFF5566AA" .. "v" .. "|r")
        else
            PositionDDPopup()
            ddPopup:Show()
            ddDismiss:Show()
            ddCaret:SetText("|cFF5566AA" .. "^" .. "|r")
        end
    end)

    -- Store on frame
    f.dropdown = ddBtn

    -- DEBUG: toggle button that shows all professions regardless of what player has learned
    local debugBtn = MakeFlatButton(f, "Show All", 74, 22)
    debugBtn:SetPoint("LEFT", ddBtn, "RIGHT", 4, 0)

    -- Start dimmed to show it's a debug/inactive toggle
    debugBtn._lbl:SetTextColor(0.55, 0.55, 0.55)
    debugBtn:SetScript("OnClick", function()
        debugShowAll = not debugShowAll
        if debugShowAll then
            debugBtn._lbl:SetTextColor(1.0, 0.65, 0.0)   -- orange = active
        else
            debugBtn._lbl:SetTextColor(0.55, 0.55, 0.55) -- gray = off
        end
        ArtisanUI:RefreshDropdown()
        local key = f.dropdown._value
        if key then ArtisanUI:LoadProfession(key) end
    end)

    local statusText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    statusText:SetPoint("TOPRIGHT", f, "TOPRIGHT", -PAD, ROW1_Y - 5)
    statusText:SetText(self:GetIntegrationStatus())
    f.statusText = statusText

    -- -- Row 2: Flat TSM-style tabs -------------------------------
    local tabGuide = MakeTSMTab(f, "Guide", 138)
    tabGuide:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, ROW2_Y)
    tabGuide:SetScript("OnClick", function() ArtisanUI:ShowTab("guide") end)
    f.tabGuide = tabGuide

    local tabShopping = MakeTSMTab(f, "Shopping List", 138)
    tabShopping:SetPoint("LEFT", tabGuide, "RIGHT", 2, 0)
    tabShopping:SetScript("OnClick", function() ArtisanUI:ShowTab("shopping") end)
    f.tabShopping = tabShopping

    -- Tab row bottom separator
    local tabSep = f:CreateTexture(nil, "BORDER")
    tabSep:SetHeight(1)
    tabSep:SetPoint("TOPLEFT",  f, "TOPLEFT",  0, ROW2_Y - 28)
    tabSep:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, ROW2_Y - 28)
    tabSep:SetColorTexture(0.20, 0.22, 0.30, 0.5)

    -- Activate guide tab by default
    tabGuide:Activate()

    -- -- Skill progress bar ---------------------------------------
    local barW = FRAME_W - PAD * 2 - 18

    local barTrack = CreateFrame("Frame", nil, f)
    barTrack:SetSize(barW, BAR_H)
    barTrack:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, BAR_Y)

    local trackBg = barTrack:CreateTexture(nil, "BACKGROUND")
    trackBg:SetAllPoints()
    trackBg:SetColorTexture(0.05, 0.06, 0.08, 1.0)

    MakeBorderLine(barTrack, "TOP",    0.22, 0.25, 0.35, 0.8)
    MakeBorderLine(barTrack, "BOTTOM", 0.22, 0.25, 0.35, 0.8)
    MakeBorderLine(barTrack, "LEFT",   0.22, 0.25, 0.35, 0.8)
    MakeBorderLine(barTrack, "RIGHT",  0.22, 0.25, 0.35, 0.8)

    local barFill = barTrack:CreateTexture(nil, "ARTWORK")
    barFill:SetHeight(BAR_H - 2)
    barFill:SetPoint("LEFT", barTrack, "LEFT", 1, 0)
    barFill:SetWidth(1)
    barFill:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    barFill:SetGradient("HORIZONTAL",
        CreateColor(0.05, 0.35, 1.0, 1.0),
        CreateColor(0.65, 0.0,  0.90, 1.0))

    local barShine = barTrack:CreateTexture(nil, "OVERLAY")
    barShine:SetHeight(3)
    barShine:SetPoint("TOPLEFT",  barTrack, "TOPLEFT",  1, -1)
    barShine:SetPoint("TOPRIGHT", barTrack, "TOPRIGHT", -1, -1)
    barShine:SetColorTexture(1.0, 1.0, 1.0, 0.10)

    local barText = barTrack:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    barText:SetPoint("CENTER", barTrack, "CENTER", 0, 0)
    barText:SetText("")

    f.skillBarTrack = barTrack
    f.skillBarFill  = barFill
    f.skillBarText  = barText
    f._skillBarW    = barW

    -- Thin separator below bar
    local barSep = f:CreateTexture(nil, "BORDER")
    barSep:SetHeight(1)
    barSep:SetPoint("TOPLEFT",  f, "TOPLEFT",  PAD,       CONTENT_Y + 2)
    barSep:SetPoint("TOPRIGHT", f, "TOPRIGHT", -(PAD+18), CONTENT_Y + 2)
    barSep:SetColorTexture(0.20, 0.22, 0.30, 0.4)

    -- -- Guide Panel ----------------------------------------------
    local gPanel = CreateFrame("Frame", nil, f)
    gPanel:SetPoint("TOPLEFT",     f, "TOPLEFT",     PAD,       CONTENT_Y)
    gPanel:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -(PAD+18),  PAD)

    local gScroll = CreateFrame("ScrollFrame", "ArtisanGuideScroll", gPanel, "UIPanelScrollFrameTemplate")
    gScroll:SetPoint("TOPLEFT",     gPanel, "TOPLEFT",     0, 0)
    gScroll:SetPoint("BOTTOMRIGHT", gPanel, "BOTTOMRIGHT", 0, 0)

    local gChild = CreateFrame("Frame", nil, gScroll)
    gChild:SetWidth(FRAME_W - PAD*2 - 36)
    gChild:SetHeight(1)
    gScroll:SetScrollChild(gChild)

    gPanel.scrollFrame = gScroll
    gPanel.scrollChild = gChild
    f.guidePanel = gPanel

    -- -- Shopping Panel -------------------------------------------
    local sPanel = CreateFrame("Frame", nil, f)
    sPanel:SetPoint("TOPLEFT",     f, "TOPLEFT",     PAD,       CONTENT_Y)
    sPanel:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -(PAD+18),  PAD)
    sPanel:Hide()

    local sScroll = CreateFrame("ScrollFrame", "ArtisanShopScroll", sPanel, "UIPanelScrollFrameTemplate")
    sScroll:SetPoint("TOPLEFT",     sPanel, "TOPLEFT",     0, 0)
    sScroll:SetPoint("BOTTOMRIGHT", sPanel, "BOTTOMRIGHT", 0, 0)

    local sChild = CreateFrame("Frame", nil, sScroll)
    sChild:SetWidth(FRAME_W - PAD*2 - 36)
    sChild:SetHeight(1)
    sScroll:SetScrollChild(sChild)

    sPanel.scrollFrame = sScroll
    sPanel.scrollChild = sChild
    f.shopPanel = sPanel

    self.mainFrame  = f
    self.currentTab = "guide"
    self:RefreshDropdown()
end

-- ============================================================
-- HELPER: create an icon texture on a parent frame
-- ============================================================
local function MakeIcon(parent, size, x, y)
    local tex = parent:CreateTexture(nil, "ARTWORK")
    tex:SetSize(size, size)
    tex:SetPoint("TOPLEFT", parent, "TOPLEFT", x, -y)
    tex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    return tex
end

-- ============================================================
-- DROPDOWN POPULATION
-- ============================================================
function ArtisanUI:RefreshDropdown()
    local f  = self.mainFrame
    local dd = f and f.dropdown
    if not dd then return end

    local popup = dd._popup

    -- Clear previous rows
    for _, child in ipairs({ popup:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    -- Build item list
    local profs
    if debugShowAll then
        profs = ArtisanLogic:GetAllGuides()
    else
        profs = ArtisanLogic:GetPlayerProfessions()
        if #profs == 0 then profs = ArtisanLogic:GetAllGuides() end
    end

    local ITEM_H = 24
    local items  = {}

    if #profs == 0 then
        items = { { text = "|cFF666666No guides available|r", value = nil, disabled = true } }
    else
        for _, prof in ipairs(profs) do
            local label = (prof.rank and prof.rank > 0)
                and (prof.name .. " (" .. prof.rank .. "/" .. prof.maxRank .. ")")
                or   prof.name
            table.insert(items, { text = label, value = prof.dataKey })
        end
    end

    dd._items = items

    -- Keep the collapsed button label in sync with the freshly-read skill data.
    -- This is the text that's always visible even when the popup is closed.
    if dd._value then
        for _, item in ipairs(items) do
            if item.value == dd._value then
                dd._label:SetText("|cFFFFFFFF" .. item.text .. "|r")
                break
            end
        end
    end

    -- Rebuild popup rows
    local popupW = dd:GetWidth()
    local yOff   = 1  -- 1px inset for border

    for i, item in ipairs(items) do
        local row = CreateFrame("Button", nil, popup)
        row:SetSize(popupW - 2, ITEM_H)
        row:SetPoint("TOPLEFT", popup, "TOPLEFT", 1, -yOff)

        local rowBg = row:CreateTexture(nil, "BACKGROUND")
        rowBg:SetAllPoints()
        rowBg:SetColorTexture(0, 0, 0, 0)
        row._bg = rowBg

        -- Hover tint
        row:SetScript("OnEnter", function()
            rowBg:SetColorTexture(0.16, 0.48, 0.80, 0.20)
        end)
        row:SetScript("OnLeave", function()
            -- Keep a subtle highlight on the selected row
            if dd._value == item.value then
                rowBg:SetColorTexture(0.14, 0.17, 0.26, 1.0)
            else
                rowBg:SetColorTexture(0, 0, 0, 0)
            end
        end)

        -- Thin separator between rows
        if i > 1 then
            local sep = row:CreateTexture(nil, "BORDER")
            sep:SetHeight(1)
            sep:SetPoint("TOPLEFT",  row, "TOPLEFT",  4, 0)
            sep:SetPoint("TOPRIGHT", row, "TOPRIGHT", -4, 0)
            sep:SetColorTexture(0.18, 0.20, 0.28, 0.6)
        end

        -- Label
        local lbl = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        lbl:SetPoint("LEFT",  row, "LEFT",  8, 0)
        lbl:SetPoint("RIGHT", row, "RIGHT", -8, 0)
        lbl:SetJustifyH("LEFT")

        if item.disabled then
            lbl:SetText(item.text)
        elseif dd._value == item.value then
            lbl:SetText("|cFF00CCFF" .. item.text .. "|r")
            rowBg:SetColorTexture(0.14, 0.17, 0.26, 1.0)
        else
            lbl:SetText("|cFFCCCCCC" .. item.text .. "|r")
        end

        if not item.disabled then
            row:SetScript("OnClick", function()
                -- Update selection
                dd._value = item.value
                dd._label:SetText("|cFFFFFFFF" .. item.text .. "|r")

                -- Close popup
                popup:Hide()
                dd._dismiss:Hide()
                dd._caret:SetText("|cFF5566AA" .. "v" .. "|r")

                -- Reload profession
                ArtisanUI:LoadProfession(item.value)

                -- Refresh row colors
                ArtisanUI:RefreshDropdown()
            end)
        end

        yOff = yOff + ITEM_H
    end

    -- Size popup to fit rows exactly
    popup:SetHeight(yOff + 1)
end

-- ============================================================
-- TAB SWITCHING
-- ============================================================
function ArtisanUI:ShowTab(which)
    self.currentTab = which
    local f = self.mainFrame
    if which == "guide" then
        f.guidePanel:Show()
        f.shopPanel:Hide()
        f.tabGuide:Activate()
        f.tabShopping:Deactivate()
    else
        f.guidePanel:Hide()
        f.shopPanel:Show()
        f.tabGuide:Deactivate()
        f.tabShopping:Activate()
        self:RenderShoppingList()
    end
end

-- ============================================================
-- LOAD PROFESSION
-- ============================================================
function ArtisanUI:LoadProfession(dataKey)
    self.currentDataKey  = dataKey
    ArtisanDB.lastProfession = dataKey

    local data = ArtisanData and ArtisanData[dataKey]
    if not data then return end

    local currentSkill = 0
    local playerMaxRank = 0
    for _, p in ipairs(ArtisanLogic:GetPlayerProfessions()) do
        if p.dataKey == dataKey then
            currentSkill = p.rank
            playerMaxRank = p.maxRank
            break
        end
    end
    self.currentSkill = currentSkill
    self.playerMaxRank = playerMaxRank

    local stepIdx = ArtisanLogic:GetCurrentStep(dataKey, currentSkill)
    self.currentStepIndex = stepIdx

    local f = self.mainFrame
    f.statusText:SetText(self:GetIntegrationStatus())

    -- -- Update skill progress bar --------------------------------
    local barW     = f._skillBarW or (FRAME_W - PAD * 2 - 18)
    local maxSkill = data.maxSkill
    local pct      = currentSkill > 0 and (currentSkill / maxSkill) or 0
    pct = math.min(pct, 1.0)

    local fillW = math.max(math.floor((barW - 2) * pct), 2)
    f.skillBarFill:SetWidth(fillW)

    if currentSkill >= maxSkill then
        f.skillBarText:SetText(data.professionName .. "  " .. maxSkill .. " / " .. maxSkill .. "  (Maxed!)")
    elseif currentSkill == 0 then
        f.skillBarText:SetText(data.professionName .. "  (skill not detected)")
    else
        f.skillBarText:SetText(data.professionName .. "   " .. currentSkill .. " / " .. maxSkill)
    end

    -- Pre-request GetItemInfo for every item so the client caches them.
    -- Icons will be correct on first render if cached, or after next Refresh.
    for _, step in ipairs(data.steps) do
        if step.isGathering and step.herbs then
            for _, herb in ipairs(step.herbs) do
                GetItemInfo(herb.itemId)
            end
        elseif not step.isTrainer and not step.isGathering then
            if step.outputItemId then GetItemInfo(step.outputItemId) end
            if step.materials then
                for _, mat in ipairs(step.materials) do
                    GetItemInfo(mat.itemId)
                end
            end
        end
    end

    self:RenderGuideSteps(data, stepIdx, currentSkill, playerMaxRank)
    if self.currentTab == "shopping" then self:RenderShoppingList() end
end

-- ============================================================
-- AUTO-UPDATE ON SKILL GAIN
-- Called by SKILL_LINES_CHANGED.  Re-reads the current skill for
-- the loaded profession and re-renders only if something changed,
-- so there's no flicker on unrelated skill events.
-- ============================================================
function ArtisanUI:OnSkillUpdate()
    local dataKey = self.currentDataKey
    if not dataKey then return end

    -- Re-read current skill from the skill line API
    local newSkill   = 0
    local newMaxRank = 0
    for _, p in ipairs(ArtisanLogic:GetPlayerProfessions()) do
        if p.dataKey == dataKey then
            newSkill   = p.rank
            newMaxRank = p.maxRank
            break
        end
    end

    -- Always refresh the dropdown label so the collapsed button text stays
    -- current (skill count updates even before the step changes).
    self:RefreshDropdown()

    -- Nothing else to do if the skill didn't actually change.
    if newSkill == self.currentSkill then return end

    -- Determine whether the active step will change so we can decide whether
    -- to auto-scroll.  We scroll to the new step only when advancing — not on
    -- every single skill gain — so the player can freely scroll mid-step to
    -- read notes without being snapped back on the next craft.
    local oldStepIdx = self.currentStepIndex
    local newStepIdx = ArtisanLogic:GetCurrentStep(dataKey, newSkill)
    local stepChanged = (newStepIdx ~= oldStepIdx)

    -- Save the current scroll position before re-rendering so we can restore
    -- it if the step hasn't changed.
    local scrollbar = _G["ArtisanGuideScrollScrollBar"]
    local savedScroll = scrollbar and scrollbar:GetValue() or 0

    self:LoadProfession(dataKey)

    -- Restore the scroll position when the step hasn't changed so skill-up
    -- events don't jerk the guide back to the top of the current step.
    if not stepChanged and scrollbar then
        scrollbar:SetValue(savedScroll)
    end
end


-- Creates a hidden FontString of the given width, sets the text,
-- and reads back GetStringHeight() for the actual wrapped height.
-- Works on hidden frames in TBC Classic's Lua environment.
-- ============================================================
local _measureFrame = nil
local function MeasureText(text, fontObj, width)
    if not _measureFrame then
        _measureFrame = CreateFrame("Frame", nil, UIParent)
        _measureFrame:SetSize(1, 1)
        _measureFrame._fs = _measureFrame:CreateFontString(nil, "OVERLAY", fontObj or "GameFontNormalSmall")
    end
    local fs = _measureFrame._fs
    if fontObj then fs:SetFontObject(fontObj) end
    fs:SetWidth(width)
    fs:SetText(text)
    return math.max(fs:GetStringHeight(), 14)  -- minimum 14px (single line)
end

-- ============================================================
-- RENDER GUIDE STEPS  (with recipe icons)
-- ============================================================
function ArtisanUI:RenderGuideSteps(data, currentStepIndex, currentSkill, playerMaxRank)
    playerMaxRank = playerMaxRank or 0
    local guidePanel = self.mainFrame.guidePanel
    local gScroll    = guidePanel.scrollFrame

    -- Hide the old child (hides all its children including FontStrings).
    -- Do NOT SetParent(nil) - that reparents to UIParent causing ghost frames.
    local oldChild = guidePanel.scrollChild
    if oldChild then oldChild:Hide() end

    -- Fresh child frame - SetScrollChild auto-detaches the old one
    local child = CreateFrame("Frame", nil, gScroll)
    child:SetWidth(FRAME_W - PAD*2 - 36)
    child:SetHeight(1)
    gScroll:SetScrollChild(child)
    guidePanel.scrollChild = child

    local totalH = 0
    local rowWidth = child:GetWidth()

    for i, step in ipairs(data.steps) do
        local isActive    = (i == currentStepIndex)
        -- For trainer steps: completed when the player's actual maxRank
        -- proves they trained that rank (e.g. Master grants maxRank 375).
        -- For craft/gathering steps: completed when currentSkill passed skillEnd.
        local isCompleted
        if step.isTrainer and step.grantsMaxRank then
            isCompleted = (playerMaxRank >= step.grantsMaxRank)
        else
            isCompleted = (currentSkill > 0 and currentSkill >= step.skillEnd)
        end

        -- -- Dynamic row height ----------------------------------
        -- Measure the actual notes text height so rows never overlap.
        -- Available text width = rowWidth minus left margin minus right pad.
        local TITLE_H  = 22   -- line 1 (title / skill range)
        local LINE2_H  = 18   -- line 2 (mats / herbs)
        local TOP_PAD  = 8    -- padding above line 1
        local BOT_PAD  = 8    -- padding below last line
        local textW    = rowWidth - 56  -- conservative: works for all textX values

        local notesH = 0
        if step.notes then
            -- Strip colour codes for measurement (they add no visible width)
            local plainNotes = "Note: " .. step.notes
            notesH = MeasureText(plainNotes, "GameFontNormalSmall", textW) + 4
        end

        local rowH
        if step.isTrainer then
            rowH = TOP_PAD + TITLE_H + (step.notes and (4 + notesH) or 0) + BOT_PAD
        elseif step.isGathering then
            rowH = TOP_PAD + TITLE_H + LINE2_H + (step.notes and (4 + notesH) or 0) + BOT_PAD
        else
            rowH = TOP_PAD + TITLE_H + LINE2_H + (step.notes and (4 + notesH) or 0) + BOT_PAD
        end
        rowH = math.max(rowH, 48)  -- minimum sensible height

        local row = CreateFrame("Frame", nil, child)
        row:SetWidth(rowWidth)
        row:SetHeight(rowH)
        row:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -totalH)

        -- Background
        local bg = row:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        if step.isTrainer then
            -- Amber tint for trainer steps
            if isActive    then bg:SetColorTexture(0.20, 0.14, 0.02, 0.6)
            elseif isCompleted then bg:SetColorTexture(0.05, 0.04, 0.02, 0.4)
            else               bg:SetColorTexture(0.12, 0.09, 0.02, 0.35) end
        elseif step.isGathering then
            -- Green tint for gathering steps
            if isActive    then bg:SetColorTexture(0.04, 0.18, 0.06, 0.6)
            elseif isCompleted then bg:SetColorTexture(0.02, 0.05, 0.02, 0.4)
            else               bg:SetColorTexture(0.03, 0.10, 0.04, 0.30) end
        else
            if isActive    then bg:SetColorTexture(0.05, 0.25, 0.05, 0.5)
            elseif isCompleted then bg:SetColorTexture(0.03, 0.03, 0.03, 0.4)
            else               bg:SetColorTexture(0.04, 0.08, 0.16, 0.3) end
        end

        local sepLine = row:CreateTexture(nil, "ARTWORK")
        sepLine:SetHeight(1)
        sepLine:SetPoint("BOTTOMLEFT",  row, "BOTTOMLEFT",  0, 0)
        sepLine:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", 0, 0)
        sepLine:SetColorTexture(0.25, 0.25, 0.25, 0.6)

        -- -- TRAINER STEP rendering ------------------------------
        if step.isTrainer then
            -- Book / scroll icon
            local iconTex = row:CreateTexture(nil, "ARTWORK")
            iconTex:SetSize(30, 30)
            iconTex:SetPoint("TOPLEFT", row, "TOPLEFT", 6, -8)
            iconTex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            iconTex:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
            if isCompleted then iconTex:SetVertexColor(0.45, 0.40, 0.30) end

            local textX = 44

            local statusBadge
            if isCompleted then
                statusBadge = C.green  .. "[DONE]" .. C.reset .. " "
            elseif step.isAlt then
                statusBadge = C.cyan   .. "[ALT] " .. C.reset .. " "
            elseif isActive then
                statusBadge = C.orange .. "[NOW] " .. C.reset .. " "
            else
                statusBadge = C.red    .. "[NEXT]" .. C.reset .. " "
            end

            local titleCol = isCompleted and C.gray or isActive and C.gold or C.gray

            local t1 = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            t1:SetPoint("TOPLEFT", row, "TOPLEFT", textX, -8)
            t1:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
            t1:SetJustifyH("LEFT")
            t1:SetText(
                statusBadge ..
                titleCol .. step.recipeName .. C.reset ..
                (step.charLevel and (C.gray .. "  (character level " .. step.charLevel .. ")" .. C.reset) or "")
            )

            if step.notes then
                local t2 = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                t2:SetPoint("TOPLEFT", row, "TOPLEFT", textX, -(TOP_PAD + TITLE_H + 4))
                t2:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
                t2:SetJustifyH("LEFT")
                t2:SetText(C.gray .. step.notes .. C.reset)
            end

            totalH = totalH + rowH
        elseif step.isGathering then
        -- -- GATHERING STEP rendering -----------------------------
            -- Icon = first herb of this step (with tooltip)
            local firstHerb = step.herbs and step.herbs[1]
            local iconTex = row:CreateTexture(nil, "ARTWORK")
            iconTex:SetSize(30, 30)
            iconTex:SetPoint("TOPLEFT", row, "TOPLEFT", 6, -(rowH/2 - 15))
            iconTex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            if firstHerb then
                local herbIcon = select(10, GetItemInfo(firstHerb.itemId))
                iconTex:SetTexture(herbIcon or "Interface\\Icons\\INV_Misc_Herb_01")
            else
                iconTex:SetTexture("Interface\\Icons\\INV_Misc_Herb_01")
            end
            if isCompleted then iconTex:SetVertexColor(0.35, 0.45, 0.35) end

            -- Tooltip button on the icon
            if firstHerb then
                local hId = firstHerb.itemId
                local tipBtn = CreateFrame("Button", nil, row)
                tipBtn:SetSize(30, 30)
                tipBtn:SetPoint("TOPLEFT", row, "TOPLEFT", 6, -(rowH/2 - 15))
                tipBtn:SetScript("OnEnter", function(self)
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetHyperlink("item:" .. hId)
                    GameTooltip:Show()
                end)
                tipBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
            end

            local textX = 44

            local statusBadge
            if isCompleted then
                statusBadge = C.green  .. "[DONE]" .. C.reset .. " "
            elseif step.isAlt then
                statusBadge = C.cyan   .. "[ALT] " .. C.reset .. " "
            elseif isActive then
                statusBadge = C.orange .. "[NOW] " .. C.reset .. " "
            else
                statusBadge = C.red    .. "[NEXT]" .. C.reset .. " "
            end

            local zoneCol = isActive and C.gold or C.gray

            -- Skill range color: same rules as craft steps
            local gSkillCol
            if isActive then
                gSkillCol = C.gold
            elseif isCompleted then
                gSkillCol = C.gray
            else
                gSkillCol = C.red   -- all future gathering steps show red range
            end

            -- Line 1: badge + skill range + zone name
            local g1 = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            g1:SetPoint("TOPLEFT", row, "TOPLEFT", textX, -TOP_PAD)
            g1:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
            g1:SetJustifyH("LEFT")
            g1:SetText(
                statusBadge ..
                gSkillCol .. step.skillStart .. " - " .. step.skillEnd .. C.reset ..
                "  " .. zoneCol .. step.zoneName .. C.reset
            )

            -- Line 2: small herb icons + herb names
            local line2Y = TOP_PAD + TITLE_H + 2
            if step.herbs and #step.herbs > 0 then
                local herbX = textX
                for _, herb in ipairs(step.herbs) do
                    local hIcon = row:CreateTexture(nil, "ARTWORK")
                    hIcon:SetSize(14, 14)
                    hIcon:SetPoint("TOPLEFT", row, "TOPLEFT", herbX, -line2Y)
                    hIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
                    local herbIcon = select(10, GetItemInfo(herb.itemId))
                    hIcon:SetTexture(herbIcon or "Interface\\Icons\\INV_Misc_Herb_01")
                    if isCompleted then hIcon:SetVertexColor(0.5, 0.5, 0.5) end

                    local hId2 = herb.itemId
                    local hBtn = CreateFrame("Button", nil, row)
                    hBtn:SetSize(14, 14)
                    hBtn:SetPoint("TOPLEFT", row, "TOPLEFT", herbX, -line2Y)
                    hBtn:SetScript("OnEnter", function(self)
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:SetHyperlink("item:" .. hId2)
                        GameTooltip:Show()
                    end)
                    hBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
                    herbX = herbX + 18
                end

                local herbParts = {}
                for _, herb in ipairs(step.herbs) do
                    table.insert(herbParts, (isCompleted and C.gray or "|cFF88BB88") .. herb.name .. C.reset)
                end
                local g2 = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                g2:SetPoint("TOPLEFT", row, "TOPLEFT", herbX + 2, -line2Y)
                g2:SetPoint("RIGHT",   row, "RIGHT", -8, 0)
                g2:SetJustifyH("LEFT")
                g2:SetText(table.concat(herbParts, "|cFF445566,  |r"))
            end

            -- Notes: anchored below the herbs line with measured spacing
            if step.notes then
                local notesY = TOP_PAD + TITLE_H + LINE2_H + 6
                local g3 = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                g3:SetPoint("TOPLEFT", row, "TOPLEFT", textX + 2, -notesY)
                g3:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
                g3:SetJustifyH("LEFT")
                g3:SetText("|cFF556677Note: |r" .. C.gray .. step.notes .. C.reset)
            end

            totalH = totalH + rowH
        else
        -- -- CRAFT STEP rendering --------------------------------
        local iconY = -((rowH - ICON_S) / 2)

        local iconTex = row:CreateTexture(nil, "ARTWORK")
        iconTex:SetSize(ICON_S, ICON_S)
        iconTex:SetPoint("TOPLEFT", row, "TOPLEFT", 6, iconY)
        iconTex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        if isCompleted then iconTex:SetVertexColor(0.4, 0.4, 0.4) end

        -- Use GetItemInfo on the output item for the correct icon.
        -- Fall back to the profession icon (never show a question mark).
        local profIcon = (ArtisanData[self.currentDataKey] and ArtisanData[self.currentDataKey].icon) or "Interface\\Icons\\Trade_Alchemy"
        local stepIcon = step.outputItemId and select(10, GetItemInfo(step.outputItemId))
        iconTex:SetTexture(stepIcon or profIcon)

        -- Invisible button over the icon to capture mouse events for tooltip.
        -- Textures cannot receive mouse events in TBC Classic; a Button frame can.
        if step.outputItemId then
            local outputId = step.outputItemId  -- upvalue capture for closure
            local tipBtn = CreateFrame("Button", nil, row)
            tipBtn:SetSize(ICON_S, ICON_S)
            tipBtn:SetPoint("TOPLEFT", row, "TOPLEFT", 6, iconY)
            tipBtn:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetHyperlink("item:" .. outputId)
                GameTooltip:Show()
            end)
            tipBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
        end

        -- -- Text area (right of icon) ---------------------------
        local textX = ICON_S + 14

        -- Status badge: uniform width so all lines start at the same x
        local statusBadge
        if isCompleted then
            statusBadge = C.green  .. "[DONE]" .. C.reset .. " "
        elseif step.isAlt then
            statusBadge = C.cyan   .. "[ALT] " .. C.reset .. " "
        elseif isActive then
            statusBadge = C.orange .. "[NOW] " .. C.reset .. " "
        else
            statusBadge = C.red    .. "[NEXT]" .. C.reset .. " "
        end

        -- Skill range color: gold=active, gray=done, red=any future step
        -- (orange/yellow recipe color applies to the name only, not the range)
        local skillCol
        if isActive then
            skillCol = C.gold
        elseif isCompleted then
            skillCol = C.gray
        else
            skillCol = C.red   -- all [NEXT] steps: red range matches red badge
        end

        -- Recipe name: only the active step uses the skill-range color.
        -- Completed and future steps both get gray names.
        local nameCol = isActive and skillCol or C.gray

        -- Line 1: status badge  |  skill range  |  qty x Recipe Name
        local line1 = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        line1:SetPoint("TOPLEFT", row, "TOPLEFT", textX, -7)
        line1:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
        line1:SetJustifyH("LEFT")
        line1:SetText(
            statusBadge ..
            skillCol .. step.skillStart .. " - " .. step.skillEnd .. C.reset ..
            "  " ..
            nameCol .. step.quantity .. "x " .. step.recipeName .. C.reset
        )

        -- Line 2: materials, comma-separated, no dots
        local matParts = {}
        for _, mat in ipairs(step.materials) do
            local have = isActive and ArtisanLogic:GetItemCount(mat.itemId) or 0
            local col
            if isCompleted then
                col = C.gray
            elseif not isActive then
                col = C.gray           -- future steps: all ingredients gray
            elseif have >= mat.quantity then
                col = C.green
            elseif have > 0 then
                col = C.yellow
            else
                col = "|cFFAAAAAA"     -- active but missing: slightly dim white
            end
            local haveStr = (isActive and have > 0)
                and (C.gray .. " (" .. have .. ")" .. C.reset)
                or ""
            table.insert(matParts, col .. mat.quantity .. "x " .. mat.name .. C.reset .. haveStr)
        end

        local line2 = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        line2:SetPoint("TOPLEFT", row, "TOPLEFT", textX + 2, -25)
        line2:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
        line2:SetJustifyH("LEFT")
        -- Comma separator keeps it clean without random dots
        line2:SetText(table.concat(matParts, "|cFF445566,  |r"))

        -- Notes line anchored below materials with computed offset
        if step.notes then
            local notesY = TOP_PAD + TITLE_H + LINE2_H + 6
            local line3 = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            line3:SetPoint("TOPLEFT", row, "TOPLEFT", textX + 2, -notesY)
            line3:SetPoint("RIGHT",   row, "RIGHT",   -8, 0)
            line3:SetJustifyH("LEFT")
            line3:SetText("|cFF556677Note: |r" .. C.gray .. step.notes .. C.reset)
        end  -- if step.notes (craft)

        totalH = totalH + rowH
        end  -- if step.isTrainer ... else (craft)
    end  -- for each step

    child:SetHeight(math.max(totalH, 1))

    -- Jump to the current step.  We MUST go through the scrollbar's SetValue
    -- rather than calling SetVerticalScroll directly.  SetVerticalScroll only
    -- moves the viewport; it does NOT update the scrollbar's internal value.
    -- When the player then scrolls with the mouse wheel, ScrollFrame_OnMouseWheel
    -- reads scrollbar:GetValue() (still 0) and computes the new position from
    -- there, snapping everything back to the top.  SetValue keeps both in sync.
    if currentStepIndex and currentStepIndex > 2 then
        local targetScroll = math.max(0, (currentStepIndex - 2) * STEP_H)
        local scrollbar = _G["ArtisanGuideScrollScrollBar"]
        if scrollbar then
            scrollbar:SetValue(targetScroll)
        else
            -- Fallback if the named global isn't available yet
            self.mainFrame.guidePanel.scrollFrame:SetVerticalScroll(targetScroll)
        end
    end
end

-- ============================================================
-- RENDER SHOPPING LIST  (with item icons)
-- ============================================================
function ArtisanUI:RenderShoppingList()
    local shopPanel = self.mainFrame.shopPanel
    local dataKey   = self.currentDataKey

    -- Replace the scroll child entirely so stale FontStrings (which
    -- GetChildren() misses) don't bleed through on profession switch.
    local oldScroll = shopPanel.scrollFrame

    -- Hide the old child (hides all its children including FontStrings).
    -- Do NOT SetParent(nil) - that reparents to UIParent causing ghost frames.
    -- SetScrollChild(newChild) auto-detaches the old one.
    local oldChild = shopPanel.scrollChild
    if oldChild then oldChild:Hide() end

    -- Fresh child frame
    local child = CreateFrame("Frame", nil, oldScroll)
    child:SetWidth(FRAME_W - PAD*2 - 36)
    child:SetHeight(1)
    oldScroll:SetScrollChild(child)
    shopPanel.scrollChild = child
    oldScroll:SetVerticalScroll(0)

    if not dataKey then
        local lbl = child:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        lbl:SetPoint("TOPLEFT", child, "TOPLEFT", PAD, -PAD)
        lbl:SetText(C.gray .. "Select a profession first." .. C.reset)
        child:SetHeight(40)
        return
    end

    local stepIdx    = self.currentStepIndex or 1
    local hideAbove300 = ArtisanDB and ArtisanDB.hideAbove300
    local maxSkillCap  = hideAbove300 and 300 or nil
    local mats      = ArtisanLogic:GetMaterialsNeeded(dataKey, stepIdx, maxSkillCap)
    local totalCost = ArtisanLogic:GetTotalLevelingCost(dataKey, stepIdx, maxSkillCap)
    local yOff = 0

    -- Header
    local hdr = CreateFrame("Frame", nil, child)
    hdr:SetWidth(child:GetWidth())
    hdr:SetHeight(38)
    hdr:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -yOff)
    local hbg = hdr:CreateTexture(nil, "BACKGROUND")
    hbg:SetAllPoints(); hbg:SetColorTexture(0.08, 0.08, 0.18, 0.7)

    local hTitle = hdr:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    hTitle:SetPoint("TOPLEFT", hdr, "TOPLEFT", PAD, -6)
    hTitle:SetText(
        C.cyan .. "Materials - Step " .. stepIdx .. " onward" .. C.reset ..
        (totalCost and ("   " .. C.gold .. "Est: " .. ArtisanLogic:FormatMoney(totalCost) .. C.reset) or "")
    )
    local invSrc = ArtisanLogic:IsTSMAvailable() and "TSM (all characters)" or "bags only"
    local hSub = hdr:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    hSub:SetPoint("TOPLEFT", hTitle, "BOTTOMLEFT", 0, -2)
    hSub:SetText(C.gray .. "Inventory: " .. invSrc ..
        (ArtisanLogic:IsTSMAvailable() and "   Prices: TSM DBMarket" or "") .. C.reset)

    -- Hide 300+ toggle button (top-right of header) - matches "Show All" style
    local filterBtn = MakeFlatButton(hdr, "Hide 300+", 84, 22)
    filterBtn:SetPoint("RIGHT", hdr, "RIGHT", -PAD, 0)
    if hideAbove300 then
        filterBtn._lbl:SetTextColor(1.0, 0.65, 0.0)   -- orange = active
    else
        filterBtn._lbl:SetTextColor(0.55, 0.55, 0.55) -- gray = off
    end
    filterBtn:SetScript("OnClick", function()
        if ArtisanDB then ArtisanDB.hideAbove300 = not ArtisanDB.hideAbove300 end
        ArtisanUI:RenderShoppingList()
    end)
    filterBtn:SetScript("OnEnter", function()
        filterBtn._bg:SetColorTexture(0.20, 0.24, 0.34, 1.0)
        GameTooltip:SetOwner(filterBtn, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Hide materials above skill 300", 1, 1, 1)
        GameTooltip:AddLine("Filters out steps with skillStart >= 300.", 0.8, 0.8, 0.8)
        GameTooltip:AddLine("TBC content is usually grinded, not bought.", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    filterBtn:SetScript("OnLeave", function()
        filterBtn._bg:SetColorTexture(0.14, 0.17, 0.23, 1.0)
        GameTooltip:Hide()
    end)

    yOff = yOff + 42

    -- Column headers
    local cols = CreateFrame("Frame", nil, child)
    cols:SetWidth(child:GetWidth()); cols:SetHeight(20)
    cols:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -yOff)
    local cbg = cols:CreateTexture(nil, "BACKGROUND")
    cbg:SetAllPoints(); cbg:SetColorTexture(0.12, 0.12, 0.12, 0.8)

    local function CH(x, txt)
        local fs = cols:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs:SetPoint("TOPLEFT", cols, "TOPLEFT", x, -4)
        fs:SetText(C.gray .. txt .. C.reset)
    end
    CH(PAD + MAT_ICON + 6, "Material")
    CH(260, "Need")
    CH(300, "Have")
    CH(345, "Buy")
    CH(385, "Price ea.")
    yOff = yOff + 22

    -- Material rows
    for i, mat in ipairs(mats) do
        local matId = mat.itemId  -- upvalue for closures

        local row = CreateFrame("Frame", nil, child)
        row:SetWidth(child:GetWidth()); row:SetHeight(ROW_H)
        row:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -yOff)
        row:EnableMouse(true)
        local rbg = row:CreateTexture(nil, "BACKGROUND")
        rbg:SetAllPoints()
        rbg:SetColorTexture(i % 2 == 0 and 0.06 or 0.03, 0.06, 0.10, 0.5)

        -- Item icon (texture only - mouse handled by row frame below)
        local ico = row:CreateTexture(nil, "ARTWORK")
        ico:SetSize(MAT_ICON, MAT_ICON)
        ico:SetPoint("LEFT", row, "LEFT", PAD, 0)
        ico:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        -- Fall back to question mark ONLY as last resort; profession icon preferred
        local itemIcon = select(10, GetItemInfo(matId))
                      or "Interface\\Icons\\Trade_Alchemy"
        ico:SetTexture(itemIcon)
        if mat.stillNeed == 0 then ico:SetVertexColor(0.5, 0.8, 0.5) end

        -- Row tooltip - fires when hovering anywhere on the row
        row:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. matId)
            GameTooltip:Show()
        end)
        row:SetScript("OnLeave", function() GameTooltip:Hide() end)

        local rc = mat.stillNeed == 0 and C.green or (mat.have > 0 and C.yellow or C.white)

        local function RT(x, txt)
            local fs = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            fs:SetPoint("LEFT", row, "LEFT", x, 0)
            fs:SetText(txt)
        end

        -- Crafted intermediates get a tinted background to distinguish them
        if mat.isCrafted then
            rbg:SetColorTexture(0.06, 0.10, 0.06, 0.5)
        end

        RT(PAD + MAT_ICON + 6, rc .. mat.name .. C.reset)
        RT(260, C.white  .. mat.quantity .. C.reset)
        RT(300, mat.have > 0 and C.green .. mat.have .. C.reset or C.gray .. "0" .. C.reset)
        RT(345, mat.stillNeed > 0 and C.red .. mat.stillNeed .. C.reset or C.gray .. "0" .. C.reset)
        if mat.isCrafted then
            RT(385, "|cFF558855Crafted|r")
        else
            RT(385, mat.priceEach and ArtisanLogic:FormatMoney(mat.priceEach) or C.gray .. "-" .. C.reset)
        end

        yOff = yOff + ROW_H
    end

    if #mats == 0 then
        local fs = child:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", child, "TOPLEFT", PAD, -(yOff + 10))
        fs:SetText(C.green .. "You have everything you need!" .. C.reset)
        yOff = yOff + 30
    end

    child:SetHeight(math.max(yOff, 1))
end

-- ============================================================
-- INTEGRATION STATUS
-- ============================================================
function ArtisanUI:GetIntegrationStatus()
    return ArtisanLogic:IsTSMAvailable()
        and C.green .. "TSM: ON" .. C.reset
        or  C.gray  .. "TSM: --" .. C.reset
end

-- ============================================================
-- TOGGLE
-- ============================================================
function ArtisanUI:Toggle()
    if not self.mainFrame then self:CreateMainFrame() end

    if self.mainFrame:IsShown() then
        self.mainFrame:Hide()
        -- Make sure popup closes when window hides
        if self.mainFrame.dropdown._popup then
            self.mainFrame.dropdown._popup:Hide()
            self.mainFrame.dropdown._dismiss:Hide()
        end
    else
        self.mainFrame:Show()
        self:RefreshDropdown()

        local dd  = self.mainFrame.dropdown
        local key = self.currentDataKey or (ArtisanDB and ArtisanDB.lastProfession)
        if not key then
            local profs
            if debugShowAll then
                profs = ArtisanLogic:GetAllGuides()
            else
                profs = ArtisanLogic:GetPlayerProfessions()
                if #profs == 0 then profs = ArtisanLogic:GetAllGuides() end
            end
            if #profs > 0 then key = profs[1].dataKey end
        end
        if key then
            -- Find the matching item label and set it on the button
            for _, item in ipairs(dd._items or {}) do
                if item.value == key then
                    dd._value = key
                    dd._label:SetText("|cFFFFFFFF" .. item.text .. "|r")
                    break
                end
            end
            ArtisanUI:LoadProfession(key)
        end
    end
end
