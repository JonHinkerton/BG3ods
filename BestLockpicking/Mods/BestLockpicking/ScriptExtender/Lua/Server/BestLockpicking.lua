function remove_whitespace_and_brackets(string)
  string = string:gsub("[ ]", "")
  string = string:gsub("[[]]", "")
  return string
end

function applyHighestSOH()
  rows = Osi.DB_Players:Get(Characters) -- get characters that are in current party
  highestSleightOfHand = -5
  sleightOfHandFrom = ""
  
  for _, row in pairs(rows) do -- --for each party member, get their modifier for each skill
    emoji2 = rows[_]
    emoji = tostring(emoji2[1])
    emoji = remove_whitespace_and_brackets(emoji)
    --Get current party member's modifiers
    --if party member's modifier is greater than the highest modifier, set the highest modifier to the party member's modifier
    temp = Osi.HasSkill(emoji, "SleightOfHand")
    if temp > highestSleightOfHand then
      highestSleightOfHand = temp
      sleightOfHandFrom = emoji
    end
  end

  -- print("BSOH: " .. highestSleightOfHand .. " " .. sleightOfHandFrom) 

  iam = Osi.GetHostCharacter()
  iam = tostring(iam)
  iam = remove_whitespace_and_brackets(iam)
  iamcringe = "\"" .. iam .. "\""
  temp = Osi.HasSkill(iam, "SleightOfHand")
  if temp < highestSleightOfHand then
    xd = (highestSleightOfHand - temp) * 6
    if sleightOfHandFrom == "S_Player_Wyll_c774d764-4a17-48dc-b470-32ace9ce447d" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_WYLL", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_ShadowHeart_3ed74f06-3c60-42dc-83f6-f034cb47c679" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_SHADOWHEART", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_Laezel_58a69333-40bf-8358-1d17-fff240d7fb12" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_LAEZEL", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_Astarion_c7c13742-bacd-460a-8f65-f864fe41f255" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_ASTARION", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_Gale_ad9af97d-75da-406a-ae13-7071c563f604" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_GALE", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_Jaheira_91b6b200-7d00-4d62-8dc9-99e8339dfa1a" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_JAHEIRA", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_Minsc_0de603c5-42e2-4811-9dad-f652de080eba" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_MINSC", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_Player_Karlach_2c76687d-93a2-477b-8b18-8a14b549304c" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_KARLACH", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "Elves_Female_Drow_Lolth_Player_9d85d0f6-5231-4738-a674-bf28ff19e515" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_MINT", xd, 0, Osi.GetHostCharacter())
    elseif sleightOfHandFrom == "S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323" then
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_HALSIN", xd, 0, Osi.GetHostCharacter())
    else
      Osi.ApplyStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF", xd, 0, Osi.GetHostCharacter())
    end
  end
end

function removeSOHBuff()
  -- remove the buff from the player character
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_WYLL")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_SHADOWHEART")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_LAEZEL")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_ASTARION")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_GALE")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_JAHEIRA")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_MINSC")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_KARLACH")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_MINT")
  Osi.RemoveStatus(Osi.GetHostCharacter(), "SLEIGHTOFHAND_BUFF_HALSIN")
end

Ext.Osiris.RegisterListener("RequestCanLockpick", 3, "before", function(vbl)
  applyHighestSOH()
end) 

Ext.Osiris.RegisterListener("StoppedLockpicking", 2, "after", function(diag, int)
  removeSOHBuff()
end)

Ext.Osiris.RegisterListener("RequestCanDisarmTrap", 3, "before", function(vbl)
  applyHighestSOH()
end) 

Ext.Osiris.RegisterListener("StoppedDisarmingTrap", 2, "after", function(diag, int)
  removeSOHBuff()
end)

Ext.Osiris.RegisterListener("RequestPickpocket", 2, "before", function(vbl)
  applyHighestSOH()
end) 

Ext.Osiris.RegisterListener("CharacterPickpocketFailed", 2, "after", function(diag, int)
  removeSOHBuff()
end)

Ext.Osiris.RegisterListener("CharacterPickpocketSuccess", 6, "after", function(diag, int)
  removeSOHBuff()
end)