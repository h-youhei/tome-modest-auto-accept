local _M = loadPrevious(...)

local Map = require "engine.Map"


local function enemies(range)
	local enemies = 0
	if not game.player.x then return enemies end
	core.fov.calc_circle(
		game.player.x, game.player.y,
		game.level.map.w, game.level.map.h,
		range or game.player.sight or 10,
		function(_, x, y) return game.level.map:opaque(x, y) end,
		function(_, x, y)
			local actor = game.level.map(x, y, game.level.map.ACTOR)
			if actor and actor ~= game.player
			and game.player:reactionToward(actor) < 0
			and game.player:canSee(actor)
			and game.level.map.seens(x, y) then
				enemies = enemies+1
			end
		end,
	nil)
	return enemies
end

local super_getTarget = _M.getTarget
function _M:getTarget(typ)
	-- -- version that follow auto-accept-target
	-- if config.settings.saved_auto_accept_target then
	-- 	config.settings.auto_accept_target = true
	-- 	config.settings.saved_auto_accept_target = false
	-- end
	-- if config.settings.auto_accept_target then
	-- 	-- if game.target.target and (not game.target.target.entity) and enemies(typ.range) ~= 1 then
	-- 	if enemies(typ.range) ~= 1 then
	-- 		config.settings.auto_accept_target = false
	-- 		config.settings.saved_auto_accept_target = true
	-- 		return super_getTarget(self, typ)
	-- 	end
	-- end

	local mx, my = game.mouse.last_pos.x, game.mouse.last_pos.y
	local tile_mx, tile_my = game.level.map:getMouseTile(mx,my)
	local actor_hover = game.level.map(tile_mx, tile_my, Map.ACTOR)
	local aiming = game.player:canSee(actor_hover) and
game.target.target and game.target.target.entity and game.target.target.entity == actor_hover
	if aiming or enemies(typ and typ.range) == 1 then
		config.settings.auto_accept_target = true
		return super_getTarget(self, typ)
	end
	config.settings.auto_accept_target = false
	return super_getTarget(self, typ)
end

return _M
