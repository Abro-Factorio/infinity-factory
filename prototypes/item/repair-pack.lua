local EXAMPLE_TYPE = "repair-tool"
local EXAMPLE_NAME = "repair-pack"
local PREFIX_NAME = "repair-pack-"

local function item_updater(zero_item, level, item)
    item.speed = zero_item.speed * math.pow(Config.upgrade_multiplier, level)
    item.durability = zero_item.durability * math.pow(Config.upgrade_multiplier, level)
    item.stack_size = zero_item.stack_size * math.pow(Config.upgrade_multiplier, level)
end

add_item_and_recipe_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, item_updater, Consts.EMPTY_FUNCTION)