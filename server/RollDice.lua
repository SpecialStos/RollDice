Citizen.CreateThread(function() --We are using a citizen create thread that will run only 1 time. 
                                --If RollDice.UseCommand is enabled then it will create the command and a sugggestion box for it.
    if(RollDice.UseCommand)then
        RegisterCommand(RollDice.ChatCommand, function(source, args, rawCommand) --Creates the roll command.
            if(args[1] ~= nil and args[2] ~= nil)then --Makes sure you do have both arguments in place.
                local dices = tonumber(args[1]) 
                local sides = tonumber(args[2]) --Converts chat string to number.
                if (sides > 0 and sides <= RollDice.MaxSides) and (dices > 0 and dices <= RollDice.MaxDices) then --Checks if sides and dices are bigger than 0 and smaller than the config values.
                    TriggerEvent("RollDice:Server:Event", source, dices, sides)
                else
                    TriggerClientEvent('chatMessage', source, RollDice.ChatPrefix, RollDice.ChatTemplate, "Invalid amount. Max Dices: " .. RollDice.MaxDices .. ", Max Sides: " .. RollDice.MaxSides)
                end

            else
                TriggerClientEvent('chatMessage', source, RollDice.ChatPrefix, RollDice.ChatTemplate, "Please fill out both arguments, example: /" .. RollDice.ChatCommand .. " <dices> <sides>")
            end

        end, false)
    end

end)

RegisterServerEvent('RollDice:Server:Event')
AddEventHandler('RollDice:Server:Event', function(source, dices, sides) --We are using a trigger event just so you can use this event in other places as well.
                                                                        --I mean if you do want to use the event for a Registerable item. Just call the event and send the source, dices and sides.
                                                                        --Like this: TriggerServerEvent(GetPlayerServerId(PlayerId()), dices, sides)
    local tabler = {}
    for i=1, dices do 
        table.insert(tabler, math.random(1, sides)) --Creates a table with the amount of dices. Randomises the sides eventually.
    end

    TriggerClientEvent("RollDice:Client:Roll", -1, source, RollDice.MaxDistance, tabler, sides, GetEntityCoords(GetPlayerPed(source))) --Does the roll to everyone. It checks client sided if you are within the distance.
end)
