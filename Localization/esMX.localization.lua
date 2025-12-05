local L = LibStub("AceLocale-3.0"):NewLocale("GDKPd", "esMX")
if not L then return end

-- L["Allow multiple simultanous auctions"] = "Allow multiple simultanous auctions"
-- L["Always show the \"Hide\" button on bid frames"] = "Always show the \"Hide\" button on bid frames"
-- L["Amount"] = "Amount"
-- L["Anchor balance window to status window"] = "Anchor balance window to status window"
-- L["Announce auction start to raid warning"] = "Announce auction start to raid warning"
-- L["Announce & auto-auction"] = "Announce & auto-auction"
-- L["Announce bids to raid warning"] = "Announce bids to raid warning"
-- L["Announce loot"] = "Announce loot"
-- L["Announce the current pot amount after each auction"] = "Announce the current pot amount after each auction"
-- L["Any money subtracted from raid members is added to the pot and vice versa"] = "Any money subtracted from raid members is added to the pot and vice versa"
-- L["Appearance options"] = "Appearance options"
-- L["Are you sure you want to mail %s gold to player %s?"] = "Are you sure you want to mail %s gold to player %s?"
-- L["Auction bid timeout refresh"] = "Auction bid timeout refresh"
-- L["Auction history"] = "Auction history"
-- L["Auction note: %s"] = "Auction note: %s"
-- L["Auction timeout"] = "Auction timeout"
-- L["Auto-award loot to winner"] = "Auto-award loot to winner"
-- L["Auto bid"] = "Auto bid"
-- L["Award loot to Master Looter when auto-auctioning"] = "Award loot to Master Looter when auto-auctioning"
-- L["Balance"] = "Balance"
-- L["Behaviour options"] = "Behaviour options"
-- L["Bid"] = "Bid"
-- L["Bid button re-enable delay"] = "Bid button re-enable delay"
-- L["Broadcast rules"] = "Broadcast rules"
-- L["Cancel auction"] = "Cancel auction"
-- L["Cannot start auction without Master Looter privileges."] = "Cannot start auction without Master Looter privileges."
-- L[" |cffaa0000(Distribute: %dg)|r"] = " |cffaa0000(Distribute: %dg)|r"
-- L["Control panel scale"] = "Control panel scale"
-- L["Countdown timer announce interval"] = "Countdown timer announce interval"
-- L["Current bid: "] = "Current bid: "
-- L["Distribute"] = "Distribute"
-- L["Do not announce"] = "Do not announce"
-- L["Do you want to save your pot or reset without saving? You can also add a note to the pot."] = "Do you want to save your pot or reset without saving? You can also add a note to the pot."
--[==[ L[ [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ] = [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ]==]
-- L["Enable"] = "Enable"
-- L["Enter the amount you want to add to player %s:"] = "Enter the amount you want to add to player %s:"
-- L["Enter the amount you want to add to the pot:"] = "Enter the amount you want to add to the pot:"
-- L["Enter the amount you want to subtract from player %s:"] = "Enter the amount you want to subtract from player %s:"
-- L["Enter the amount you want to subtract from the pot:"] = "Enter the amount you want to subtract from the pot:"
-- L["Enter the maximum amount of money you want to bid on %s:"] = "Enter the maximum amount of money you want to bid on %s:"
-- L["Export"] = "Export"
-- L["Frame alpha"] = "Frame alpha"
-- L["Frame scale"] = "Frame scale"
-- L["GDKPd auction history"] = "GDKPd auction history"
-- L["GDKPd auction history for %s"] = "GDKPd auction history for %s"
--[==[ L[ [=[GDKPd: Drag to move
/gdkpd and check "Lock" to hide]=] ] = [=[GDKPd: Drag to move
/gdkpd and check "Lock" to hide]=] ]==]
-- L["Loot dropped: "] = "Loot dropped: "
-- L["GDKPd: No detailed data available"] = "GDKPd: No detailed data available"
-- L["This raid uses GDKPd to faciliate its GDKP bidding process. While you can bid on items without having GDKPd installed, installing it provides you with a GUI bidding panel, auto bidding functions, auction timers, chat filtering and more!"] = "This raid uses GDKPd to faciliate its GDKP bidding process. While you can bid on items without having GDKPd installed, installing it provides you with a GUI bidding panel, auto bidding functions, auction timers, chat filtering and more!"
-- L["GDKPd version %s. Packaged %s."] = "GDKPd version %s. Packaged %s."
-- L["Your version of GDKPd is outdated and no longer compatible with the raid leader's in one or more functionalities. In order to ensure smooth performance, please update GDKPd."] = "Your version of GDKPd is outdated and no longer compatible with the raid leader's in one or more functionalities. In order to ensure smooth performance, please update GDKPd."
-- L["Your version of GDKPd is slightly outdated compared to the raid leader's. Full compability should be possible, however, you might want to take some time and update GDKPd."] = "Your version of GDKPd is slightly outdated compared to the raid leader's. Full compability should be possible, however, you might want to take some time and update GDKPd."
-- L["Hide"] = "Hide"
-- L["Hide 'Auction cancelled' announcements"] = "Hide 'Auction cancelled' announcements"
-- L["Hide 'Auction cancelled' announcements from raid warning"] = "Hide 'Auction cancelled' announcements from raid warning"
-- L["Hide 'Auction finished' announcements"] = "Hide 'Auction finished' announcements"
-- L["Hide 'Bidding starts' announcements"] = "Hide 'Bidding starts' announcements"
-- L["Hide 'Bidding starts' announcements from raid warning"] = "Hide 'Bidding starts' announcements from raid warning"
-- L["Hide chat messages"] = "Hide chat messages"
-- L["Hide 'Current pot:' announcements"] = "Hide 'Current pot:' announcements"
-- L["Hide frames in combat"] = "Hide frames in combat"
-- L["Hide history window"] = "Hide history window"
-- L["Hide 'New highest bidder' announcements"] = "Hide 'New highest bidder' announcements"
-- L["Hide players' bid messages"] = "Hide players' bid messages"
-- L["Hide status and balance windows"] = "Hide status and balance windows"
-- L["Hide 'Time remaining' announcements"] = "Hide 'Time remaining' announcements"
-- L["Hide version check window"] = "Hide version check window"
-- L["Highest bidder: %s"] = "Highest bidder: %s"
-- L["History"] = "History"
-- L["iLvL ranges"] = "iLvL ranges"
-- L["Item level settings"] = "Item level settings"
-- L["Item settings"] = "Item settings"
-- L["Itm"] = "Itm"
-- L["Link raid member balance to pot"] = "Link raid member balance to pot"
-- L["Lock"] = "Lock"
-- L["Mail"] = "Mail"
-- L["Mail money"] = "Mail money"
-- L["Manual adjustment"] = "Manual adjustment"
-- L["Minimum bid: "] = "Minimum bid: "
-- L["Minimum increment"] = "Minimum increment"
-- L["Minimum quality"] = "Minimum quality"
-- L["Min increment"] = "Min increment"
-- L["Notification options"] = "Notification options"
-- L["Notify outdated versions"] = "Notify outdated versions"
-- L["Notify outdated versions that are compatible with your version"] = "Notify outdated versions that are compatible with your version"
-- L["Notify outdated versions that aren't compatible with your version"] = "Notify outdated versions that aren't compatible with your version"
-- L["Notify raid members that do not have GDKPd installed"] = "Notify raid members that do not have GDKPd installed"
-- L["Per-item settings"] = "Per-item settings"
-- L["Player balance"] = "Player balance"
-- L["Please enter the itemID of an item you want to drop here:"] = "Please enter the itemID of an item you want to drop here:"
-- L["Pot export"] = "Pot export"
-- L["Pot size: %d|cffffd100g|r"] = "Pot size: %d|cffffd100g|r"
-- L["Prevent dragging and hide anchor"] = "Prevent dragging and hide anchor"
-- L["Request version data"] = "Request version data"
-- L["Require confirmation when mailing pot shares"] = "Require confirmation when mailing pot shares"
-- L["Restart auction"] = "Restart auction"
-- L["Revert highest bid"] = "Revert highest bid"
-- L["Rules"] = "Rules"
-- L["Second bidder share"] = "Second bidder share"
-- L["Show"] = "Show"
-- L["Show addon frames"] = "Show addon frames"
-- L["Show auction duration spiral"] = "Show auction duration spiral"
-- L["Show countdown text on auction duration spiral"] = "Show countdown text on auction duration spiral"
-- L["Starting bid"] = "Starting bid"
-- L["Stop bid"] = "Stop bid"
-- L["The amount of seconds between each announcement of the remaining time"] = "The amount of seconds between each announcement of the remaining time"
-- L["The amount of seconds that have to pass after a bid before the auction is closed"] = "The amount of seconds that have to pass after a bid before the auction is closed"
-- L["The amount of seconds that have to pass before the auction is closed without bids recieved"] = "The amount of seconds that have to pass before the auction is closed without bids recieved"
-- L["Third bidder share"] = "Third bidder share"
-- L["This player does not have GDKPd running or his version of GDKPd does not yet support version checks."] = "This player does not have GDKPd running or his version of GDKPd does not yet support version checks."
-- L["This player has the same version of GDKPd as you do. Full compability is ensured."] = "This player has the same version of GDKPd as you do. Full compability is ensured."
-- L["This player's version of GDKPd is more advanced than yours. Please consult your Curse Client for updates or manually check the curse.com page."] = "This player's version of GDKPd is more advanced than yours. Please consult your Curse Client for updates or manually check the curse.com page."
-- L["This player's version of GDKPd is outdated and one or more functionalities are not compatible:"] = "This player's version of GDKPd is outdated and one or more functionalities are not compatible:"
-- L["This player's version of GDKPd is outdated. However, their version should be fully compatible with yours."] = "This player's version of GDKPd is outdated. However, their version should be fully compatible with yours."
-- L["This version of GDKPd was never functional due to internal errors."] = "This version of GDKPd was never functional due to internal errors."
-- L["This version's player balance window will be unable to recognize distributions by you."] = "This version's player balance window will be unable to recognize distributions by you."
-- L["This version will be unable to recognize auctions cancelled by you."] = "This version will be unable to recognize auctions cancelled by you."
-- L["This version will be unable to recognize auctions started by you."] = "This version will be unable to recognize auctions started by you."
-- L["This version will be unable to recognize version check requests by you. Version check requests sent by this version of GDKPd will not be answered."] = "This version will be unable to recognize version check requests by you. Version check requests sent by this version of GDKPd will not be answered."
--[==[ L[ [=[This will completely wipe your auction history and is IRREVERSIBLE.
Are you completely SURE you want to do this?]=] ] = [=[This will completely wipe your auction history and is IRREVERSIBLE.
Are you completely SURE you want to do this?]=] ]==]
-- L["Toggle zero balance"] = "Toggle zero balance"
-- L["Use looting system loot threshold setting"] = "Use looting system loot threshold setting"
-- L["Use slim bidding window even while Master Looter"] = "Use slim bidding window even while Master Looter"
-- L["Version notifications"] = "Version notifications"
-- L["Versions"] = "Versions"
-- L["Version status for player %s"] = "Version status for player %s"
-- L["Visibility settings"] = "Visibility settings"
--[==[ L[ [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ] = [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ]==]
-- L["Wipe history"] = "Wipe history"
--[==[ L[ [=[You have looted a monster!
Do you want GDKPd to announce loot?]=] ] = [=[You have looted a monster!
Do you want GDKPd to announce loot?]=] ]==]
--[==[ L[ [=[You have selected the current pot, size %d gold.
What do you want to do with this pot?]=] ] = [=[You have selected the current pot, size %d gold.
What do you want to do with this pot?]=] ]==]
--[==[ L[ [=[You have selected the following pot:
%s, dated %s, size %d gold.
What do you want to do with this pot?]=] ] = [=[You have selected the following pot:
%s, dated %s, size %d gold.
What do you want to do with this pot?]=] ]==]
