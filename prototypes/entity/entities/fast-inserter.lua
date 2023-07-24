local EXAMPLE_TYPE = "inserter"
local EXAMPLE_NAME = "fast-inserter"
local PREFIX_NAME = "fast-inserter-"

local function object_updater(zero_object, level, object)
    object.energy_per_movement = change_energy_pow_upgrade(zero_object.energy_per_movement, level)
    object.energy_per_rotation = change_energy_pow_upgrade(zero_object.energy_per_rotation, level)
    object.rotation_speed = zero_object.rotation_speed * math.pow(Config.upgrade_multiplier, level)
    object.extension_speed = zero_object.extension_speed * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)