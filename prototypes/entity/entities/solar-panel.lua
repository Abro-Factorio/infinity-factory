local EXAMPLE_TYPE = "solar-panel"
local EXAMPLE_NAME = "solar-panel"
local PREFIX_NAME = "solar-panel-"

local function object_updater(zero_object, level, object)
    object.production = change_energy_pow_upgrade(zero_object.production, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)