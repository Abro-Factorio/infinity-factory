local EXAMPLE_TYPE = "assembling-machine"
local EXAMPLE_NAME = "assembling-machine-3"
local PREFIX_NAME = "assembling-machine-"

add_prev_object_with_upgrade(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME)

for i = 1, Config.additional_levels do 
    local object = create_build_with_level(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, i)
    local item = create_item_with_level(EXAMPLE_NAME, PREFIX_NAME, i)
    local recipe = create_recipe_with_level(EXAMPLE_NAME, PREFIX_NAME, i)

    data:extend({
        object,
        item,
        recipe
    })
end