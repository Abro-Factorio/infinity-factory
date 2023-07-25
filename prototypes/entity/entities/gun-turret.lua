local EXAMPLE_TYPE = "ammo-turret"
local EXAMPLE_NAME = "gun-turret"
local PREFIX_NAME = "gun-turret-"

local function object_updater(zero_object, level, object)
    object.rotation_speed = zero_object.rotation_speed * math.pow(Config.upgrade_multiplier, level)
    object.preparing_speed = zero_object.preparing_speed / math.pow(Config.upgrade_multiplier, level)
    object.folding_speed = zero_object.folding_speed / math.pow(Config.upgrade_multiplier, level)
    object.automated_ammo_count = zero_object.automated_ammo_count * math.pow(Config.upgrade_multiplier, level)
    object.attacking_speed = zero_object.attacking_speed * math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.cooldown = zero_object.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.shell_particle.speed = zero_object.attack_parameters.shell_particle.speed * math.pow(Config.upgrade_multiplier, level)
    object.attack_parameters.range = zero_object.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
    object.call_for_help_radius = zero_object.call_for_help_radius * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)