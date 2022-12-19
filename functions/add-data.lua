function add_data_all_levels(example_type, example_name, prefix_name, object_updater, item_updater, recipe_updater)
    add_zero_object_with_upgrade(example_type, example_name, prefix_name)

    for level = 1, Config.additional_levels do 
        add_data_with_level(example_type, example_name, prefix_name, level, object_updater, item_updater, recipe_updater)
    end
end

function add_zero_object_with_upgrade(example_type, example_name, prefix_name)
    data:extend({
        create_zero_object_with_upgrade(example_type, example_name, prefix_name)
    })
end

function add_data_with_level(example_type, example_name, prefix_name, level, object_updater, item_updater, recipe_updater)
    local object = create_object_with_level(example_type, example_name, prefix_name, level, object_updater)

    local item
    if data.raw["item"][example_name] ~= nil then
        item = create_item_with_level("item", example_name, prefix_name, level, item_updater)
    elseif data.raw["item-with-entity-data"][example_name] ~= nil then
        item = create_item_with_level("item-with-entity-data", example_name, prefix_name, level, item_updater)
    else
        error("Unexpected item type: ".. example_name)
    end
    item.place_result = object.name

    local recipe = create_recipe_with_level(example_name, prefix_name, example_name, level, recipe_updater)

    -- log("ADD_DATA: " .. example_name .. " -- LEVEL = " .. level .. "\n" .. serializeTable(object) .. serializeTable(item) .. serializeTable(recipe)) --TODO

    data:extend({
        object,
        item,
        recipe
    })
end

function add_item_all_levels(example_type, example_name, prefix_name, item_updater)
    for level = 1, Config.additional_levels do
        local item = create_item_with_level(example_type, example_name, prefix_name, level, item_updater)

        data:extend({
            item
        })
    end
end

function add_recipe_all_levels(example_name, prefix_name, recipe_name, recipe_updater)
    for level = 1, Config.additional_levels do
        local recipe = create_recipe_with_level(example_name, prefix_name, recipe_name, level, recipe_updater)

        data:extend({
            recipe
        })
    end
end

function add_item_and_recipe_all_levels(example_type, example_name, prefix_name, item_updater, recipe_updater)
    for level = 1, Config.additional_levels do
        local item = create_item_with_level(example_type, example_name, prefix_name, level, item_updater)
        local recipe = create_recipe_with_level(example_name, prefix_name, example_name, level, recipe_updater)

        data:extend({
            item,
            recipe
        })
    end
end