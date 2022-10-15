local EXAMPLE_TYPE = "assembling-machine"
local EXAMPLE_NAME = "chemical-plant"
local PREFIX_NAME = "chemical-plant-"

local function object_updater(zero_object, level, object)
    object.crafting_speed = zero_object.crafting_speed * math.pow(Config.upgrade_multiplier, level)
    -- TODO fluid_boxes.height to output ?
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)