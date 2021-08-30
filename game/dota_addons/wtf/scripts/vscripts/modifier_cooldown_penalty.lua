modifier_cooldown_penalty = class( {} )

function modifier_cooldown_penalty:IsDebuff()
	return true
end

function modifier_cooldown_penalty:IsPurgable()
	return false
end
