local Talents = require("engine.interface.ActorTalents")

local decayed_bloated_horror = Talents.talents_def.T_DECAYED_BLADE_HORROR
-- to prevent error if it doesn't have Cults DLC
if decayed_bloated_horror then
	decayed_bloated_horror.target = function(self, t)
		return {
			type="hit",
			range=self:getTalentRange(t),
			nolock=true
			-- remove can_autoaccept=true
		}
	end
end
