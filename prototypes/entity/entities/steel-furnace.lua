local EXAMPLE_TYPE = "furnace"
local EXAMPLE_NAME = "steel-furnace"
local PREFIX_NAME = "steel-furnace-"

local function object_updater(zero_object, level, object)
    object.crafting_speed = zero_object.crafting_speed * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)