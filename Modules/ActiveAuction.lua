local addonName, addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local ActiveAuction = addon:NewModule("GDKPdActiveAuction", "AceEvent-3.0")

local myname = UnitName("player")
ActiveAuction.maxbid = 0
ActiveAuction.isAutoBidding = false
ActiveAuction.AuctionAdmin = nil

local Serializer = LibStub("AceSerializer-3.0")
local ActiveAuctionFrame = nil
local ItemLabel = nil
local PriceLabel = nil
local AutoBidEditBox = nil
local AutoBidButton = nil
local ExtendButton = nil
local CancelButton = nil
local CancelBidButton = nil
local ItemIcon = nil
local WINDOW_WIDTH = 350
local WINDOW_HEIGHT = 150
local ADMIN_BTN_WIDTH = 248

local function BuildActiveAuctionWindow()

    if ActiveAuctionFrame ~= nil then
        if not ActiveAuctionFrame:IsShown() then
            ActiveAuctionFrame:Show()
            return
        end
    end

    ActiveAuctionFrame = CreateFrame("Frame", "GDKPdActiveAuctionFrame", UIParent, "PortraitFrameTemplate")
    ActiveAuctionFrame:Hide()
    tinsert(UISpecialFrames, "GDKPdActiveAuctionFrame")

    ActiveAuctionFrame:SetWidth(WINDOW_WIDTH)
    ActiveAuctionFrame:SetHeight(WINDOW_HEIGHT)
    ActiveAuctionFrame:SetPoint("CENTER", UIParent)
    ActiveAuctionFrame:SetMovable(true)
    ActiveAuctionFrame:EnableMouse(true)
    ActiveAuctionFrame:RegisterForDrag("LeftButton", "RightButton")
    ActiveAuctionFrame:SetClampedToScreen(true)
    --ActiveAuctionFrame.title = _G["GDKPdActiveAuctionFrameTitleText"]
    --ActiveAuctionFrame.title:SetText(addonName .. " - v" .. addon.version)
    ActiveAuctionFrame:SetScript("OnMouseDown",
        function(self)
            self:StartMoving()
            self.isMoving = true
        end)
    ActiveAuctionFrame:SetScript("OnMouseUp",
        function(self)
            if self.isMoving then
                self:StopMovingOrSizing()
                self.isMoving = false
            end
        end)
    ActiveAuctionFrame:SetScript("OnShow", function() return end)
    ActiveAuctionFrame:SetFrameStrata("FULLSCREEN")

    --------
    --Icon--
    --------
    local icon = ActiveAuctionFrame:CreateTexture("$parentIcon", "OVERLAY", nil, -8)
    icon:SetSize(60, 60)
    icon:SetPoint("TOPLEFT", -5, 7)
    icon:SetTexture("Interface\\AddOns\\" .. addonName .. "\\Images\\icon128.tga")

    --Item Link
    ItemLabel = ActiveAuctionFrame:CreateFontString("$parentItemLabel", "OVERLAY", "GameFontHighlight")
    ItemLabel:SetPoint("TOP", ActiveAuctionFrame, "TOP", 0, -48)

    --Item Icon
    ItemIcon = ActiveAuctionFrame:CreateTexture("$parentIcon", "OVERLAY", nil, 0)
    ItemIcon:SetSize(32, 32)
    ItemIcon:SetPoint("RIGHT", ItemLabel, "LEFT", 0, 0)


    --Min bid + min increments
    PriceLabel = ActiveAuctionFrame:CreateFontString("$parentPriceLabel", "OVERLAY", "GameFontHighlight")
    PriceLabel:SetPoint("TOP", ItemLabel, "BOTTOM", 0, -20)

    --Auto bid box and button
    AutoBidEditBox = CreateFrame("EditBox", "$parentAutoBidEditBox", ActiveAuctionFrame, "InputBoxTemplate")
    AutoBidEditBox:SetPoint("TOPLEFT", PriceLabel, "BOTTOM", -116, 0)
    AutoBidEditBox:SetSize(128, 50)
    AutoBidEditBox:SetAutoFocus(false)
    AutoBidEditBox:SetText(tostring(ActiveAuction.maxbid))
    AutoBidEditBox:SetScript("OnTextChanged", function()
        AutoBidEditBox:SetText(AutoBidEditBox:GetText():gsub("%D+", ""))
    end)

    AutoBidButton = CreateFrame("Button", "$parentAutoBidButton", ActiveAuctionFrame, "UIPanelButtonTemplate")
    AutoBidButton:SetPoint("TOPRIGHT", PriceLabel, "BOTTOM", 116, -14)
    AutoBidButton:SetWidth(80)
    AutoBidButton:SetText(L["Auto Bid"])
    AutoBidButton:SetScript("OnClick", function()
        local num = tonumber(AutoBidEditBox:GetText())
        if num then
            ActiveAuction.maxbid = num
        end
        ActiveAuction.isAutoBidding = true
        if ActiveAuction.currentHighBidder ~= myname then --Dont outbid ourselves
            if ActiveAuction.maxbid > ActiveAuction.currentMinBid then
                SendChatMessage(tostring(ActiveAuction.currentMinBid), "RAID")
            end
        end
    end)

    ------------------
    --ADMIN CONTROLS--
    ------------------
    ExtendButton = CreateFrame("Button", "$parentExtendButton", ActiveAuctionFrame, "UIPanelButtonTemplate")
    ExtendButton:SetPoint("TOPRIGHT", AutoBidButton, "BOTTOMRIGHT", 0, -16)
    ExtendButton:SetWidth(ADMIN_BTN_WIDTH)
    ExtendButton:SetText(L["Admin : Extend Auction 15 Seconds"])
    ExtendButton:SetScript("OnClick", function()
        addon.db.activeAuction.endTime = addon.db.activeAuction.endTime + 15
    end)

    CancelBidButton = CreateFrame("Button", "$parentCancelBidButton", ActiveAuctionFrame, "UIPanelButtonTemplate")
    CancelBidButton:SetPoint("TOPRIGHT", ExtendButton, "BOTTOMRIGHT", 0, -16)
    CancelBidButton:SetWidth(ADMIN_BTN_WIDTH)
    CancelBidButton:SetText(L["Admin : Cancel Last Bid"])
    CancelBidButton:SetScript("OnClick", function()
        return
    end)

    CancelButton = CreateFrame("Button", "$parentCancelButton", ActiveAuctionFrame, "UIPanelButtonTemplate")
    CancelButton:SetPoint("TOPRIGHT", CancelBidButton, "BOTTOMRIGHT", 0, -16)
    CancelButton:SetWidth(ADMIN_BTN_WIDTH)
    CancelButton:SetText(L["Admin : Cancel Auction"])
    CancelButton:SetScript("OnClick", function()
        addon.StopAuction(true, true)
    end)

    ActiveAuctionFrame:SetScale(addon.db.UIScale)
    ActiveAuctionFrame:Hide()
