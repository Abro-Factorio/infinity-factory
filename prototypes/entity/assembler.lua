local EXAMPLE_TYPE = "assembling-machine"
local EXAMPLE_NAME = "assembling-machine-3"
local PREFIX_NAME = "assembling-machine-"

local prev_object = util.table.deepcopy(data.raw[EXAMPLE_TYPE][EXAMPLE_NAME])
prev_object.next_upgrade = get_name_by_level(PREFIX_NAME, 1)
data:extend({
    prev_object
})

for i = 1, Config.additional_levels do 
    local new_name = get_name_by_level(PREFIX_NAME, i)
    local object = create_build_with_level(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, i)

    local item = {
        type = "item",
        name = new_name,
        icon = "__base__/graphics/icons/assembling-machine-3.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "production-machine",
        order = "c[" .. new_name.. "]", --TODO настроить порядок, чтобы в списке рецептов Т10 шёл после Т9, а не после Т1.
        place_result = new_name,
        stack_size = 50
    }

    local recipe = {
        type = "recipe",
        name = new_name,
        energy_required = 0.5 * math.pow(Config.cost_multiplier, i), -- TODO can be nil? default = 0.5 
        enabled = true, -- TODO false // table.insert(data.raw["technology"]["advanced-material-processing"].effects,{type = "unlock-recipe",recipe = "assembling-machine-T1"})
        ingredients = {
            {"speed-module", math.min(4 * math.pow(Config.cost_multiplier, i), Consts.MAX_COST_ITEM_COUNT)}, -- TODO что делаем с лимитом стоимости?
            {"assembling-machine-2", math.min(2 * math.pow(Config.cost_multiplier, i), Consts.MAX_COST_ITEM_COUNT)}
        },
        result = new_name
    }

    data:extend({
        object,
        item,
        recipe
    })
end