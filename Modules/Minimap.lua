local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local Minimap = addon:NewModule("GDKPdMinimap", "AceEvent-3.0")

--Minimap Icon Creation
addon.LDB = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, {
    type = "data source",
    text = addonName,
    icon = "Interface\\AddOns\\" .. addonName .. "\\Images\\icon64.tga",
    OnClick = function(self, button, down)
        if IsShiftKeyDown() then
            addon.BuildStatusWindow()
        elseif button == "LeftButton" then
            addon.BuildGDKPdWindow()
        elseif button == "RightButton" then
            addon.OpenConfig()
        end
    end,
    OnTooltipShow = function(tooltip)
        local now = time()
        tooltip:AddDoubleLine(addonName, tostring(addon.version),
            1, 0.85, 0.00, 1, 0.85, 0.00)
        tooltip:AddLine(L["Automate Your GDKP Auctions, Bids, & Payouts"], 255, 255, 255, false)

        tooltip:AddLine(" ")

        tooltip:AddLine(L["Click"] ..
            " |cffffffff" ..
            L["or"] .. "|r /gdkpd |cffffffff: " .. addonName .. "|r ")
        tooltip:AddLine(L["RightClick"] .. " |cffffffff: " .. L["Open GDKPd Settings"] .. "|r ")
        tooltip:AddLine(L["Shift+Click"] .. " |cffffffff: " .. L["Toggle GDKPd Status Panel"] .. "|r ")
        --Version Check
        if addon.version < addon.db.highestSeenVersion then
            tooltip:AddLine(" ")
            tooltip:AddLine("|cff8000FF" .. L["PLEASE UPDATE YOUR ADD-ONS ASAP!"] .. "|r")
            tooltip:AddLine("|cff8000FF" .. L["GDKPd IS OUT OF DATE!"] .. "|r")
        end
    end
})


function Minimap:OnInitialize()

    addon.icon = LibStub("LibDBIcon-1.0")
    addon.icon:Register("GDKPdLDB", addon.LDB, addon.db or defaults.global)
end

function Minimap:OnEnable()
    self:RegisterEvent("PLAYER_ENTERING_WORLD", function(...)
        if addon.db.showMinimap == false then
            addon.icon:Hide("GDKPdLDB")
        end
    end)

end
