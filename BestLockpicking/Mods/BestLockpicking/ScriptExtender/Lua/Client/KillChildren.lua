--This is global so other mods could potentially modify it
TargetCharacters = {
  "c8ab1ca6-96bb-467e-91c9-af87bc4d3925",
  "0f8ef61e-cb63-49e1-a242-677173bff5e0",
  "540ddc1f-42c6-4347-ba03-b3cf3d3942ab",
  "6644185d-385e-4dfc-973c-bb854cbfd540",
  "94e865e9-790d-4633-a378-8fb50832b5e9",
  "e1fda08b-45d4-41db-84b5-20e9931ba5af",
  "0f8ef61e-cb63-49e1-a242-677173bff5e0",
  "02257c1c-bbec-4ae3-9bcb-31c75a0a982f",
  "3b92c689-6024-4446-a6c9-584e9e8d77ca",
  "0133f2ad-e121-4590-b5f0-a79413919805",
  "bd7f31a6-98e8-46cd-97be-4347fa45d387"
}

---@param level string
---@param isEditorMode integer
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(level, isEditorMode)
  for _,v in pairs(TargetCharacters) do
      if Osi.Exists(v) == 1 then
          Osi.SetImmortal(v, 0)
      end
  end
end)