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
                    --    get = function(info) return addon.db.global.raidRules end,
                    --    set = function(info, val) addon.db.global.raidRules = strsub(val, 1, 255) end,
                    --}
                    --initorder = initorder + 1
                end
            end
        end
    end
end
