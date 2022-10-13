local EXAMPLE_TYPE = "underground-belt"
local EXAMPLE_NAME = "express-underground-belt"
local PREFIX_NAME = "underground-belt-"

local function object_updater(zero_object, level, object)
    object.speed = math.min(zero_object.speed * math.pow(Config.upgrade_multiplier, level), Consts.BELT_MAX_SPEED)
    object.max_distance = math.min(zero_object.max_distance * math.pow(Config.upgrade_multiplier, level), Consts.MAX_UNDERGROUND_BELT_DISTANCE) -- TODO linear grow
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)