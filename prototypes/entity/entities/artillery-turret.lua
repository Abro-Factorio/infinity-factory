local EXAMPLE_TYPE = "artillery-turret"
local EXAMPLE_NAME = "artillery-turret"
local PREFIX_NAME = "artillery-turret-"

local function object_updater(zero_object, level, object)
    object.ammo_stack_limit = zero_object.ammo_stack_limit * math.pow(Config.upgrade_multiplier, level)
    object.automated_ammo_count = zero_object.automated_ammo_count * math.pow(Config.upgrade_multiplier, level)
    object.turret_rotation_speed = zero_object.turret_rotation_speed * math.pow(Config.upgrade_multiplier, level)
    object.turn_after_shooting_cooldown = zero_object.turn_after_shooting_cooldown / math.pow(Config.upgrade_multiplier, level)
    object.gun = get_name_by_level("artillery-wagon-cannon-", level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)

local function artillery_wagon_cannon_item_updater(zero_item, level, item)
    item.attack_parameters.cooldown = zero_item.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.range = zero_item.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.min_range = zero_item.attack_parameters.min_range * math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.shell_particle.speed = zero_item.attack_parameters.shell_particle.speed * math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.shell_particle.vertical_speed = zero_item.attack_parameters.shell_particle.vertical_speed * math.pow(Config.upgrade_multiplier, level)
    item.stack_size = zero_item.stack_size * math.pow(Config.upgrade_multiplier, level)
end

add_item_all_levels("gun", "artillery-wagon-cannon", "artillery-wagon-cannon-", artillery_wagon_cannon_item_updater)
