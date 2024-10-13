Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, targettingType, school, StoryActionID)
    if spell == "Target_Summon_Gremmy" then
        local summons = Osi.DB_PlayerSummons:Get(nil)
		for _, summon in pairs(summons) do
			if string.match(summon[1],"Gremmy") ~= nil then
				Die(summon[1])
			end
		end
    end
end)

--Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(object, status, causee, applyStoryActionID)
--   if status == "GREMISHKA_MAGICALLERGY_AURA" then
--       local summons = Osi.DB_PlayerSummons:Get(nil)
--		for _, summon in pairs(summons) do
	--		if string.match(summon[1],"Gremmy") ~= nil then
	--			ApplyStatus(summon[1], "GREMISHKA_MAGICALLERGY_AURA", -1, 0, "")
	--		end
	--	end
  --  end
--end)