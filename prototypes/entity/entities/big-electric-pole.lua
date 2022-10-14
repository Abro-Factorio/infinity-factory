local EXAMPLE_TYPE = "electric-pole"
local EXAMPLE_NAME = "big-electric-pole"
local PREFIX_NAME = "big-electric-pole-"

local function object_updater(zero_object, level, object)
    object.maximum_wire_distance = math.min(zero_object.maximum_wire_distance * math.pow(Config.upgrade_multiplier, level), Consts.MAX_WIRE_DISTANCE) --TODO limit on T2
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)