local EXAMPLE_TYPE = "reactor"
local EXAMPLE_NAME = "nuclear-reactor"
local PREFIX_NAME = "nuclear-reactor-"

local function object_updater(zero_object, level, object)
    object.consumption = change_energy_pow_upgrade(zero_object.consumption, level)
    object.neighbour_bonus = zero_object.neighbour_bonus * math.pow(Config.upgrade_multiplier, level)
    object.heat_buffer.max_temperature = zero_object.heat_buffer.max_temperature * math.pow(Config.upgrade_multiplier, level)
    object.heat_buffer.specific_heat = change_energy_pow_upgrade(zero_object.heat_buffer.specific_heat, level)
    object.heat_buffer.max_transfer = change_energy_pow_upgrade(zero_object.heat_buffer.max_transfer, level)
    object.heat_buffer.minimum_glow_temperature = zero_object.heat_buffer.minimum_glow_temperature * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)