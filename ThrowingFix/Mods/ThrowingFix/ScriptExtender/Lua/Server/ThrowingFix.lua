
local function OnThrow(...)
  local args = {...}
  thrown = args[1]

  if Ext.Entity.Get(thrown).Weapon.WeaponProperties & 4 then
	
	  str = Osi.GetAbility(GetHostCharacter(), "Strength")
	  dex = Osi.GetAbility(GetHostCharacter(), "Dexterity")

	  if dex > str then
		diff = (dex - str) * 6
		Osi.RemoveStatus(Osi.GetHostCharacter(), "THROWINGFIX_BUFF")
		Osi.ApplyStatus(Osi.GetHostCharacter(), "THROWINGFIX_BUFF", diff, 0)
	  end
	
  end
end

Ext.Osiris.RegisterListener("OnStartCarrying", 7, "before", OnThrow)

Ext.Osiris.RegisterListener("CastSpellFailed", 5, "before", function(caster, spell, spellType, spellElement, storyActionID)
	if spell == "Throw_Throw" then
		Osi.RemoveStatus(Osi.GetHostCharacter(), "THROWINGFIX_BUFF")
	end
end)

Ext.Osiris.RegisterListener("OnThrown", 7, "before", function(vbl)
	Osi.RemoveStatus(Osi.GetHostCharacter(), "THROWINGFIX_BUFF")
end)