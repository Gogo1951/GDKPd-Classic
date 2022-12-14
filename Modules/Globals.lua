local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')

addon.version = GetAddOnMetadata(addonName, "Version")
addon.systemColor = "ffd900"
addon.VERSION_PREFIX = "GDKPd.Version"
addon.AUCTION_PREFIX_START = "GDKPd.ASTART"
addon.AUCTION_PREFIX_BID = "GDKPd.ABID"
addon.AUCTION_PREFIX_END = "GDKPd.AEND"
addon.messagePrefix = "{rt2} GDKPd :"


--Values for supported locales
--used in general settings
addon.localeLangs = {
    ["enUS"] = "English",
}

--Generate values for Auctioneer settings
addon.timerOptions = {}
for i = 10, 30, 5 do
    addon.timerOptions[i] = format("%d %s", i, L["Seconds"])
end
