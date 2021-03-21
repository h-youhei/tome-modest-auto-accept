local _M = loadPrevious(...)

local super_setupCommands = _M.setupCommands
function _M:setupCommands()
	super_setupCommands(self)

	self.key:addBinds {
		TOGGLE_AUTOACCEPT_TARGET = function()
			config.settings.tome.modest_auto_accept_target = not config.settings.tome.modest_auto_accept_target
			game:saveSettings("tome.modest_auto_accept_target", ("tome.modest_auto_accept_target = %s\n"):format(tostring(config.settings.tome.modest_auto_accept_target)))
			game.log("#GOLD#Automatic accept target mode: %s", config.settings.tome.modest_auto_accept_target and _t"#LIGHT_GREEN#enabled" or _t"#LIGHT_RED#disabled")
		end,
	}
end
