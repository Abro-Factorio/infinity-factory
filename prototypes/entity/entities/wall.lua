local EXAMPLE_TYPE = "wall"
local EXAMPLE_NAME = "stone-wall"
local PREFIX_NAME = "wall-"

local function object_updater(zero_object, level, object)
    object.repair_speed_modifier = zero_object.repair_speed_modifier * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)