end

-------------------
--EVENT REGISTERS--
-------------------

function ActiveAuction:OnEnable()

    self:RegisterEvent("CHAT_MSG_ADDON", function(...)
        local e, prefix, msg, _, _, author = ...
        if prefix == addon.AUCTION_PREFIX_START then
            ActiveAuction.maxbid = 0
            ActiveAuction.isAutoBidding = false
            ActiveAuction.AuctionAdmin = author

            --Resize the window to include admin controls if the player is the one starting the auction
            --Show/Hide admin controls accordingly
            if myname == author then
                ActiveAuctionFrame:SetHeight(WINDOW_HEIGHT + 100)
                ExtendButton:Show()
                CancelBidButton:Show()
                CancelButton:Show()
            else
                ActiveAuctionFrame:SetHeight(WINDOW_HEIGHT)
                ExtendButton:Hide()
                CancelBidButton:Hide()
                CancelButton:Hide()
            end
            local success, auctionInfo = Serializer:Deserialize(msg)
            ItemLabel:SetText(addon.itemData[auctionInfo.itemID].Link)
            --"Min Bid : 50G with 20G Increments"
            PriceLabel:SetText(format("%s : %sG %s %sG %s",
                L["Min Bid"],
                addon.PrintBigNumber(auctionInfo.startBid),
                L["with"],
                addon.PrintBigNumber(auctionInfo.minIncrement),
                L["Increments"]
            ))
            ActiveAuction.minIncrement = auctionInfo.minIncrement
            ItemIcon:SetTexture(addon.itemData[auctionInfo.itemID].Texture)
            ActiveAuctionFrame:Show()
        elseif prefix == addon.AUCTION_PREFIX_END then
            if author == ActiveAuction.AuctionAdmin then
                ActiveAuction.maxbid = 0
                ActiveAuction.isAutoBidding = false
                ActiveAuction.minIncrement = 0
                ActiveAuctionFrame:Hide()
            end
        elseif prefix == addon.AUCTION_PREFIX_BID then
            if author == ActiveAuction.AuctionAdmin then
                local success, auctionInfo = Serializer:Deserialize(msg)
                ActiveAuction.currentMinBid = tonumber(auctionInfo.newMinBid)
                ActiveAuction.currentHighBidder = auctionInfo.newHighBidder
                PriceLabel:SetText(format("%s : %sG %s %sG %s",
                    L["Min Bid"],
                    addon.PrintBigNumber(ActiveAuction.currentMinBid),
                    L["with"],
                    addon.PrintBigNumber(ActiveAuction.minIncrement),
                    L["Increments"]
                ))
                if ActiveAuction.isAutoBidding and ActiveAuction.maxbid >= 0 then
                    if ActiveAuction.currentHighBidder ~= myname then --Dont outbid ourselves
                        if ActiveAuction.maxbid > ActiveAuction.currentMinBid then
                            C_Timer.After(0.5, function()
                                SendChatMessage(tostring(ActiveAuction.currentMinBid), "RAID")
                            end)
                        end
                    end
                end
            end
        end
    end)

end

function ActiveAuction:OnInitialize()
    BuildActiveAuctionWindow()
    --addon:RegisterChatCommand("showauc", function()
    --    addon.StartAuction(45138)
    --end)
end
