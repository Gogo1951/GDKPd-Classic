local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local Auctioneer = addon:NewModule("GDKPdAuctioneer", "AceEvent-3.0")

local gsub = gsub
local myname = UnitName("player")
local Serializer = LibStub("AceSerializer-3.0")

--Start an Auction
function addon.StartAuction(itemID)
    if not IsInRaid() then return end

    --Only start an auction if one is not active already
    if addon.db.activeAuction == nil then
        local now = GetServerTime() --We use Server time so that timers are only 1 second accurate
        local minBid = addon.db.minBidDefault
        if addon.db.minBids[itemID] then
            minBid = addon.db.minBids[itemID]
        end
        local minIncrement = addon.db.bidIncrementDefault
        if addon.db.bidIncrements[itemID] then
            minIncrement = addon.db.bidIncrements[itemID]
        end
        --Create auction object
        addon.db.activeAuction = {
            lastUpdate = now,
            itemID = itemID,
            startBid = minBid,
            minIncrement = minIncrement,
            endTime = now + addon.db.auctionDuration,
            currentBid = minBid,
            highBidder = nil,
        }
        --Addon message for the active auction window
        C_ChatInfo.SendAddonMessage(addon.AUCTION_PREFIX_START, Serializer:Serialize({
            itemID = itemID,
            startBid = minBid,
            minIncrement = minIncrement
        }), "RAID")
        C_ChatInfo.SendAddonMessage(addon.AUCTION_PREFIX_BID, Serializer:Serialize({
            newMinBid = addon.db.activeAuction.currentBid + addon.db.activeAuction.minIncrement,
            newHighBidder = ""
        }), "RAID")
        --[RW] {rt2} GDKPd : Bidding is starting on [Overcharged Capacitor]!
        --Place your bids in raid chat; Bidding Starts at 20 Gold, with Minimum Increments of 5 Gold. Good luck!
        SendChatMessage(format("%s %s %s! %s; %s %s %s, %s %s %s. %s!",
            addon.messagePrefix,
            L["Bidding is starting on"],
            addon.itemData[addon.db.activeAuction.itemID].Link,
            L["Place your bids in raid chat"],
            L["Bidding Starts at"],
            addon.PrintBigNumber(minBid),
            L["Gold"],
            L["with Minimum Increments of"],
            addon.PrintBigNumber(minIncrement),
            L["Gold"],
            L["Good luck"]
        ), "RAID_WARNING")
    end
end

--Stop an Auction
function addon.StopAuction(isCancellation, sendAddonMsg)
    addon.db.activeAuction = nil
    if IsInRaid() then
        if sendAddonMsg then
            C_ChatInfo.SendAddonMessage(addon.AUCTION_PREFIX_END, "end", "RAID")
        end
        if isCancellation then
            SendChatMessage(addon.messagePrefix .. " " .. L["Auction Cancelled"], "RAID")
        end
    end
end

--Scan for bids in raid chat, update the active auction accordingly
local function ScanForBids(msg, name)

    if not addon.db.activeAuction or not IsInRaid() then return end

    msg = msg:gsub(",", ""):gsub(" ", ""):gsub("%.", "")
    name = name:gsub("%-.+", "")
    local bid = tonumber(msg)
    local now = GetServerTime()
    --Accept bids ending in "k"
    if bid == nil and addon.EndsWith(msg, "k") then
        local kremoved = msg:gsub("k", "")
        bid = tonumber(kremoved)
        if bid ~= nil then
            bid = bid * 1000
        end
    end

    --if the bid was successfully converted to a number
    if bid ~= nil then
        if bid >= addon.db.activeAuction.currentBid + addon.db.activeAuction.minIncrement
            or addon.db.activeAuction.highBidder == nil and bid >= addon.db.activeAuction.startBid then

            addon.db.activeAuction.currentBid = bid
            addon.db.activeAuction.highBidder = name
            --Addon message for the active auction window
            C_ChatInfo.SendAddonMessage(addon.AUCTION_PREFIX_BID, Serializer:Serialize({
                newMinBid = addon.db.activeAuction.currentBid + addon.db.activeAuction.minIncrement,
                newHighBidder = addon.db.activeAuction.highBidder
            }), "RAID")
            --[R] {rt2} GDKPd : SomeBidder's bid of 20 Gold is accepted as the new high bid!
            SendChatMessage(format("%s %s's %s %s %s %s!",
                addon.messagePrefix,
                name,
                L["bid of"],
                addon.PrintBigNumber(bid),
                L["Gold"],
                L["is accepted as the new high bid"]
            ), "RAID")
        else
            --[R] {rt2} GDKPd : SomeDumbBidder's bid of 20 Gold for [Overcharged Capacitor] is rejected because it is too low!
            SendChatMessage(format("%s %s's %s %s %s %s!",
                addon.messagePrefix,
                name,
                L["bid of"],
                addon.PrintBigNumber(bid),
                L["Gold"],
                L["is rejected because it is too low"]
            ), "RAID")
            local minBid = addon.db.activeAuction.currentBid + addon.db.activeAuction.minIncrement
            if addon.db.activeAuction.highBidder == nil then
                minBid = addon.db.activeAuction.startBid
            end
            --[W] {rt2} GDKPd : Bid at least 25 Gold on [Overcharged Capacitor] if you are interested! You have 15 seconds remaining!
            SendChatMessage(format("%s %s %s %s %s %s %s 15 %s!",
                addon.messagePrefix,
                L["Bid at least"],
                addon.PrintBigNumber(minBid),
                L["Gold"],
                L["on"],
                addon.itemData[addon.db.activeAuction.itemID].Link,
                L["if you are interested"],
                L["seconds remaining"]
            ), "WHISPER", "COMMON", name)
        end
        addon.db.activeAuction.endTime = now + addon.db.auctionCountdown
    end
