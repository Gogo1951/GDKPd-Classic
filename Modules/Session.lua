local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local Sessioner = addon:NewModule("GDKPdSessioner", "AceEvent-3.0")

local gsub = gsub
local myname = UnitName("player")
local time = time

------------------
--SESSION MODULE--
------------------
--This module contains methods for interacting with an active auction session

function addon.AddToPot()

end

function addon.StartSession()
    --Store the previous session in history first before clearing
    if addon.db.activeSession ~= nil then
        addon.db.historicalSessions[addon.db.activeSession.timestamp] = addon.db.activeSession
    end

    addon.db.activeSession = {
        timestamp = time(),
        masterlooter = myname,
        potTotal = 0,
        --Player balances are just [name] = number
        --Should all end at 0
        playerBalances = {},
        --Completed auctions follow the following format:
        --[timestamp] = {
        --    itemID,
        --    buyerName,
        --    price,
        --    hasBeenTraded,
        --    timestamp,
        --}
        completedAuctions = {},
        --Pending auctions follow the following format:
        --[itemGUID] = {
        --    quantity, -- usually 1, only materials will be >1
        --    tradeEndTime,
        --}
        pendingAuctions = {},
    }
end

function addon.EndSession()

end

--Use system message to check if the player has become the loot master
--and ask to start a new session or not
function CheckForSessionStart(msg)
    if strmatch(msg, ERR_NEW_LOOT_MASTER_S:gsub("%%s", myname)) then
        StaticPopupDialogs["GDKPD_SESSIONSTART"] = {
            text = format("|TInterface\\AddOns\\" ..
                addonName .. "\\Images\\icon64:16:16:0:0|t %s\n\n%s",
                addonName, L["Do you want to start a new session?"]),
            button1 = "Yes",
            button2 = "No",
            OnAccept = function()
                if IsInRaid() then
                    addon.StartSession()
                end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3, -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
        }
        StaticPopup_Show("GDKPD_SESSIONSTART")
    end
end

-------------------
--EVENT REGISTERS--
-------------------

function Sessioner:OnEnable()

    self:RegisterEvent("CHAT_MSG_SYSTEM", function(...)
        local event, msg = ...
        CheckForSessionStart(msg)
    end)
end
