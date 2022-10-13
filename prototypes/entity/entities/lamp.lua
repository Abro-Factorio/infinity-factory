local EXAMPLE_TYPE = "lamp"
local EXAMPLE_NAME = "small-lamp"
local PREFIX_NAME = "lamp-"

local function object_updater(zero_object, level, object)
    object.light.size = zero_object.light.size * math.pow(Config.upgrade_multiplier, level)
    object.light_when_colored.size = zero_object.light_when_colored.size * math.pow(Config.upgrade_multiplier, level)
    object.glow_size = zero_object.glow_size * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)