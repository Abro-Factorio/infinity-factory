local EXAMPLE_TYPE = "rocket-silo"
local EXAMPLE_NAME = "rocket-silo"
local PREFIX_NAME = "rocket-silo-"

local function object_updater(zero_object, level, object)
    object.crafting_speed = zero_object.crafting_speed * math.pow(Config.upgrade_multiplier, level)

    object.idle_energy_usage = change_energy_pow_upgrade(zero_object.idle_energy_usage, level)
    object.lamp_energy_usage = change_energy_pow_upgrade(zero_object.lamp_energy_usage, level)
    object.active_energy_usage = change_energy_pow_upgrade(zero_object.active_energy_usage, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)