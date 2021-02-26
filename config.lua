RollDice = {}

RollDice.UseCommand = true --Use command or not.
RollDice.ChatCommand = "roll" --Command name.
RollDice.ChatPrefix = "SYSTEM" --This is the chat prefix. If they type a wrong number or invalid one then it will say that SYSTEM has messaged them, just try it.
RollDice.ChatTemplate = "error" --YOU SHOULD CHANGE THIS HERE. I don't really know what chat themes you got so change it. We made our own ones, like error, warning, etc. You can find out what themes you got by checking inside the chat resource in index.css

RollDice.MaxDices = 2 -- Max amount of dices you can roll at one instance. Default is 2.
RollDice.MaxSides = 6 -- Max amount of sides on a dice. Default is 6.
RollDice.MaxDistance = 7.0 -- Distance players can see the rolldice in 3d text.
RollDice.ShowTime = 7 -- Time in seconds on how long the players can see the RollDice.
RollDice.Offset = 1.2 --Changes the z axis of the 3d text displayed.
