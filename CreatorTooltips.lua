local addonName, addon = ...

--Script to generate GUID for a player
--/run local name = UnitName("player"); local guid = UnitGUID("player"); ChatFrame1:AddMessage(name.." has the GUID: "..guid);
addon.GDKPdDevs = {
    ["Player-4408-044DE7F9"] = "Team Member", -- Gogodeekay-Faerlina
    ["Player-4408-03D2C535"] = "Team Member", -- Gogodruid-Faerlina
    ["Player-4408-03D2C53D"] = "Team Member", -- Gogohunter-Faerlina
    ["Player-4408-03D2C27F"] = "Team Member", -- Gogomage-Faerlina
    ["Player-4408-03D2C4A6"] = "Team Member", -- Gogopaladin-Faerlina
    ["Player-4408-03D2C57D"] = "Team Member", -- Gogopriest-Faerlina
    ["Player-4408-03D2C295"] = "Team Member", -- Gogorogue-Faerlina
    ["Player-4408-03D2C5E2"] = "Team Member", -- Gogoshaman-Faerlina
    ["Player-4408-03D2C21E"] = "Team Member", -- Gogowarlock-Faerlina
    ["Player-4408-03D2C4C4"] = "Team Member", -- Gogowarrior-Faerlina

    -- Special Thanks
    -- TODO

    -- Test Accounts
    ["Player-4728-03F542F0"] = "Team Member", -- Cooltestguy-Benediction
    ["Player-4408-04645469"] = "Team Member", -- Funnytestguy-Faerlina
}


--Setup team member tooltips
GameTooltip:HookScript("OnTooltipSetUnit", function(...)
    local unitname, unittype = GameTooltip:GetUnit()
    if unittype then
        local curMouseOver = UnitGUID(unittype)
        if curMouseOver then
            if addon.GDKPdDevs[curMouseOver] then
                GameTooltip:AddLine(format("|TInterface\\AddOns\\" ..
                    addonName .. "\\Images\\GDKPd:16:16:0:0|t %s : %s"
                    ,
                    addonName, addon.GDKPdDevs[curMouseOver]))
            end
        end
    end
end)
