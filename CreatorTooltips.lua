local addonName, addon = ...

--Script to generate GUID for a player
--/run local name = UnitName("player"); local guid = UnitGUID("player"); ChatFrame1:AddMessage(name.." has the GUID: "..guid);
addon.GDKPdDevs = {
    -- GDKPd Team
    ["Player-4800-048C8808"] = "Team Member", -- Gogodeekay-Eranikus
    ["Player-4800-048C887A"] = "Team Member", -- Gogodruid-Eranikus
    ["Player-4800-048C87ED"] = "Team Member", -- Gogohunter-Eranikus
    ["Player-4800-048C88C6"] = "Team Member", -- Gogomage-Eranikus
    ["Player-4800-048C88F0"] = "Team Member", -- Gogopaladin-Eranikus
    ["Player-4800-048C87F8"] = "Team Member", -- Gogopriest-Eranikus
    ["Player-4800-04942199"] = "Team Member", -- Gogorogue-Eranikus
    ["Player-4800-048C8800"] = "Team Member", -- Gogoshaman-Eranikus
    ["Player-4800-048C88CD"] = "Team Member", -- Gogowarlock-Eranikus
    ["Player-4800-048C87E4"] = "Team Member", -- Gogowarrior-Eranikus

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
