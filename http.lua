--[[

	AUTHOR // devity
	DESCRIPTION // API Wrapper for discord in ROBLOX
	SITE // https://devity.tk/


	// USAGE
	
	Discord = API.new(Your Discord Token)
	Discord:Message("Hey")


]]


local API = {}
API.__index = API

local HTTPService = game:GetService("HttpService")

function API.new(Token)
	local newAPI = {}
	setmetatable(newAPI, API)
	
	newAPI.BaseURL = "https://discordapp.com/api/"
	newAPI.Token = Token
	
	return newAPI
end

function API:Message(Content, ChannelID)
	
	print(Content, ChannelID)
	
	local MessageAPI = "channels/"..tostring(ChannelID) .."/messages"
	
	
	local Data = {
		["content"] = Content;
		["tts"] = false;
	};
	local HeadersTable = {
		["Content-Type"] = "application/json",
		["authorization"] = self.Token
		
	}
	
	HTTPService:RequestAsync({Url = self.BaseURL .. MessageAPI, Method = "POST", Headers = HeadersTable, Body = HTTPService:JSONEncode(Data)})

end

return API
