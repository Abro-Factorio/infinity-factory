local EXAMPLE_TYPE = "item"
local EXAMPLE_NAME = "rocket-fuel"
local PREFIX_NAME = "rocket-fuel-"

local function item_updater(zero_item, level, item)
    item.fuel_value = change_energy_pow_upgrade(zero_item.fuel_value, level)
    item.fuel_acceleration_multiplier = zero_item.fuel_acceleration_multiplier * math.pow(Config.upgrade_multiplier, level)
    item.fuel_top_speed_multiplier = zero_item.fuel_top_speed_multiplier * math.pow(Config.upgrade_multiplier, level)
    item.stack_size = zero_item.stack_size * math.pow(Config.upgrade_multiplier, level)
end

add_item_and_recipe_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, item_updater, Consts.EMPTY_FUNCTION)