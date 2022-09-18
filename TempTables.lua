local addontable = select(2,...)

local logTableRequests = false


local tables = {}
local meta = {
	__index = {
		Release=function(t,noRecursion)
			if not noRecursion then
				for key,val in pairs(t) do
					if (type(val) == "table") and (getmetatable(val) == "TempTable") then
						val:Release()
					end
				end
			end
			table.wipe(t)
			if not tContains(tables,t) then
				tinsert(tables,t)
			end
		end,
	},
	__metatable = "TempTable",
}
if logTableRequests then
	TempTables_RequestLog = {}
end
function addontable.emptytable(...)
	local t = tremove(tables) or setmetatable({},meta)
	for i=1,select('#',...) do
		t[i] = (select(i,...))
	end
	if logTableRequests then
		local tostrT = tostring(t)
		TempTables_RequestLog[tostrT] = TempTables_RequestLog[tostrT] or {}
		tinsert(TempTables_RequestLog[tostrT],debugstack())
	end
	return t
end
