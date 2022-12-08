local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local Auctioneer = addon:NewModule("GDKPdAuctioneer", "AceEvent-3.0")

local gsub = gsub
local myname = UnitName("player")

--Start an Auction
function addon.StartAuction(itemID)
    --Only start an auction if one is not active already
    if addon.db.global.activeAuction == nil then
        local now = GetServerTime() --We use Server time so that timers are only 1 second accurate
        local minBid = addon.db.global.minBidDefault
        if addon.db.global.minBids[itemID] then
            minBid = addon.db.global.minBids[itemID]
        end
        local minIncrement = addon.db.global.bidIncrementDefault
        if addon.db.global.bidIncrements[itemID] then
            minIncrement = addon.db.global.bidIncrements[itemID]
        end
        --Create auction object
        addon.db.global.activeAuction = {
            lastUpdate = now,
            itemID = itemID,
            startBid = minBid,
            minIncrement = minIncrement,
            endTime = now + addon.db.global.auctionDuration,
            currentBid = minBid,
            highBidder = nil,
        }
        --[RW] {rt2} GDKPd : Bidding is starting on [Overcharged Capacitor]!
        --Place your bids in raid chat; Bidding Starts at 20 Gold, with Minimum Increments of 5 Gold. Good luck!
        SendChatMessage(format("%s %s %s! %s; %s %d %s, %s %d %s. %s",
            addon.messagePrefix,
            L["Bidding is starting on"],
            addon.itemData[addon.db.global.activeAuction.itemID].Link,
            L["Place your bids in raid chat"],
            L["Bidding Starts at"],
            minBid,
            L["Gold"],
            L["with Minimum Increments of"],
            minIncrement,
            L["Gold"],
            L["Good luck"]
        ), "RAID_WARNING")
    end
end

--Stop an Auction
function addon.StopAuction(isCancellation)
    addon.db.global.activeAuction = nil
    if isCancellation and IsInRaid() then
        --TODO: update copy
        SendChatMessage(addon.messagePrefix .. " " .. L["Auction Cancelled"], "RAID")
    end
end

--Scan for bids in raid chat, update the active auction accordingly
local function ScanForBids(msg, name)
    if not addon.db.global.activeAuction then
        return
    end
    msg = msg:gsub(",", ""):gsub(" ", ""):gsub("%.", "")
    name = name:gsub("%-.+", "")
    local bid = tonumber(msg)
    local now = GetServerTime()
    if bid ~= nil then
        if bid >= addon.db.global.activeAuction.currentBid + addon.db.global.activeAuction.minIncrement
            or addon.db.global.activeAuction.highBidder == nil and bid >= addon.db.global.activeAuction.startBid then

            addon.db.global.activeAuction.currentBid = bid
            addon.db.global.activeAuction.highBidder = name
            --[R] {rt2} GDKPd : SomeBidder's bid of 20 Gold is accepted as the new high bid!
            SendChatMessage(format("%s %s's %s %d %s %s!",
                addon.messagePrefix,
                name,
                L["bid of"],
                bid,
                L["Gold"],
                L["is accepted as the new high bid"]
            ), "RAID")
        else
            --[R] {rt2} GDKPd : SomeDumbBidder's bid of 20 Gold for [Overcharged Capacitor] is rejected because it is too low!
            SendChatMessage(format("%s %s's %s %d %s %s!",
                addon.messagePrefix,
                name,
                L["bid of"],
                bid,
                L["Gold"],
                L["is rejected because it is too low"]
            ), "RAID")
            local minBid = addon.db.global.activeAuction.currentBid + addon.db.global.activeAuction.minIncrement
            if addon.db.global.activeAuction.highBidder == nil then
                minBid = addon.db.global.activeAuction.startBid
            end
            --[W] {rt2} GDKPd : Bid at least 25 Gold on [Overcharged Capacitor] if you are interested! You have 15 seconds remaining!
            SendChatMessage(format("%s %s %d %s %s %s %s 15 %s!",
                addon.messagePrefix,
                L["Bid at least"],
                minBid,
                L["Gold"],
                L["on"],
                addon.itemData[addon.db.global.activeAuction.itemID].Link,
                L["if you are interested"],
                L["seconds remaining"]
            ), "WHISPER", "COMMON", name)
        end
        addon.db.global.activeAuction.endTime = now + addon.db.global.auctionCountdown
    end
end

