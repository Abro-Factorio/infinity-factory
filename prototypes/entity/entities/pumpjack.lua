local EXAMPLE_TYPE = "mining-drill"
local EXAMPLE_NAME = "pumpjack"
local PREFIX_NAME = "pumpjack-"

local function object_updater(zero_object, level, object)
    object.mining_speed = zero_object.mining_speed * math.pow(Config.upgrade_multiplier, level)
    object.resource_searching_radius = zero_object.resource_searching_radius * math.pow(Config.upgrade_multiplier, level)

    local zero_object_height = 1
    if (zero_object.output_fluid_box.height ~= nil) then
        zero_object_height = zero_object.output_fluid_box.height
    end
    object.output_fluid_box.height = zero_object_height * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)