end

--Update an Active Auction
local function StepAuction()
    local now = GetServerTime()


    if not addon.db.activeAuction then
        return
    end

    --Stop the auction if the player ends up out of the raid for some reason
    if not IsInRaid() and addon.db.activeAuction then
        addon.StopAuction(false, true)
    end

    --Step the auction every 1 second
    if (now - addon.db.activeAuction.lastUpdate) > 0 then
        addon.db.activeAuction.lastUpdate = now

        local remainingTime = (addon.db.activeAuction.endTime - now)
        if remainingTime == 15 then
            --[R] {rt2} GDKPd : 15 seconds remaining on [Overcharged Capacitor]! Minimum Bid now 20 Gold!
            SendChatMessage(format("%s 15 %s %s! %s %s %s!",
                addon.messagePrefix,
                L["seconds remaining on"],
                addon.itemData[addon.db.activeAuction.itemID].Link,
                L["Minimum Bid now"],
                addon.PrintBigNumber(addon.db.activeAuction.currentBid + addon.db.activeAuction.minIncrement),
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

            if addon.db.activeAuction.highBidder ~= nil then
                --Had bids

                --Add to pot total
                addon.db.activeSession.potTotal = addon.db.activeSession.potTotal + addon.db.activeAuction.currentBid

                --Log in completedAuctions table
                addon.db.activeSession.completedAuctions[time()] = {
                    itemID = addon.db.activeAuction.itemID,
                    buyerName = addon.db.activeAuction.highBidder,
                    price = addon.db.activeAuction.currentBid,
                    hasBeenTraded = false,
                    timestamp = time(),
                }

                --add to player balance and buyer history
                --balances owed are negative
                if addon.db.activeSession.playerBalances[addon.db.activeAuction.highBidder] == nil then
                    addon.db.activeSession.playerBalances[addon.db.activeAuction.highBidder] = -1 *
                        addon.db.activeAuction.currentBid
                else
                    addon.db.activeSession.playerBalances[addon.db.activeAuction.highBidder] = addon.db.activeSession.playerBalances
                        [addon.db.activeAuction.highBidder] - addon.db.activeAuction.currentBid
                end

                if addon.db.buyerHistory[addon.db.activeAuction.highBidder] == nil then
                    addon.db.buyerHistory[addon.db.activeAuction.highBidder] = addon.db.activeAuction.currentBid
                else
                    addon.db.buyerHistory[addon.db.activeAuction.highBidder] = addon.db.buyerHistory[
                        addon.db.activeAuction.highBidder] + addon.db.activeAuction.currentBid
                end

                --[R] {rt2} GDKPd : [Overcharged Capacitor] has been sold to SomeBidder for 20 Gold!
                SendChatMessage(format("%s %s %s %s %s %s %s!",
                    addon.messagePrefix,
                    addon.itemData[addon.db.activeAuction.itemID].Link,
                    L["has been sold to"],
                    addon.db.activeAuction.highBidder,
                    L["for"],
                    addon.PrintBigNumber(addon.db.activeAuction.currentBid),
                    L["Gold"]
                ), "RAID")
                --[R] {rt2} GDKPd : Pot Total is now 20 Gold!
                SendChatMessage(format("%s %s %s %s!",
                    addon.messagePrefix,
                    L["Pot Total is now"],
                    addon.PrintBigNumber(addon.db.activeSession.potTotal),
                    L["Gold"]
                ), "RAID")
                --[W] {rt2} GDKPd : Congrats! Please pay {MasterLooter} 20 Gold when you collect [Overcharged Capacitor].
                SendChatMessage(format("%s %s! %s %s %s %s %s %s.",
                    addon.messagePrefix,
                    L["Congrats"],
                    L["Please pay"],
                    myname,
                    addon.PrintBigNumber(addon.db.activeAuction.currentBid),
                    L["Gold"],
                    L["when you collect"],
                    addon.itemData[addon.db.activeAuction.itemID].Link
                ), "WHISPER", "COMMON", addon.db.activeAuction.highBidder)
            else
                --No bids
                --[R] {rt2} GDKPd : Auction of [Overcharged Capacitor] has ended and recieved no bids.
                SendChatMessage(format("%s %s %s %s.",
                    addon.messagePrefix,
                    L["Auction of"],
                    addon.itemData[addon.db.activeAuction.itemID].Link,
                    L["has ended and recieved no bids"]
                ), "RAID")
            end
            addon.StopAuction(false, true)
        end
    end
end

--Required to
function HookOutgoingMsg()

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
        addon.StopAuction(false, true)
    end)
    self:RegisterEvent("CHAT_MSG_RAID", function(...)
        local e, msg, name = ...
        ScanForBids(msg, name)
    end)
    self:RegisterEvent("CHAT_MSG_RAID_LEADER", function(...)
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
        addon.StopAuction(true, true)
    end)
end
