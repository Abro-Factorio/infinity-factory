local EXAMPLE_TYPE = "logistic-container"
local EXAMPLE_NAME = "logistic-chest-requester"
local PREFIX_NAME = "logistic-chest-requester-"

local function object_updater(zero_object, level, object)
    object.inventory_size = zero_object.inventory_size * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)