local addonName, GDKPd             = ...
local locale                       = GetLocale()
local addon                        = LibStub("AceAddon-3.0"):NewAddon(GDKPd, addonName, "AceEvent-3.0", "AceConsole-3.0"
	, "AceTimer-3.0")
local L                            = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local localizedClass, englishClass = UnitClass("player")
local myserver                     = GetRealmName()
local myname                       = UnitName("player")
local mylevel                      = UnitLevel("player")

addon.GDKPdFrame = nil
local GDKPdFrame = addon.GDKPdFrame
local gsub = gsub
local time = time


--UI Variables
local WINDOW_WIDTH  = 960
local WINDOW_HEIGHT = 640

---------------------
--BUILD MAIN WINDOW--
---------------------
function addon.BuildGDKPdWindow()

	if GDKPdFrame ~= nil then
		if GDKPdFrame:IsShown() then
			GDKPdFrame:Hide()
		else
			GDKPdFrame:Show()
		end
		return
	end

	GDKPdFrame = CreateFrame("Frame", "GDKPdFrame", UIParent, "PortraitFrameTemplate")
	GDKPdFrame:Hide()
	tinsert(UISpecialFrames, "GDKPdFrame")

	GDKPdFrame:SetWidth(WINDOW_WIDTH)
	GDKPdFrame:SetHeight(WINDOW_HEIGHT)
	GDKPdFrame:SetPoint("CENTER", UIParent)
	GDKPdFrame:SetMovable(true)
	GDKPdFrame:EnableMouse(true)
	GDKPdFrame:RegisterForDrag("LeftButton", "RightButton")
	GDKPdFrame:SetClampedToScreen(true)
	GDKPdFrame.title = _G["GDKPdFrameTitleText"]
	GDKPdFrame.title:SetText(addonName .. " - v" .. addon.version)
	GDKPdFrame:SetScript("OnMouseDown",
		function(self)
			self:StartMoving()
			self.isMoving = true
		end)
	GDKPdFrame:SetScript("OnMouseUp",
		function(self)
			if self.isMoving then
				self:StopMovingOrSizing()
				self.isMoving = false
			end
		end)
	GDKPdFrame:SetScript("OnShow", function() return end)
	GDKPdFrame:SetFrameStrata("DIALOG")

	--------
	--Icon--
	--------
	local icon = GDKPdFrame:CreateTexture("$parentIcon", "OVERLAY", nil, -8)
	icon:SetSize(60, 60)
	icon:SetPoint("TOPLEFT", -5, 7)
	icon:SetTexture("Interface\\AddOns\\" .. addonName .. "\\Images\\icon128.tga")



	GDKPdFrame:SetScale(addon.db.UIScale)
	GDKPdFrame:Show()
end

-------------------
--SETTINGS WINDOW--
-------------------
function addon.RefreshConfig()
	addon.options.args.generalsettings.args["ggg"] = {
		type = "description",
		name = "|cff" .. addon.systemColor .. L["General Settings"],
		order = 0,
		fontSize = "large"
	}
	InterfaceOptionsFrame_Show()
	InterfaceOptionsFrame_OpenToCategory(addonName)
	-- need to call it a second time as there is a bug where the first time it won't switch !BlizzBugsSuck has a fix
	InterfaceOptionsFrame_OpenToCategory(addonName)
end

function addon:OpenConfig()
	GDKPdFrame:Hide()
	InterfaceOptionsFrame_OpenToCategory(addonName)
	-- need to call it a second time as there is a bug where the first time it won't switch !BlizzBugsSuck has a fix
	InterfaceOptionsFrame_OpenToCategory(addonName)
end

