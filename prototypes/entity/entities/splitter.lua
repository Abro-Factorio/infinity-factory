local EXAMPLE_TYPE = "splitter"
local EXAMPLE_NAME = "express-splitter"
local PREFIX_NAME = "splitter-"

local function object_updater(zero_object, level, object)
    object.speed = math.min(zero_object.speed * math.pow(Config.upgrade_multiplier, level), Consts.BELT_MAX_SPEED)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)