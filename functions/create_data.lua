function create_levels(level)
end

function create_build_with_level(exmaple_type, exmaple_name, prefix_name, level)
    validate_level(level)
    local new_name = get_name_by_level(prefix_name, level)
    local prev_object = data.raw[exmaple_type][exmaple_name]

    local object = util.table.deepcopy(prev_object) -- TODO вынести создание прототипа в функцию (тип, имя, ХП, энергия (при наличие!!!!!!) и т.п.)
    object.type = exmaple_type
    object.name = new_name
    object.minable.result = new_name
    object.max_health = math.min(prev_object.max_health * math.pow(Config.upgrade_multiplier, level), Consts.MAX_HP)
    object.crafting_speed = prev_object.crafting_speed * math.pow(Config.upgrade_multiplier, level)
    object.energy_source.emissions_per_minute = prev_object.energy_source.emissions_per_minute * math.pow(Config.upgrade_multiplier, level)
    object.energy_usage = get_number_from_enegry(prev_object.energy_usage) * math.pow(Config.upgrade_multiplier, level) .. get_unit_from_enegry(prev_object.energy_usage)
    object.module_specification.module_slots = math.min(prev_object.module_specification.module_slots * math.pow(Config.upgrade_multiplier, level), Consts.MAX_MODULE_SLOTS)
    if level < Config.additional_levels then
        object.next_upgrade = get_name_by_level(prefix_name, level + 1)
    else 
        object.next_upgrade = nil
    end 

    return object
end

function create_item_with_level(exmaple_name, prefix_name, level)
    validate_level(level)
    local new_name = get_name_by_level(prefix_name, level)
    local prev_item = data.raw["item"][exmaple_name]

    local item = util.table.deepcopy(prev_item)
    item.name = new_name
    item.order = prev_item.order --TODO настроить порядок, чтобы в списке рецептов Т10 шёл после Т9, а не после Т1. Буква всегда одна, но может быть 2 квадратные скобки
    item.place_result = new_name

    return item
end

function create_recipe_with_level(exmaple_name, prefix_name, level)
    validate_level(level)
    local new_name = get_name_by_level(prefix_name, level)
    local prev_recipe = data.raw["recipe"][exmaple_name] -- TODO rename: zero-level, not prev

    local recipe = util.table.deepcopy(prev_recipe)
    recipe.name = new_name
    recipe.energy_required = 0.5 * math.pow(Config.cost_multiplier, level) -- TODO can be nil? default = 0.5 
    recipe.enabled = true -- TODO false // table.insert(data.raw["technology"]["advanced-material-processing"].effects,{type = "unlock-recipe",recipe = "assembling-machine-T1"})
    recipe.ingredients = {
        {exmaple_name, Config.cost_multiplier} -- TODO prev level, not example_name
    }
    recipe.result = new_name

    return recipe
end

function create_prev_object_with_upgrade(exmaple_type, exmaple_name, prefix_name)
    local prev_object = util.table.deepcopy(data.raw[exmaple_type][exmaple_name])
    prev_object.next_upgrade = get_name_by_level(prefix_name, 1)

    return prev_object
end