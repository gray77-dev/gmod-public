
local PLUGIN = PLUGIN

PLUGIN.name = "Holo Comm"
PLUGIN.author = "Gray"
PLUGIN.description = "Adds in a new /HoloComm command transmitting to a fixed distance, appearing in yellow."
PLUGIN.license = [[
Copyright 2019-2020 DevAppeared
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

ix.config.Add("holoCommDistance", 560, "The maximum distance people can receive the transmission.", nil, {
	data = {min = 10, max = 50000, decimals = 1},
	category = "chat"
})

ix.command.Add("HoloComm", {
	description = "Transmit a radio information to players in range.",
	arguments = ix.type.text,
	OnRun = function(self, client, text)
		ix.chat.Send(client, "HoloComm", text)
	end
})

ix.chat.Register("holocomm", {
	CanHear = ix.config.Get("holoCommRange", 1000),
	OnChatAdd = function(self, speaker, text)
		chat.AddText(Color(255, 255, 0), string.format(self.format, speaker:Name(), text))
	end,
	indicator = "chatPerforming"
})

ix.chat.Register("holocomm", {
    format = "%s [Holo-Comm] \"%s\"",
    color = Color(50,255,50),
    OnChatAdd = function(self, speaker, text, bAnonymous, data)
        chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
    end,
    prefix = {"/holocomm", "/h"},
    description = "@cmdHoloComm",
    indicator = "chatYelling",
    deadCanChat = false
})
