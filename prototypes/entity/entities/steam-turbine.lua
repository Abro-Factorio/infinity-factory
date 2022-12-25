local EXAMPLE_TYPE = "generator"
local EXAMPLE_NAME = "steam-turbine"
local PREFIX_NAME = "steam-turbine-"

local function object_updater(zero_object, level, object)
    object.fluid_usage_per_tick = zero_object.fluid_usage_per_tick * math.pow(Config.upgrade_multiplier, level)

    local zero_object_height = 1
    if (zero_object.fluid_box.height ~= nil) then
        zero_object_height = zero_object.fluid_box.height
    end
    object.fluid_box.height = zero_object_height * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)