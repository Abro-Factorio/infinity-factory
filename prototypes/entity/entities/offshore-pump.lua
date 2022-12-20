local EXAMPLE_TYPE = "offshore-pump"
local EXAMPLE_NAME = "offshore-pump"
local PREFIX_NAME = "offshore-pump-"

local function object_updater(zero_object, level, object)
    object.pumping_speed = zero_object.pumping_speed * math.pow(Config.upgrade_multiplier, level)
    object.fluid_box.base_area = zero_object.fluid_box.base_area * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)