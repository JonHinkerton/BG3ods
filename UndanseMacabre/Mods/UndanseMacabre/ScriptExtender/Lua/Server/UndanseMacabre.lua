
local function KillGhouls()
    local summons = Osi.DB_PlayerSummons:Get(nil)
    for _, summon in pairs(summons) do
	if string.match(summon[1],"Undead_Ghoul_WakeTheDead") ~= nil then
	    Osi.TeleportToPosition(summon[1],0,0,10000,"",0,0,1,1,1)
	    Die(summon[1])
	    	
	end
    end
end

Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, targettingType, school, StoryActionID)
    if spell == "Undanse_Macabre" then
        KillGhouls()
	Osi.RemoveSpell(caster, "Undanse_Macabre", 1)
    end
end)

Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, targettingType, school, StoryActionID)
    if spell == "Target_CursedTome_WakeTheDead" then
        Osi.AddSpell(caster, "Undanse_Macabre", 1, 1)	
    end
end)

