-- GUI Aimant à Bons - Dead Rails (by ChatGPT)
local joueur = game.Players.LocalPlayer
local coreGui = game:GetService("StarterGui")

-- Création de l'interface
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MagnetGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = joueur:WaitForChild("PlayerGui")

local bouton = Instance.new("TextButton")
bouton.Size = UDim2.new(0, 200, 0, 50)
bouton.Position = UDim2.new(0.5, -100, 0.8, 0)
bouton.Text = "🧲 Activer l’aimant"
bouton.BackgroundColor3 = Color3.fromRGB(65, 200, 125)
bouton.TextColor3 = Color3.new(1, 1, 1)
bouton.Font = Enum.Font.SourceSansBold
bouton.TextSize = 20
bouton.Parent = screenGui

-- Fonction d’aimant
local function activerMagnet()
    local corps = joueur.Character and joueur.Character:FindFirstChild("HumanoidRootPart")
    if not corps then return end

    local count = 0

    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Part") or obj:IsA("MeshPart") then
            local nom = obj.Name:lower()
            if nom:find("bond") or nom:find("obligation") then
                obj.CFrame = corps.CFrame + Vector3.new(0, 3, 0)
                count += 1
            end
        end
    end

    bouton.Text = "✅ Aspiré : " .. tostring(count)
    wait(2)
    bouton.Text = "🧲 Activer l’aimant"
end

-- Quand tu cliques
bouton.MouseButton1Click:Connect(activerMagnet)
