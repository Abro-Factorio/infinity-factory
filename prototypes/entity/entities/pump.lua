local EXAMPLE_TYPE = "pump"
local EXAMPLE_NAME = "pump"
local PREFIX_NAME = "pump-"

local function object_updater(zero_object, level, object)
    object.fluid_box.base_area = zero_object.fluid_box.base_area * math.pow(Config.upgrade_multiplier, level)
    object.fluid_box.height = zero_object.fluid_box.height * math.pow(Config.upgrade_multiplier, level)
    object.pumping_speed = zero_object.pumping_speed * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)