function addon.SetupConfig()
	addon.options = {
		name = "|TInterface\\AddOns\\" ..
			addonName .. "\\Images\\icon64:16:16:0:4|t  " .. addonName .. " - v" .. tostring(addon.version),
		desc = "",
		descStyle = "inline",
		handler = addon,
		type = 'group',
		args = {
			spacerdesc0 = { type = "description", name = " ", width = "full", order = 0 },
			generalsettings = {
				name = L["General Settings"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 10,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["General Settings"],
						order = 0,
						fontSize = "large"
					},
					spacerdesc0 = { type = "description", name = " ", width = "full", order = 10 },
					header1 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Mini-Map Icon"],
						order = 20,
						fontSize = "medium"
					},
					toggle1 = {
						type = "toggle",
						name = L["Enable Mini-Map Icon"],
						order = 30,
						width = "full",
						get = function(info) return addon.db.showMinimap end,
						set = function(info, val)
							addon.db.showMinimap = val
							if val == true then
								addon.icon:Show("GDKPdLDB")
							else
								addon.icon:Hide("GDKPdLDB")
							end
						end,
					},
					spacerdesc1 = { type = "description", name = " ", width = "full", order = 40 },
					header2 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["GDKPd Info Panel"],
						order = 50,
						fontSize = "medium"
					},
					toggle2 = {
						type = "toggle",
						name = L["Enable GDKPd Info Panel when Master Looter"],
						order = 60,
						width = "full",
						get = function(info) return addon.db.showInfoPanel end,
						set = function(info, val) addon.db.showInfoPanel = val end,
					},
					spacerdesc2 = { type = "description", name = " ", width = "full", order = 70 },
					header3 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["GDKPd Locale"],
						order = 80,
						fontSize = "medium"
					},
					dropdown3 = {
						type = "select",
						style = "dropdown",
						name = "",
						order = 90,
						width = "1",
						values = addon.localeLangs,
						set = function(info, val) addon.db.locale = val end,
						get = function(info) return addon.db.locale end,
					},
					spacerdesc3 = { type = "description", name = " ", width = "full", order = 100 },
					header4 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Raid Rules"],
						order = 110,
						fontSize = "medium"
					},
					editbox4 = {
						type = "input",
						name = "",
						order = 120,
						width = 2,
						multiline = true,
						get = function(info) return addon.db.raidRules end,
						set = function(info, val) addon.db.raidRules = strsub(val, 1, 255) end,
					},
					desc4 = {
						type = "description",
						name = format("%s\n\n%s",
							L["Save your raid rules here so you can easily re-post them."],
							L["Keep it short! Youre limited to 255 Characters."]),
						width = "full",
						order = 130,
						fontSize = "medium", --can be small, medium, large
					},
				},
			},
			lootlogging = {
				name = L["Loot Logging"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 20,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Loot Logging"],
						order = 0,
						fontSize = "large"
					},
					spacerdesc0 = { type = "description", name = " ", width = "full", order = 10 },
					header1 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Loot Quality Threshold"],
						order = 20,
						fontSize = "medium"
					},
					dropdown1 = {
						type = "select",
						style = "dropdown",
						name = "",
						order = 30,
						width = 1,
						--Qualities:
						-- 4 | Epic
						-- 3 | Rare
						-- 2 | Uncommon
						-- 1 | Common
						-- 0 | Poor
						values = {
							[4] = ITEM_QUALITY_COLORS[4].hex .. L["Epic"],
							[3] = ITEM_QUALITY_COLORS[3].hex .. L["Rare"],
							[2] = ITEM_QUALITY_COLORS[2].hex .. L["Uncommon"],
							[1] = ITEM_QUALITY_COLORS[1].hex .. L["Common"],
							[0] = ITEM_QUALITY_COLORS[0].hex .. L["Poor"],
						},
						set = function(info, val) addon.db.lootLogThreshold = val end,
						get = function(info) return addon.db.lootLogThreshold end,
					},
					spacerdesc1 = { type = "description", name = " ", width = "full", order = 40 },
					header2 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Loot History"],
						order = 50,
						fontSize = "medium"
					},
					toggle2 = {
						type = "toggle",
						name = L["Save Loot History Between Sessions"],
						order = 60,
						width = "full",
						get = function(info) return addon.db.saveLootHistory end,
						set = function(info, val) addon.db.saveLootHistory = val end,
					},
				},
			},
			auctioneer = {
				name = L["Auctioneer"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 30,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Auctioneer"],
						order = 0,
						fontSize = "large"
					},
					spacerdesc0 = { type = "description", name = " ", width = "full", order = 10 },
					header1 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Default Auction Duration"],
						order = 20,
						fontSize = "medium"
					},
					dropdown1 = {
						type = "select",
						style = "dropdown",
						name = "",
						order = 30,
						width = 1.6,
						values = addon.timerOptions,
						set = function(info, val) addon.db.auctionDuration = val end,
						get = function(info) return addon.db.auctionDuration end,
					},
					spacerdesc1 = { type = "description", name = " ", width = "full", order = 40 },
					header2 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["After a Bid, Set Auction Countdown"],
						order = 50,
						fontSize = "medium"
					},
					dropdown2 = {
						type = "select",
						style = "dropdown",
						name = "",
						order = 60,
						width = 1.6,
						values = addon.timerOptions,
						set = function(info, val) addon.db.auctionCountdown = val end,
						get = function(info) return addon.db.auctionCountdown end,
					},
					spacerdesc2 = { type = "description", name = " ", width = "full", order = 70 },
					header3 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Delay Between Auctions"],
						order = 80,
						fontSize = "medium",
						hidden = true,
						disabled = true,
					},
					dropdown3 = {
						type = "select",
						style = "dropdown",
						name = "",
						order = 90,
						width = 1.6,
						values = addon.timerOptions,
						set = function(info, val) addon.db.auctionDelay = val end,
						get = function(info) return addon.db.auctionDelay end,
						hidden = true,
						disabled = true,
					},
				},
			},
			defaultitemprices = {
				name = L["Default Item Prices"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 40,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Default Item Prices"],
						order = 0,
						fontSize = "large"
					},
					toggle2 = {
						type = "toggle",
						name = L["Save Loot History Between Sessions"],
						order = 60,
						width = "full",
						hidden = true,
						get = function(info) addon.options.args.generalsettings.hidden = true end,
						set = function(info, val) return end,
					},

				},
			},
			tradeannounce = {
				name = L["Trade Announce"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 1000,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Trade Announce"],
						order = 0,
						fontSize = "large"
					},
					spacerdesc0 = { type = "description", name = " ", width = "full", order = 10 },
					header1 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Trade Announce"],
						order = 20,
						fontSize = "medium"
					},
					dropdown1 = {
						type = "select",
						style = "dropdown",
						name = "",
						order = 30,
						width = 1.6,
						values = {
							[0] = L["Disable Trade Announce"],
							[1] = L["Enable Trade Announce when Master Looter"],
							[2] = L["Enable Trade Announce"],
						},
						set = function(info, val) addon.db.tradeAnnounce = val end,
						get = function(info) return addon.db.tradeAnnounce end,
					},
					spacerdesc1 = { type = "description", name = " ", width = "full", order = 40 },
					desc4 = {
						type = "description",
						name = L[
							"Note : Even when Trade Announce is Enabled, you can mute specific trades by unchecking the box in the trade window."
							],
						width = 1.8,
						order = 50,
						fontSize = "medium", --can be small, medium, large
					},
				},
			},
			lootvaccuum = {
				name = L["Loot Vaccuum"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 1010,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Loot Vaccuum"],
						order = 0,
						fontSize = "large"
					},
					spacerdesc0 = { type = "description", name = " ", width = "full", order = 10 },
				},
			},
			profiles = {
				name = L["Profiles"],
				desc = "",
				type = "group",
				width = "double",
				inline = false,
				order = 1020,
				hidden = true,
				disabled = true,
				args = {
					header0 = {
						type = "description",
						name = "|cff" .. addon.systemColor .. L["Profiles"],
						order = 0,
						fontSize = "large"
					},
					spacerdesc0 = { type = "description", name = " ", width = "full", order = 10 },
				},
			},

		},
	}

	addon.GenerateBidPriceOptions()

	if not addon.addedToBlizz then
		LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, addon.options)
		addon.AceConfigDialog = LibStub("AceConfigDialog-3.0")
		addon.optionsFrame = addon.AceConfigDialog:AddToBlizOptions(addonName, addonName)
	end
	addon.addedToBlizz = true

