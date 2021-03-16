local ActorTalents = require("engine.interface.ActorTalents")

class:bindHook("ToME:load", function(self, data)
	ActorTalents:loadDefinition("data-modest-auto-accept/preventAutoAccept.lua")
end)
