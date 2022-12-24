local EXAMPLE_TYPE = "car"
local EXAMPLE_NAME = "car"
local PREFIX_NAME = "car-"

local function object_updater(zero_object, level, object)
    object.effectivity = zero_object.effectivity * math.pow(Config.upgrade_multiplier, level)
    object.braking_power = change_energy_pow_upgrade(zero_object.braking_power, level)
    object.consumption = change_energy_pow_upgrade(zero_object.consumption, level)
    object.friction = math.min(zero_object.friction * math.pow(Config.upgrade_multiplier, level), Consts.MAX_FRICTION)
    object.inventory_size = zero_object.inventory_size * math.pow(Config.upgrade_multiplier, level)
    object.guns = {
        get_name_by_level("vehicle-machine-gun-", level)
    }
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)

local function vehicle_machine_gun_item_updater(zero_item, level, item)
    item.attack_parameters.cooldown = zero_item.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.movement_slow_down_factor = math.min(zero_item.attack_parameters.movement_slow_down_factor * math.pow(Config.upgrade_multiplier, level), Consts.MAX_MOVEMENT_SLOW_DOWN_FACTOR)
    item.attack_parameters.range = zero_item.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
    item.attack_parameters.shell_particle.speed = zero_item.attack_parameters.shell_particle.speed * math.pow(Config.upgrade_multiplier, level)
end

add_item_all_levels("gun", "vehicle-machine-gun", "vehicle-machine-gun-", vehicle_machine_gun_item_updater)