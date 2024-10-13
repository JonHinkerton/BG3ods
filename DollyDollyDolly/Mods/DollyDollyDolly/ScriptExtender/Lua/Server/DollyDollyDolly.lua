
local function KillDollyDollyDolly()
    local summons = Osi.DB_PlayerSummons:Get(nil)
    for _, summon in pairs(summons) do
		if string.match(summon[1],"DollyDollyDolly") ~= nil then
			Die(summon[1])
		end
    end
end

Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, targettingType, school, StoryActionID)
    if spell == "Target_Summon_DollyDollyDolly" then
        KillDollyDollyDolly()
    end
end)
