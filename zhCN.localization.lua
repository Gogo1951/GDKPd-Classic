local L = LibStub("AceLocale-3.0"):NewLocale("GDKPd", "zhCN")
if not L then return end

L["Allow multiple simultanous auctions"] = "允许同时拍卖多项物品"
L["Always show the \"Hide\" button on bid frames"] = "在竞拍窗口上总是显示'隐藏'按钮"
L["Amount"] = "金额" -- Needs review
L["Anchor balance window to status window"] = "将余额窗口定位锚点到状态窗口" -- Needs review
L["Announce auction start to raid warning"] = "拍卖开始时在团队警告频道通告"
L["Announce & auto-auction"] = "通告与自动拍卖"
L["Announce bids to raid warning"] = "将竞拍通告到团队警告"
L["Announce loot"] = "发布掉落物品"
L["Announce the current pot amount after each auction"] = "在每次拍卖完成之后通告当前拍卖收入"
L["Any money subtracted from raid members is added to the pot and vice versa"] = "将任何从团员扣去的金钱计入总额，反之亦如此。" -- Needs review
L["Appearance options"] = "外观选项"
L["Are you sure you want to mail %s gold to player %s?"] = "你确定要邮寄 %s 金币 给 玩家 %s 吗？"
L["Auction bid timeout refresh"] = [=[拍卖出价超时刷新
每次有新出价时重置拍卖时间
]=]
L["Auction history"] = "拍卖记录"
L["Auction note: %s"] = "拍卖注释: %s"
L["Auction timeout"] = "拍卖超时"
L["Auto-award loot to winner"] = "自动分配物品给拍卖获胜者"
L["Auto bid"] = "自动出价"
L["Award loot to Master Looter when auto-auctioning"] = "在自动拍卖时将掉落物品分配给分配者"
L["Balance"] = "余额" -- Needs review
L["Behaviour options"] = "行为选项"
L["Bid"] = "出价"
L["Bid button re-enable delay"] = "出价按钮重新可用的延迟"
L["Broadcast rules"] = "规则通告"
L["Cancel auction"] = "取消拍卖"
L["Cannot start auction without Master Looter privileges."] = "没有分配物品权限时无法开始拍卖"
L[" |cffaa0000(Distribute: %dg)|r"] = " |cffaa0000(分配金额: %dg)|r" -- Needs review
L["Control panel scale"] = "控制面板缩放"
L["Countdown timer announce interval"] = "倒数计时通告的间隔"
L["Current bid: "] = "当前报价"
L["Distribute"] = "分配"
L["Do not announce"] = "禁止通告"
L["Do you want to save your pot or reset without saving? You can also add a note to the pot."] = "你想保存拍卖收入还是重置不保存?你也可以在拍卖收入中添加注释."
L[ [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ] = [=[由于补丁4.2对于插件消息系统实现的改变，GDKPd已经不再使用旧的版本检查方式进行通信。
所以此版本的GDKPd将只会发送和接受来自1.2.0及其以上版本的版本检查消息。
同事GDKPd的其他所有功能应当仍然是与以前版本兼容的，我们|cffff0000强烈建议您将GDKPd升级到1.2.0及其以上版本|r.]=]
L["Enable"] = "启用"
L["Enter the amount you want to add to player %s:"] = "为玩家 %s 增加金额:"
L["Enter the amount you want to add to the pot:"] = "输入你想添加进拍卖收入中的金额:"
L["Enter the amount you want to subtract from player %s:"] = "为玩家 %s 扣去金额:" -- Needs review
L["Enter the amount you want to subtract from the pot:"] = "输入你想从拍卖收入中扣除的金额:"
L["Enter the maximum amount of money you want to bid on %s:"] = "输入你想对 %s 出价的最大金额:"
L["Export"] = "导出"
L["Frame alpha"] = "框架透明度"
L["Frame scale"] = "框架缩放"
L["GDKPd auction history"] = "GDKPd拍卖记录"
L["GDKPd auction history for %s"] = "GDKPd对 %s 的拍卖记录"
L[ [=[GDKPd: Drag to move
/gdkpd and check "Lock" to hide]=] ] = [=[GDKPd: 拖拽进行移动
/gdkpd 命令，选中 "锁定" 以隐藏]=] -- Needs review
L["Loot dropped: "] = "[GDKPd]物品掉落:"
L["GDKPd: No detailed data available"] = "GDKPd: 无可用的详细数据"
L["This raid uses GDKPd to faciliate its GDKP bidding process. While you can bid on items without having GDKPd installed, installing it provides you with a GUI bidding panel, auto bidding functions, auction timers, chat filtering and more!"] = "[GDKPd]本团队使用GDKPd来辅助拍卖.你也可以在未安装GDKPd的情况进行出价,安装本插件将可以使用出价面板,自动出价,拍卖计时器,聊天过滤等多种功能!"
L["GDKPd version %s. Packaged %s."] = "GDKPd版本 %s. 打包于 %s."
L["Your version of GDKPd is outdated and no longer compatible with the raid leader's in one or more functionalities. In order to ensure smooth performance, please update GDKPd."] = "[GDKPd]你的GDKPd版本过期且多项功能无法与团长使用的版本兼容.为了确保正常使用,请升级GDKPd."
L["Your version of GDKPd is slightly outdated compared to the raid leader's. Full compability should be possible, however, you might want to take some time and update GDKPd."] = "[GDKPd]你的GDKPd版本比团长的版本稍低.也许可以与团长的版本兼容,然而你有必要花些时间升级你的GDKPd."
L["Hide"] = "隐藏"
L["Hide 'Auction cancelled' announcements"] = "隐藏'拍卖已取消'的通告"
L["Hide 'Auction cancelled' announcements from raid warning"] = "在团队警告中隐藏'拍卖已取消'的通告"
L["Hide 'Auction finished' announcements"] = "隐藏\"拍卖结束\"通告"
L["Hide 'Bidding starts' announcements"] = "隐藏\"拍卖开始\"通告"
L["Hide 'Bidding starts' announcements from raid warning"] = "在团队警告频道隐藏\"拍卖开始\"通告"
L["Hide chat messages"] = "隐藏聊天信息"
L["Hide 'Current pot:' announcements"] = "隐藏\"当前拍卖收入\"通告"
L["Hide frames in combat"] = "战斗中隐藏窗口"
L["Hide history window"] = "隐藏历史窗口"
L["Hide 'New highest bidder' announcements"] = "隐藏\"新的最高出价者\"通告"
L["Hide players' bid messages"] = "隐藏玩家的出价信息"
L["Hide status and balance windows"] = "隐藏状态窗口与余额窗口" -- Needs review
L["Hide 'Time remaining' announcements"] = "隐藏\"剩余时间\"通告"
L["Hide version check window"] = "隐藏版本检查窗口"
L["Highest bidder: %s"] = "最高出价者: %s"
L["History"] = "记录"
L["iLvL ranges"] = "物品等级范围"
L["Item level settings"] = "物品等级设置"
L["Item settings"] = "物品设置"
L["Itm"] = "物品" -- Needs review
L["Link raid member balance to pot"] = "链接团队成员的余额到总额" -- Needs review
L["Lock"] = "锁定"
L["Mail"] = "邮寄"
L["Mail money"] = "邮寄金币"
L["Manual adjustment"] = [=[手动调整
在浏览记录时手动调整拍卖收入.(例子:手动调整: +300g)]=]
L["Minimum bid: "] = "最低出价:"
L["Minimum increment"] = "最低加价"
L["Minimum quality"] = "最低品质"
L["Min increment"] = "最小递增值"
L["Notification options"] = "提示选项"
L["Notify outdated versions"] = "提示过期版本"
L["Notify outdated versions that are compatible with your version"] = "提示过期但是与你的版本兼容的版本"
L["Notify outdated versions that aren't compatible with your version"] = "提示过期且与你的版本不兼容的版本"
L["Notify raid members that do not have GDKPd installed"] = "提示团队中未安装GDKPd的人"
L["Per-item settings"] = "独立的物品设置"
L["Player balance"] = "玩家余额" -- Needs review
L["Please enter the itemID of an item you want to drop here:"] = "请在此输入你想要丢弃的物品ID:"
L["Pot export"] = "输出拍卖总额"
L["Pot size: %d|cffffd100g|r"] = "拍卖收入: %d|cffffd100g|r"
L["Prevent dragging and hide anchor"] = "防止拖动并隐藏锚点"
L["Request version data"] = "查看版本信息"
L["Require confirmation when mailing pot shares"] = "在邮寄总额分配时需要确认" -- Needs review
L["Restart auction"] = "重新拍卖"
L["Revert highest bid"] = "撤销最高竞拍"
L["Rules"] = "规则"
L["Second bidder share"] = "第二出价者分享" -- Needs review
L["Show"] = "显示"
L["Show addon frames"] = "显示插件框体"
L["Show auction duration spiral"] = "显示拍卖时间螺旋" -- Needs review
L["Show countdown text on auction duration spiral"] = "在拍卖时间螺旋上显示倒计时文字" -- Needs review
L["Starting bid"] = "开始出价"
L["Stop bid"] = "停止出价"
L["The amount of seconds between each announcement of the remaining time"] = "每次剩余时间通告之间的秒数"
L["The amount of seconds that have to pass after a bid before the auction is closed"] = "收到最后出价后直到拍卖成功所需要等待的秒数"
L["The amount of seconds that have to pass before the auction is closed without bids recieved"] = "因未收到出价而结束拍卖所必须等待的秒数"
L["Third bidder share"] = "第三出价者分享"
L["This player does not have GDKPd running or his version of GDKPd does not yet support version checks."] = "该玩家没有安装GDKPd或他使用的版本不支持版本检查"
L["This player has the same version of GDKPd as you do. Full compability is ensured."] = "该玩家使用了与你相同版本的GDKPd.保证了完全兼容"
L["This player's version of GDKPd is more advanced than yours. Please consult your Curse Client for updates or manually check the curse.com page."] = "该玩家使用比你更高版本的GDKPd.请查看你的Curse Client进行升级或手动在curse.com升级本插件"
L["This player's version of GDKPd is outdated and one or more functionalities are not compatible:"] = "该玩家使用了过期的GDKPd并且其多种功能与你的版本不兼容"
L["This player's version of GDKPd is outdated. However, their version should be fully compatible with yours."] = "该玩家的GDKPd版本过期.但是他的版本应该可以与你的版本完全兼容"
L["This version of GDKPd was never functional due to internal errors."] = "由于内部错误导致该版本GDKPd无法正常运行"
L["This version's player balance window will be unable to recognize distributions by you."] = "此版本的玩家余额窗口将无法识别你的数额分配。" -- Needs review
L["This version will be unable to recognize auctions cancelled by you."] = "此版本将无法识别你取消的拍卖"
L["This version will be unable to recognize auctions started by you."] = "该版本将无法识别你发布的拍卖"
L["This version will be unable to recognize version check requests by you. Version check requests sent by this version of GDKPd will not be answered."] = "此版本将无法识别版本检查请求。由此版本GDKPd发出的版本检查请求将不会被应答。"
L[ [=[This will completely wipe your auction history and is IRREVERSIBLE.
Are you completely SURE you want to do this?]=] ] = [=[这么做会完全清除拍卖记录并且无法恢复.
你很确定要这么做吗?]=]
L["Toggle zero balance"] = "零余额开关" -- Needs review
L["Use looting system loot threshold setting"] = "使用系统的拾取分配阈值设置"
L["Use slim bidding window even while Master Looter"] = "在Master Looter（团队拾取分配者）模式时也使用简化的竞拍窗口" -- Needs review
L["Version notifications"] = "版本提示"
L["Versions"] = "版本"
L["Version status for player %s"] = "玩家 %s 的版本信息"
L["Visibility settings"] = "可见性设置"
L[ [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ] = [=[警告！

如果你使用简化的竞拍窗口，你将无法取消拍卖、以及撤销竞拍！
你确定要如此吗？]=] -- Needs review
L["Wipe history"] = "灭团记录"
L[ [=[You have looted a monster!
Do you want GDKPd to announce loot?]=] ] = [=[你拾取了一个怪物的尸体!
你想要GDKPd通告物品掉落吗?]=]
L[ [=[You have selected the current pot, size %d gold.
What do you want to do with this pot?]=] ] = [=[你选择了当前的拍卖收入,数量 %d 金.
你想如何处理这些拍卖收入?
]=]
L[ [=[You have selected the following pot:
%s, dated %s, size %d gold.
What do you want to do with this pot?]=] ] = [=[你选择了以下的拍卖收入:
%s,日期 %s,数量 %d 金.
你想如何处理这些拍卖收入?]=]
