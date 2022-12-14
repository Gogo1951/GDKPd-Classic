local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local AutoTrade = addon:NewModule("GDKPdAutoTrade", "AceEvent-3.0")

local gsub = gsub
local myname = UnitName("player")
local time = time

local isTrading = false
local tradeAmount = 0



local function UpdatePlayerBalance(err)
    if err == ERR_TRADE_COMPLETE then

    end
end

-------------------
--EVENT REGISTERS--
-------------------

function AutoTrade:OnEnable()

    self:RegisterEvent("TRADE_CLOSED", function()
        isTrading = false
    end)
    self:RegisterEvent("TRADE_SHOW", function()
        isTrading = true
    end)
    self:RegisterEvent("TRADE_MONEY_CHANGED", function()
        tradeAmount = GetTargetTradeMoney() / 10000
    end)
    self:RegisterEvent("UI_INFO_MESSAGE", function(...)
        local e, _, err = ...
        UpdatePlayerBalance(err)
    end)
end
