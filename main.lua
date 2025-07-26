-- Dead Rails : Magnet à bons
local joueur = game.Players.LocalPlayer
local corps = joueur.Character and joueur.Character:FindFirstChild("HumanoidRootPart")

for _, objet in pairs(workspace:GetDescendants()) do
    if objet:IsA("Part") and (objet.Name:lower():find("bond") or objet.Name:lower():find("obligation")) then
        objet.CFrame = corps.CFrame + Vector3.new(0, 3, 0)
    end
end
