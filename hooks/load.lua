local ActorTalents = require("engine.interface.ActorTalents")
local Textzone = require "engine.ui.Textzone"

class:bindHook("ToME:load", function(self, data)
	ActorTalents:loadDefinition("data-modest-auto-accept/preventAutoAccept.lua")
end)

if type(config.settings.tome.modest_auto_accept_target) == 'nil' then
	config.settings.tome.modest_auto_accept_target = true
end

class:bindHook("GameOptions:generateList", function (self, data)
	if data.kind == "gameplay" then
		data.list[#data.list+1] = {
			zone=Textzone.new{
				width=self.c_desc.w, height= self.c_desc.h,
				text=string.toTString("Auto-accept target when there is only one seen enemiy or you are hovering mouse on a creature.")
			},
			name=string.toTString("#GOLD##{bold}#Modest Auto-accept target#WHITE##{normal}#"),
			status = function(item)
				return tostring(config.settings.tome.modest_auto_accept_target and "enabled" or "disabled")
			end,
			fct = function(item)
				config.settings.tome.modest_auto_accept_target = not config.settings.tome.modest_auto_accept_target
				game:saveSettings("tome.modest_auto_accept_target", ("tome.modest_auto_accept_target = %s\n"):format(tostring(config.settings.tome.modest_auto_accept_target)))
				self.c_list:drawItem(item)
			end
		}
	end
end)