--Update an Active Auction
local function StepAuction()
    local now = GetServerTime()


    if not addon.db.global.activeAuction then
        return
    end

    --Stop the auction if the player ends up out of the raid for some reason
    if not IsInRaid() and addon.db.global.activeAuction then
        addon.StopAuction()
    end

    --Step the auction every 1 second
    if (now - addon.db.global.activeAuction.lastUpdate) > 0 then
        addon.db.global.activeAuction.lastUpdate = now

        local remainingTime = (addon.db.global.activeAuction.endTime - now)
        if remainingTime == 15 then
            --[R] {rt2} GDKPd : 15 seconds remaining on [Overcharged Capacitor]! Minimum Bid now 20 Gold!
            SendChatMessage(format("%s 15 %s %s! %s %d %s!",
                addon.messagePrefix,
                L["seconds remaining on"],
                addon.itemData[addon.db.global.activeAuction.itemID].Link,
                L["Minimum Bid now"],
                addon.db.global.activeAuction.currentBid + addon.db.global.activeAuction.minIncrement,
                L["Gold"]
            ), "RAID")
        elseif remainingTime == 10 then
            --[R] {rt2} GDKPd : 10 seconds remaining!
            SendChatMessage(format("%s 10 %s!",
                addon.messagePrefix,
                L["seconds remaining"]
            ), "RAID")
        elseif remainingTime == 5 then
            --[R] {rt2} GDKPd : 5 seconds remaining!
            SendChatMessage(format("%s 5 %s!",
                addon.messagePrefix,
                L["seconds remaining"]
            ), "RAID")
        elseif remainingTime == 0 then

            if addon.db.global.activeAuction.highBidder ~= nil then
                --Had bids
                --[R] {rt2} GDKPd : [Overcharged Capacitor] has been sold to SomeBidder for 20 Gold!
                SendChatMessage(format("%s %s %s %s %s %d %s!",
                    addon.messagePrefix,
                    addon.itemData[addon.db.global.activeAuction.itemID].Link,
                    L["has been sold to"],
                    addon.db.global.activeAuction.highBidder,
                    L["for"],
                    addon.db.global.activeAuction.currentBid,
                    L["Gold"]
                ), "RAID")
                --[R] {rt2} GDKPd : Pot Total is now 20 Gold!
                SendChatMessage(format("%s %s %d %s!",
                    addon.messagePrefix,
                    L["Pot Total is now"],
                    99999999, --TODO: PLACEHOLDER VALUE
                    L["Gold"]
                ), "RAID")
                --[W] {rt2} GDKPd : Congrats! Please pay {MasterLooter} 20 Gold when you collect [Overcharged Capacitor].
                SendChatMessage(format("%s %s! %s %s %d %s %s %s.",
                    addon.messagePrefix,
                    L["Congrats"],
                    L["Please pay"],
                    myname,
                    addon.db.global.activeAuction.currentBid,
                    L["Gold"],
                    L["when you collect"],
                    addon.itemData[addon.db.global.activeAuction.itemID].Link
                ), "WHISPER", "COMMON", addon.db.global.activeAuction.highBidder)
                --TODO: add bid to pot
            else
                --No bids
                --TODO: need copy
            end
            addon.StopAuction()
        end
    end
end

-------------------
--EVENT REGISTERS--
-------------------

function Auctioneer:OnEnable()
    self:RegisterEvent("PLAYER_ENTERING_WORLD", function()
        local UpdateFrame = CreateFrame("Frame", "GDKPdUPDATEFRAME", UIParent, "InsetFrameTemplate")
        UpdateFrame:SetWidth(0)
        UpdateFrame:SetHeight(0)
        --Frame to update auctions
        UpdateFrame:HookScript("OnUpdate", function()
            StepAuction()
        end)
        UpdateFrame:Show()

        --Clear active auction on reload
        addon.StopAuction()
    end)
    self:RegisterEvent("CHAT_MSG_RAID", function(...)
        local e, msg, name = ...
        ScanForBids(msg, name)
    end)
end

--TODO: REMOVE TESTING COMMANDS
function Auctioneer:OnInitialize()
    addon:RegisterChatCommand("astart", function()
        addon.StartAuction(45138)
    end)
    addon:RegisterChatCommand("astop", function()
        addon.StopAuction()
    end)
    addon:RegisterChatCommand("astopc", function()
        addon.StopAuction(true)
    end)
end
