local EXAMPLE_TYPE = "radar"
local EXAMPLE_NAME = "radar"
local PREFIX_NAME = "radar-"

local function object_updater(zero_object, level, object)
    object.max_distance_of_sector_revealed = zero_object.max_distance_of_sector_revealed * math.pow(Config.upgrade_multiplier, level)
    object.max_distance_of_nearby_sector_revealed = zero_object.max_distance_of_nearby_sector_revealed * math.pow(Config.upgrade_multiplier, level)
    object.rotation_speed = zero_object.rotation_speed * math.pow(Config.upgrade_multiplier, level) -- TODO max speed
    -- TODO Linear grow?
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)