end

-------------------
--COMMAND HANDLER--
-------------------
function addon.HandleSlashCommand(msg, editbox)
	if msg == "debug" then
		addon.debugMenus = not addon.debugMenus
		print("GDKPd DEBUG MODE: " .. tostring(addon.debugMenus))
	elseif msg == "config" then
		addon.OpenConfig()
	elseif msg == "refreshconfig" then
		addon.RefreshConfig()
	elseif msg == "" then
		addon.BuildGDKPdWindow()
	end
end

function addon:OnInitialize()
	local defaults = {
		char = {
		},
		global = {
			highestSeenVersion = "0.0.0",
			UIScale = 1.0,
			configVer = nil,
			lastShowedInfoPopup = nil,
			showMinimap = true,
			showInfoPanel = true,
			locale = locale,
			raidRules = nil,
			tradeAnnounce = 0,
			auctionDuration = 20,
			auctionCountdown = 15,
			auctionDelay = 15,
			--Qualities:
			-- 4 | Epic
			-- 3 | Rare
			-- 2 | Uncommon
			-- 1 | Common
			-- 0 | Poor
			lootLogThreshold = 3,
			saveLootHistory = true,
			lootHistory = {},
			minBids = {},
			bidIncrements = {},
			minBidDefault = 500,
			bidIncrementDefault = 250,
			activeSession = nil,
			activeAuction = nil,
			historicalSessions = {},
			buyerHistory = {},
		}
	}

	addon.savedvars = LibStub("AceDB-3.0"):New("GDKPdDB", defaults)
	addon.db = addon.savedvars.global --Shorter alias, since we only have global vars
	addon.db.configVer = addon.version

	addon.debugMenus = false

	addon.BuildGDKPdWindow()


	addon:RegisterChatCommand("gdkpd", addon.HandleSlashCommand)


