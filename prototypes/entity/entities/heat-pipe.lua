local EXAMPLE_TYPE = "heat-pipe"
local EXAMPLE_NAME = "heat-pipe"
local PREFIX_NAME = "heat-pipe-"

local function object_updater(zero_object, level, object)
    object.heat_buffer.max_temperature = zero_object.heat_buffer.max_temperature * math.pow(Config.upgrade_multiplier, level)
    object.heat_buffer.specific_heat = change_energy_pow_upgrade(zero_object.heat_buffer.specific_heat, level)
    object.heat_buffer.max_transfer = change_energy_pow_upgrade(zero_object.heat_buffer.max_transfer, level)
    object.heat_buffer.minimum_glow_temperature = zero_object.heat_buffer.minimum_glow_temperature * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)