function add_data_all_levels(exmaple_type, exmaple_name, prefix_name)
    add_data_all_levels(exmaple_type, exmaple_name, prefix_name, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)
end

function add_data_all_levels(exmaple_type, exmaple_name, prefix_name, object_updater, item_updater, recipe_updater)
    add_zero_object_with_upgrade(exmaple_type, exmaple_name, prefix_name)

    for level = 1, Config.additional_levels do 
        add_data_with_level(exmaple_type, exmaple_name, prefix_name, level, object_updater, item_updater, recipe_updater)
    end
end

function add_zero_object_with_upgrade(exmaple_type, exmaple_name, prefix_name)
    data:extend({
        create_zero_object_with_upgrade(exmaple_type, exmaple_name, prefix_name)
    })
end


function add_data_with_level(exmaple_type, exmaple_name, prefix_name, level)
    add_data_with_level(exmaple_type, exmaple_name, prefix_name, level, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)
end

function add_data_with_level(exmaple_type, exmaple_name, prefix_name, level, object_updater, item_updater, recipe_updater)
    local object = create_object_with_level(exmaple_type, exmaple_name, prefix_name, level, object_updater)
    local item = create_item_with_level(exmaple_name, prefix_name, level, item_updater)
    local recipe = create_recipe_with_level(exmaple_name, prefix_name, level, recipe_updater)

    -- log("ADD_DATA: " .. exmaple_name .. " -- LEVEL = " .. level .. "\n" .. serializeTable(object) .. serializeTable(item) .. serializeTable(recipe)) --TODO
    
    data:extend({
        object,
        item,
        recipe
    })
end