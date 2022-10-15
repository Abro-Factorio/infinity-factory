local EXAMPLE_TYPE = "pipe"
local EXAMPLE_NAME = "pipe"
local PREFIX_NAME = "pipe-"

local function object_updater(zero_object, level, object)
    local zero_object_height = 1
    if (zero_object.fluid_box.height ~= nil) then
        zero_object_height = zero_object.fluid_box.height
    end
    object.fluid_box.height = zero_object_height * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)