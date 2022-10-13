local EXAMPLE_TYPE = "lab"
local EXAMPLE_NAME = "lab"
local PREFIX_NAME = "lab-"

local function object_updater(zero_object, level, object)
    object.researching_speed = zero_object.researching_speed * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)