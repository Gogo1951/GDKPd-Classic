local addonName, addon = ...
local L                = LibStub('AceLocale-3.0'):GetLocale('GDKPd')
local time             = time
local gmatch           = gmatch
local gsub             = gsub

addon.itemZones = {}
function addon.GenerateBidPriceOptions()

    local zoneorder = 50

    for k, v in pairs(addon.instanceOrders) do
        local zoneName = addon.zonesList[v]
        local initorder = 10
        --Generate the option group
        addon.options.args[zoneName] = {
            name = "    " .. zoneName,
            desc = "",
            type = "group",
            width = "double",
            inline = false,
            order = zoneorder,
            args = {}
        }
        zoneorder = zoneorder + 1

        --Generate rows within the options group
        if addon.itemZones[zoneName] ~= nil then
            for k, v in pairs(addon.itemZones[zoneName]) do
                local item = addon.itemData[v]
                if item == nil then
                    --print(v, zoneName)
                else
                    addon.options.args[zoneName].args["itemname" .. tostring(v)] = {
                        type = "description",
                        name = ITEM_QUALITY_COLORS[item.Quality].hex .. item.Name,
                        order = initorder,
                        fontSize = "medium",
                        width = 1
                    }
                    initorder = initorder + 1
                    addon.options.args[zoneName].args["itemnameedit1" .. tostring(v)] = {
                        type = "input",
                        name = "min bid",
                        order = initorder,
                        width = 0.4,
                        get = function(info) return "" end,
                        set = function(info, val) return end,
                    }
                    initorder = initorder + 1
                    addon.options.args[zoneName].args["itemnameedit2" .. tostring(v)] = {
                        type = "input",
                        name = "increment",
                        order = initorder,
                        width = 0.4,
                        get = function(info) return "" end,
                        set = function(info, val) return end,
                    }
                    initorder = initorder + 1
                    --addon.options.args[zoneName].args["itemnamespacer" .. tostring(v)] = {
                    --    type = "input",
                    --    name = "",
                    --    order = 120,
                    --    width = 0.2,
                    --    multiline = true,
                    --    get = function(info) return addon.db.raidRules end,
                    --    set = function(info, val) addon.db.raidRules = strsub(val, 1, 255) end,
                    --}
                    --initorder = initorder + 1
                end
            end
        end
    end
end

--Extract the variable value from a global UI string, or return false if it is not the correct string
function addon.ExtractFromGlobalString(GlobalStringLiteral, FormattedString)
    local extract = FormattedString
    local prefix = GlobalStringLiteral:gsub("%%s.*", "")
    local suffix = GlobalStringLiteral:gsub(".*%%s", "")
    --Check that both what comes before and after the formatted string part is in the message
    if not strmatch(FormattedString, prefix) or not strmatch(FormattedString, suffix) then
        return false
    end
    --If it is the correct system message, extract the string
    extract = extract:gsub(prefix, ""):gsub(suffix, "")
    if addon.debugMenus then
        print("pre: " .. prefix)
        print("suf: " .. suffix)
        print("ext: " .. extract)
    end
    return extract
end

--Check if a string starts with a given pattern
function addon.StartsWith(str, pattern)
    return str:sub(1, #pattern) == pattern
end

--Check if a string ends with a given pattern
function addon.EndsWith(str, pattern)
    return pattern == "" or str:sub(- #pattern) == pattern
end

--Return a stylized string of a number
function addon.PrintBigNumber(num)
    return tostring(math.floor(num)):reverse():gsub("(%d%d%d)", "%1,"):gsub(",(%-?)$", "%1"):reverse()
end