end

-------------------
--Event Registers--
-------------------
function addon:OnEnable()
	--Setup config
	addon:RegisterEvent("PLAYER_ENTERING_WORLD", function(...)
		addon.SetupConfig()
		local event, isInitialLogin, isReloadingUi = ...
		C_Timer.After(1, function()
			--Send version check on login
			C_ChatInfo.RegisterAddonMessagePrefix(addon.VERSION_PREFIX)
			C_ChatInfo.RegisterAddonMessagePrefix(addon.AUCTION_PREFIX_START)
			C_ChatInfo.RegisterAddonMessagePrefix(addon.AUCTION_PREFIX_END)
			C_ChatInfo.RegisterAddonMessagePrefix(addon.AUCTION_PREFIX_BID)
			C_ChatInfo.SendAddonMessage(addon.VERSION_PREFIX, "v" .. addon.version, "YELL")
		end)
	end)

	--Send version check to group/raid
	addon:RegisterEvent("GROUP_JOINED", function(...)
		local inParty = UnitInParty("player")
		local inRaid = UnitInRaid("player")

		if inRaid then
			C_ChatInfo.SendAddonMessage(addon.VERSION_PREFIX, "v" .. addon.version, "RAID")
		elseif inParty then
			C_ChatInfo.SendAddonMessage(addon.VERSION_PREFIX, "v" .. addon.version, "PARTY")
		end
	end)

	--Recieve version check
	addon:RegisterEvent("CHAT_MSG_ADDON", function(...)
		local _, prefix, msg = ...
		if prefix == addon.VERSION_PREFIX then
			local version = gsub(msg, "v", "")
			if version > addon.db.highestSeenVersion then
				addon.db.highestSeenVersion = version
			end
		end
	end)

	--Send version check to players joining group/raid
	addon:RegisterEvent("CHAT_MSG_SYSTEM", function(...)
		local event, msg = ...
		if addon.ExtractFromGlobalString(ERR_RAID_MEMBER_ADDED_S, msg) then
			C_ChatInfo.SendAddonMessage(addon.VERSION_PREFIX, "v" .. addon.version, "RAID")
		elseif addon.ExtractFromGlobalString(ERR_JOINED_GROUP_S, msg) then
			C_ChatInfo.SendAddonMessage(addon.VERSION_PREFIX, "v" .. addon.version, "PARTY")
		end
	end)


end
