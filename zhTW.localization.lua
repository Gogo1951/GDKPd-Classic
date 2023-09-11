local L = LibStub("AceLocale-3.0"):NewLocale("GDKPd", "zhTW")
if not L then return end

L["Allow multiple simultanous auctions"] = "允許同時拍賣多項物品"
L["Always show the \"Hide\" button on bid frames"] = "在競拍窗口上總是顯示'隱藏'按鈕" -- Needs review
L["Amount"] = "金額" -- Needs review
L["Anchor balance window to status window"] = "將餘額窗口定位錨點到狀態窗口" -- Needs review
L["Announce auction start to raid warning"] = "拍賣開始時在團隊警告頻道通告"
L["Announce & auto-auction"] = "通告與自動拍賣"
L["Announce bids to raid warning"] = "將競拍通告到團隊警告" -- Needs review
L["Announce loot"] = "發布掉落物品"
L["Announce the current pot amount after each auction"] = "在每次拍賣完成之後通告當前拍賣收入"
L["Any money subtracted from raid members is added to the pot and vice versa"] = "將任何從團員扣去的金錢計入總額，反之亦如此。" -- Needs review
L["Appearance options"] = "外觀選項" -- Needs review
L["Are you sure you want to mail %s gold to player %s?"] = [=[你確定要郵寄 %s 金幣 給 玩家 %s 嗎？
]=] -- Needs review
L["Auction bid timeout refresh"] = [=[拍賣出價超時刷新
每次有新出價時重置拍賣時間]=]
L["Auction history"] = "拍賣記錄"
L["Auction note: %s"] = "拍賣注釋: %s"
L["Auction timeout"] = "拍賣超時"
L["Auto-award loot to winner"] = "自動分配物品給拍賣獲勝者"
L["Auto bid"] = "自動出價"
L["Award loot to Master Looter when auto-auctioning"] = "在自動拍賣時將掉落物品分配給分配者"
L["Balance"] = "餘額" -- Needs review
L["Behaviour options"] = "規則選項" -- Needs review
L["Bid"] = "出價"
L["Bid button re-enable delay"] = "出價按鈕重新可用的延遲"
L["Broadcast rules"] = "規則通告" -- Needs review
L["Cancel auction"] = "取消拍賣" -- Needs review
L["Cannot start auction without Master Looter privileges."] = "沒有分配物品權限是無法開始拍賣"
L[" |cffaa0000(Distribute: %dg)|r"] = " |cffaa0000(分配: %dg)|r"
L["Control panel scale"] = "控制面板縮放"
L["Countdown timer announce interval"] = "倒數計時通告的間隔" -- Needs review
L["Current bid: "] = "當前報價"
L["Distribute"] = "分配"
L["Do not announce"] = "禁止通告"
L["Do you want to save your pot or reset without saving? You can also add a note to the pot."] = "你想保存拍賣收入還是重置不保存?你也可以在拍賣收入中添加注釋."
L[ [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ] = [=[由於補丁4.2對於插件消息系統實現的改變，GDKPd已經不再使用舊的版本檢查方式進行通信。
所以此版本的GDKPd將只會發送和接受來自1.2.0及其以上版本的版本檢查消息。
同事GDKPd的其他所有功能應當仍然是與以前版本兼容的，我們|cffff0000強烈建議您將GDKPd升級到1.2.0及其以上版本|r.]=] -- Needs review
L["Enable"] = "啟用"
L["Enter the amount you want to add to player %s:"] = "為玩家 %s 增加金額:" -- Needs review
L["Enter the amount you want to add to the pot:"] = "輸入你想添加進拍賣收入中的金額"
L["Enter the amount you want to subtract from player %s:"] = "為玩家 %s 扣去金額:" -- Needs review
L["Enter the amount you want to subtract from the pot:"] = "輸入你想從拍賣收入中扣除的金額"
L["Enter the maximum amount of money you want to bid on %s:"] = "輸入你想對 %s 出價的最大金額:"
L["Export"] = "導出"
L["Frame alpha"] = "框架透明度"
L["Frame scale"] = "框架縮放"
L["GDKPd auction history"] = "GDKPd拍賣記錄"
L["GDKPd auction history for %s"] = "GDKPd對 %s 的拍賣記錄"
L[ [=[GDKPd: Drag to move
/gdkpd and check "Lock" to hide]=] ] = [=[GDKPd: 拖拽進行移動
/gdkpd 命令，選中 "鎖定" 以隱藏]=] -- Needs review
L["Loot dropped: "] = "[GDKPd]物品掉落:"
L["GDKPd: No detailed data available"] = "GDKPd: 無可用的詳細數據"
L["This raid uses GDKPd to faciliate its GDKP bidding process. While you can bid on items without having GDKPd installed, installing it provides you with a GUI bidding panel, auto bidding functions, auction timers, chat filtering and more!"] = "[GDKPd]本團隊使用GDKPd來輔助拍賣.你也可以在未安裝GDKPd的情況進行出價,安裝本插件將可以使用出價面板,自動出價,拍賣計時器,聊天過濾等多種功能!"
L["GDKPd version %s. Packaged %s."] = [=[GKPd版本 %s. 封裝 %s.
]=] -- Needs review
L["Your version of GDKPd is outdated and no longer compatible with the raid leader's in one or more functionalities. In order to ensure smooth performance, please update GDKPd."] = "[GDKPd]你的GDKPd版本過期且多項功能無法與團長使用的版本兼容.爲了確保正常使用,請升級GDKPd."
L["Your version of GDKPd is slightly outdated compared to the raid leader's. Full compability should be possible, however, you might want to take some time and update GDKPd."] = "[GDKPd]你的GDKPd版本比團長的版本稍低.也許可以與團長的版本兼容,然而你有必要花些時間升級你的GDKPd."
L["Hide"] = "隱藏"
L["Hide 'Auction cancelled' announcements"] = "隱藏'拍賣已取消'的通告" -- Needs review
L["Hide 'Auction cancelled' announcements from raid warning"] = "在團隊警告中隱藏'拍賣已取消'的通告" -- Needs review
L["Hide 'Auction finished' announcements"] = "隱藏\"拍賣結束\"通告"
L["Hide 'Bidding starts' announcements"] = "隱藏\"拍賣開始\"通告"
L["Hide 'Bidding starts' announcements from raid warning"] = "在團隊警告頻道隱藏\"拍賣開始\"通告"
L["Hide chat messages"] = "隱藏聊天信息"
L["Hide 'Current pot:' announcements"] = "隱藏\"當前拍賣收入\"通告"
L["Hide frames in combat"] = "戰鬥中隱藏框架"
L["Hide history window"] = "隱藏歷史紀錄視窗"
L["Hide 'New highest bidder' announcements"] = "隱藏\"新的最高出價者\"通告"
L["Hide players' bid messages"] = "隱藏玩家的出價信息"
L["Hide status and balance windows"] = "隱藏狀態窗口與餘額窗口" -- Needs review
L["Hide 'Time remaining' announcements"] = "隱藏\"剩餘時間\"通告"
L["Hide version check window"] = "隱藏版本檢查視窗"
L["Highest bidder: %s"] = "最高出價者: %s"
L["History"] = "記錄"
L["iLvL ranges"] = "物品等級 範圍" -- Needs review
L["Item level settings"] = "物品等級設置"
L["Item settings"] = "物品設置" -- Needs review
L["Itm"] = "物品" -- Needs review
L["Link raid member balance to pot"] = [=[鏈接團隊成員的餘額到總額
]=] -- Needs review
L["Lock"] = "鎖定"
L["Mail"] = "郵寄" -- Needs review
L["Mail money"] = "郵寄金幣" -- Needs review
L["Manual adjustment"] = [=[手動調整
在瀏覽記錄時手動調整拍賣收入.(例子:手動調整: +300g)]=]
L["Minimum bid: "] = "最低出價:"
L["Minimum increment"] = "最低加價"
L["Minimum quality"] = "最低品質"
L["Min increment"] = "最低加價"
L["Notification options"] = "提示選項"
L["Notify outdated versions"] = "提示過期版本"
L["Notify outdated versions that are compatible with your version"] = "提示過期但是與你的版本兼容的版本"
L["Notify outdated versions that aren't compatible with your version"] = "提示過期且與你的版本不兼容的版本"
L["Notify raid members that do not have GDKPd installed"] = "提示團隊中未安裝GDKPd的人"
L["Per-item settings"] = "獨立的物品設置" -- Needs review
L["Player balance"] = "玩家餘額" -- Needs review
L["Please enter the itemID of an item you want to drop here:"] = "請在此輸入你想要丟棄的物品ID:" -- Needs review
L["Pot export"] = "導出拍賣收入" -- Needs review
L["Pot size: %d|cffffd100g|r"] = "拍賣收入: %d|cffffd100g|r"
L["Prevent dragging and hide anchor"] = "防止拖動并隱藏錨點"
L["Request version data"] = "查看版本信息"
L["Require confirmation when mailing pot shares"] = [=[在郵寄總額分配時需要確認
]=] -- Needs review
L["Restart auction"] = "重新拍賣" -- Needs review
L["Revert highest bid"] = "撤銷最高競拍" -- Needs review
L["Rules"] = "規則" -- Needs review
L["Second bidder share"] = "第二出價者分享" -- Needs review
L["Show"] = "顯示" -- Needs review
L["Show addon frames"] = "顯示插件框體" -- Needs review
L["Show auction duration spiral"] = "顯示拍賣時間螺旋" -- Needs review
L["Show countdown text on auction duration spiral"] = "在拍賣時間螺旋上顯示倒計時文字" -- Needs review
L["Starting bid"] = "開始出價"
L["Stop bid"] = "停止出價"
L["The amount of seconds between each announcement of the remaining time"] = "每次剩餘時間通告之間的秒數" -- Needs review
L["The amount of seconds that have to pass after a bid before the auction is closed"] = "收到最後出價後直到拍賣成功所需要等待的秒數"
L["The amount of seconds that have to pass before the auction is closed without bids recieved"] = "因未收到出價而結束拍賣所必須等待的秒數"
L["Third bidder share"] = "第三出價者分享"
L["This player does not have GDKPd running or his version of GDKPd does not yet support version checks."] = "該玩家沒有安裝GDKPd或他使用的版本不支持版本檢查"
L["This player has the same version of GDKPd as you do. Full compability is ensured."] = "該玩家使用了與你相同版本的GDKPd.保證了完全兼容"
L["This player's version of GDKPd is more advanced than yours. Please consult your Curse Client for updates or manually check the curse.com page."] = "該玩家使用比你更高版本的GDKPd.請查看你的Curse Client進行升級或手動在curse.com升級本插件."
L["This player's version of GDKPd is outdated and one or more functionalities are not compatible:"] = "該玩家使用了過期的GDKPd並且其多種功能與你的版本不兼容"
L["This player's version of GDKPd is outdated. However, their version should be fully compatible with yours."] = "該玩家的GDKPd本版過期.但是他的版本應該可以與你的版本完全兼容."
L["This version of GDKPd was never functional due to internal errors."] = "由於內部錯誤導致該版本GDKPd無法正常運行."
L["This version's player balance window will be unable to recognize distributions by you."] = "此版本的玩家餘額窗口將無法識別你的數額分配" -- Needs review
L["This version will be unable to recognize auctions cancelled by you."] = "這個版本將無法識別您取消拍賣。" -- Needs review
L["This version will be unable to recognize auctions started by you."] = "該版本將無法識別你發布的拍賣."
L["This version will be unable to recognize version check requests by you. Version check requests sent by this version of GDKPd will not be answered."] = [=[此版本將無法識別版本檢查請求。由此版本GDKPd發出的版本檢查請求將不​​會被應答。
]=] -- Needs review
L[ [=[This will completely wipe your auction history and is IRREVERSIBLE.
Are you completely SURE you want to do this?]=] ] = [=[這麼做會完全清除拍賣紀錄並且無法恢復.
你很確定要這麼做嗎?]=]
L["Toggle zero balance"] = "零餘額開關" -- Needs review
L["Use looting system loot threshold setting"] = "使用系統的拾取分配閥值設置" -- Needs review
L["Use slim bidding window even while Master Looter"] = "在Master Looter（團隊拾取分配者）模式時也使用簡化的競拍窗口" -- Needs review
L["Version notifications"] = "版本提示"
L["Versions"] = "版本"
L["Version status for player %s"] = "玩家 %s 的版本信息"
L["Visibility settings"] = "可見性設置" -- Needs review
L[ [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ] = [=[警告！

如果你使用簡化的競拍窗口，你將無法取消拍賣、以及撤銷競拍！
你確定要如此嗎？
]=] -- Needs review
L["Wipe history"] = "滅團記錄"
L[ [=[You have looted a monster!
Do you want GDKPd to announce loot?]=] ] = [=[你拾取了一個怪物的尸體!
你想要GDKPd通告物品掉落嗎?]=]
L[ [=[You have selected the current pot, size %d gold.
What do you want to do with this pot?]=] ] = [=[你選擇了當前的拍賣收入,數量 %d 金.
你想如何處理這些拍賣收入?]=]
L[ [=[You have selected the following pot:
%s, dated %s, size %d gold.
What do you want to do with this pot?]=] ] = [=[你選擇了以下的拍賣收入:
%s,日期 %s,數量 %d 金.
你想如何處理這些拍賣收入?]=]
