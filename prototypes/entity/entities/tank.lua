local EXAMPLE_TYPE = "car"
local EXAMPLE_NAME = "tank"
local PREFIX_NAME = "tank-"

local function object_updater(zero_object, level, object)
    object.effectivity = zero_object.effectivity * math.pow(Config.upgrade_multiplier, level)
    object.braking_power = change_energy_pow_upgrade(zero_object.braking_power, level)
    object.consumption = change_energy_pow_upgrade(zero_object.consumption, level)
    object.friction = math.min(zero_object.friction * math.pow(Config.upgrade_multiplier, level), Consts.MAX_FRICTION)
    object.turret_rotation_speed = zero_object.turret_rotation_speed * math.pow(Config.upgrade_multiplier, level)
    object.turret_return_timeout = zero_object.turret_return_timeout / math.pow(Config.upgrade_multiplier, level)
    object.inventory_size = zero_object.inventory_size * math.pow(Config.upgrade_multiplier, level)
    object.guns = {
        get_name_by_level("tank-cannon-", level),
        get_name_by_level("tank-machine-gun-", level),
        get_name_by_level("tank-flamethrower-", level)
    }
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)


local function tank_cannon_item_updater(zero_item, level, item)
    item.attack_parameters.cooldown = zero_item.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.movement_slow_down_factor = math.min(zero_item.attack_parameters.movement_slow_down_factor * math.pow(Config.upgrade_multiplier, level), Consts.MAX_MOVEMENT_SLOW_DOWN_FACTOR) --TODO default 0, must be replace, linear grow to 1
    item.attack_parameters.range = zero_item.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
end

add_item_all_levels("gun", "tank-cannon", "tank-cannon-", tank_cannon_item_updater)


local function tank_machine_gun_item_updater(zero_item, level, item)
    item.attack_parameters.cooldown = zero_item.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.movement_slow_down_factor = math.min(zero_item.attack_parameters.movement_slow_down_factor * math.pow(Config.upgrade_multiplier, level), Consts.MAX_MOVEMENT_SLOW_DOWN_FACTOR)
    item.attack_parameters.range = zero_item.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.shell_particle.speed = zero_item.attack_parameters.shell_particle.speed * math.pow(Config.upgrade_multiplier, level)
end

add_item_all_levels("gun", "tank-machine-gun", "tank-machine-gun-", tank_machine_gun_item_updater)


local function tank_flamethrower_item_updater(zero_item, level, item)
    item.attack_parameters.min_range = zero_item.attack_parameters.min_range * math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.range = zero_item.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
end

add_item_all_levels("gun", "tank-flamethrower", "tank-flamethrower-", tank_flamethrower_item_updater)
