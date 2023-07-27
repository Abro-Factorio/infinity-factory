local EXAMPLE_TYPE = "boiler"
local EXAMPLE_NAME = "heat-exchanger"
local PREFIX_NAME = "heat-exchanger-"

local function object_updater(zero_object, level, object)
    object.energy_consumption = change_energy_pow_upgrade(zero_object.energy_consumption, level)

    local zero_object_height = 1
    if (zero_object.fluid_box.height ~= nil) then
        zero_object_height = zero_object.fluid_box.height
    end
    object.fluid_box.height = zero_object_height * math.pow(Config.upgrade_multiplier, level)

    local zero_object_output_height = 1
    if (zero_object.output_fluid_box.height ~= nil) then
        zero_object_output_height = zero_object.output_fluid_box.height
    end
    object.output_fluid_box.height = zero_object_output_height * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)