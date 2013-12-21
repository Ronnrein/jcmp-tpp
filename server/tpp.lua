class "TeleportPlayer"
function TeleportPlayer:__init()
    Events:Subscribe("PlayerChat", self, self.PlayerChat)
end

function TeleportPlayer:PlayerChat(args)
    local words = args.text:split(" ")
    if #words == 2 and words[1] == "/tpp" then
        local name = words[2]
        if string.lower(args.player:GetName()) ~= string.lower(name) then
            for player in Server:GetPlayers() do
                if string.lower(player:GetName()) == string.lower(name) then
                    args.player:SetPosition(player:GetPosition())
                    player:SendChatMessage(args.player:GetName().." teleporterte til deg", Color(237, 159, 33))
                    return true
                end
            end
            args.player:SendChatMessage("Fant ingen spiller med navn: "..name, Color(255,0,0))
        end
    end
end

tpp = TeleportPlayer()