local EXAMPLE_TYPE = "storage-tank"
local EXAMPLE_NAME = "storage-tank"
local PREFIX_NAME = "storage-tank-"

local function object_updater(zero_object, level, object)
    local zero_object_height = 1
    if (zero_object.fluid_box.height ~= nil) then
        zero_object_height = zero_object.fluid_box.height
    end
    object.fluid_box.height = zero_object_height * math.pow(Config.upgrade_multiplier, level)
    
    --TODO What is it? object.flow_length_in_ticks = zero_object.flow_length_in_ticks * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)