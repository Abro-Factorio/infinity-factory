local EXAMPLE_TYPE = "beacon"
local EXAMPLE_NAME = "beacon"
local PREFIX_NAME = "beacon-"

local function object_updater(zero_object, level, object)
    object.supply_area_distance = math.min(zero_object.supply_area_distance * math.pow(Config.upgrade_multiplier, level), Consts.MAX_SUPPLY_DISTANCE)
    object.distribution_effectivity = zero_object.distribution_effectivity * math.pow(Config.upgrade_multiplier, level) --TODO grow to 1
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)