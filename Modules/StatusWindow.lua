local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local StatusWindow = addon:NewModule("GDKPdStatusWindow", "AceEvent-3.0")

local UpdateFrame = CreateFrame("Frame", "GDKPdUpdateStatusFrame", UIParent)
local StatusFrame = nil
local PotLabel = nil
local PendingLabel = nil
local WarningLabel = nil
local RaidRulesButton = nil
local PayRulesButton = nil
local GDKPBoardButton = nil
local GDKPOptionsButton = nil
local WINDOW_WIDTH = 350
local WINDOW_HEIGHT = 150
local BUTTON_WIDTH = 125

function addon.BuildStatusWindow()

    if StatusFrame ~= nil then
        if not StatusFrame:IsShown() then
            StatusFrame:Show()
        else
            StatusFrame:Hide()
        end
        return
    end

    StatusFrame = CreateFrame("Frame", "GDKPdStatusFrame", UIParent, "PortraitFrameTemplate")
    StatusFrame:Hide()
    tinsert(UISpecialFrames, "GDKPdStatusFrame")

    StatusFrame:SetWidth(WINDOW_WIDTH)
    StatusFrame:SetHeight(WINDOW_HEIGHT)
    StatusFrame:SetPoint("CENTER", UIParent)
    StatusFrame:SetMovable(true)
    StatusFrame:EnableMouse(true)
    StatusFrame:RegisterForDrag("LeftButton", "RightButton")
    StatusFrame:SetClampedToScreen(true)
    StatusFrame:SetScript("OnMouseDown",
        function(self)
            self:StartMoving()
            self.isMoving = true
        end)
    StatusFrame:SetScript("OnMouseUp",
        function(self)
            if self.isMoving then
                self:StopMovingOrSizing()
                self.isMoving = false
            end
        end)
    StatusFrame:SetScript("OnShow", function() return end)
    StatusFrame:SetFrameStrata("FULLSCREEN_DIALOG")

    --------
    --Icon--
    --------
    local icon = StatusFrame:CreateTexture("$parentIcon", "OVERLAY", nil, -8)
    icon:SetSize(60, 60)
    icon:SetPoint("TOPLEFT", -5, 7)
    icon:SetTexture("Interface\\AddOns\\" .. addonName .. "\\Images\\icon128.tga")

    PotLabel = StatusFrame:CreateFontString("$parentPotLabel", "OVERLAY", "GameFontHighlight")
    PotLabel:SetPoint("TOPLEFT", StatusFrame, "TOPLEFT", 64, -32)

    PendingLabel = StatusFrame:CreateFontString("$parentPendingLabel", "OVERLAY", "GameFontHighlight")
    PendingLabel:SetPoint("TOP", PotLabel, "BOTTOM", 0, -8)

    WarningLabel = StatusFrame:CreateFontString("$parentWarningLabel", "OVERLAY", "GameFontHighlight")
    WarningLabel:SetPoint("LEFT", PendingLabel, "RIGHT", 48, 0)
    WarningLabel:SetText("|cffD3455B" .. L["WARNING! ITEMS ABOUT TO EXPIRE"])

    RaidRulesButton = CreateFrame("Button", "$parentRaidRulesButton", StatusFrame, "UIPanelButtonTemplate")
    RaidRulesButton:SetPoint("LEFT", StatusFrame, "LEFT", 8, -16)
    RaidRulesButton:SetWidth(BUTTON_WIDTH)
    RaidRulesButton:SetText(L["Raid Rules"])
    RaidRulesButton:SetScript("OnClick", function()
        if addon.db.raidRules then
            SendChatMessage(addon.db.raidRules, "RAID")
        else
            addon.OpenConfig()
        end
    end)

    PayRulesButton = CreateFrame("Button", "$parentPayRulesButton", StatusFrame, "UIPanelButtonTemplate")
    PayRulesButton:SetPoint("LEFT", StatusFrame, "LEFT", 8, -48)
    PayRulesButton:SetWidth(BUTTON_WIDTH)
    PayRulesButton:SetText(L["Payment Rules"])
    PayRulesButton:SetScript("OnClick", function()

    end)

    GDKPBoardButton = CreateFrame("Button", "$parentGDKPBoardButton", StatusFrame, "UIPanelButtonTemplate")
    GDKPBoardButton:SetPoint("RIGHT", StatusFrame, "RIGHT", -8, -16)
    GDKPBoardButton:SetWidth(BUTTON_WIDTH)
    GDKPBoardButton:SetText(L["GDKPd Board"])
    GDKPBoardButton:SetScript("OnClick", function()
        addon.BuildGDKPdWindow()
    end)

    PayRulesButton = CreateFrame("Button", "$parentPayRulesButton", StatusFrame, "UIPanelButtonTemplate")
    PayRulesButton:SetPoint("RIGHT", StatusFrame, "RIGHT", -8, -48)
    PayRulesButton:SetWidth(BUTTON_WIDTH)
    PayRulesButton:SetText(L["GDKPd Options"])
    PayRulesButton:SetScript("OnClick", function()
        addon.OpenConfig()
    end)



    StatusFrame:SetScale(addon.db.UIScale)
    StatusFrame:Hide()
end

--Update labels in the status window every 1 second
local function UpdateStatusWindow()
    if addon.db.activeSession and not addon.db.activeSession.paymentStarted and addon.db.showInfoPanel then
        --StatusFrame:Show()
    else
        StatusFrame:Hide()
    end

    if addon.db.activeSession then
        local now = GetServerTime()
        if not addon.lastStatusUpdate then
            addon.lastStatusUpdate = now - 1
        end

        if (now - addon.lastStatusUpdate) > 0 then
            addon.lastStatusUpdate = now
            --TODO: Update labels
            PotLabel:SetText(format("%s : %s %s",
                L["Pot Size"],
                addon.PrintBigNumber(addon.db.activeSession.potTotal),
                L["Gold"]))
            local pendingCount = 0
            local aboutToExpire = false
            for k, v in pairs(addon.db.activeSession.pendingAuctions) do
                pendingCount = pendingCount + 1
                if (v.tradeEndTime - now) < 10 * 60 then --if an item has <10 mins remaining
                    local aboutToExpire = true
                end
            end
            PendingLabel:SetText(format("%s : %s",
                L["Pending Auctions"],
                pendingCount))
            if aboutToExpire then
                WarningLabel:Show()
            else
                WarningLabel:Hide()
            end
        end
    end
end

-------------------
--EVENT REGISTERS--
-------------------

function StatusWindow:OnEnable()
    UpdateFrame:HookScript("OnUpdate", function()
        UpdateStatusWindow()
    end)
    UpdateFrame:Show()
    self:RegisterEvent("PLAYER_ENTERING_WORLD", function()
        if addon.db.activeSession and not addon.db.activeSession.paymentStarted and addon.db.showInfoPanel then
            StatusFrame:Show()
        else
            StatusFrame:Hide()
        end
    end)
end

function StatusWindow:OnInitialize()
    addon.BuildStatusWindow()
    addon:RegisterChatCommand("showauc", function()
        StatusFrame:Show()
    end)
end
