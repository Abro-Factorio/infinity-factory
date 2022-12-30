local EXAMPLE_TYPE = "electric-turret"
local EXAMPLE_NAME = "laser-turret"
local PREFIX_NAME = "laser-turret-"

local function object_updater(zero_object, level, object)
    object.rotation_speed = zero_object.rotation_speed * math.pow(Config.upgrade_multiplier, level)
    object.preparing_speed = zero_object.preparing_speed / math.pow(Config.upgrade_multiplier, level)
    object.folding_speed = zero_object.folding_speed / math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.cooldown = zero_object.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.range = zero_object.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.damage_modifier = zero_object.attack_parameters.damage_modifier * math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.ammo_type.energy_consumption = change_energy_pow_upgrade(zero_object.attack_parameters.ammo_type.energy_consumption, level)
    object.attack_parameters.ammo_type.action.action_delivery.max_length = zero_object.attack_parameters.ammo_type.action.action_delivery.max_length * math.pow(Config.upgrade_multiplier, level)
    object.call_for_help_radius = zero_object.call_for_help_radius * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)