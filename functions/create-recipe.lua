local calculate_energy_required
local calculate_ingredients

function create_recipe_with_level(example_name, prefix_name, recipe_name, level, recipe_updater)
    validate_level(level)
    local new_name = get_name_by_level(prefix_name, level)
    local zero_recipe = data.raw["recipe"][recipe_name]
    local prev_name = get_prev_name_by_level(prefix_name, level, example_name)

    local recipe = {}
    recipe.type = "recipe"
    recipe.name = new_name
    recipe.energy_required = calculate_energy_required(zero_recipe, level)

    if (zero_recipe.normal == nil and zero_recipe.expensive == nil) then
        set_recipe_common_data(recipe, prev_name, new_name, false)
    end

    if (zero_recipe.normal ~= nil) then
        recipe.normal = {}
        set_recipe_common_data(recipe.normal, prev_name, new_name, false)
    end

    if (zero_recipe.expensive ~= nil) then
        recipe.expensive = {}
        set_recipe_common_data(recipe.expensive, prev_name, new_name, true)
    end

    recipe_updater(zero_recipe, level, recipe)
    return recipe
end

function calculate_energy_required(zero_recipe, level)
    local zero_recipe_energy_required = 0.5
    if (zero_recipe.energy_required ~= nil) then
        zero_recipe_energy_required = zero_recipe.energy_required
    end

    return zero_recipe_energy_required * math.pow(Config.cost_multiplier, level)
end

function calculate_ingredients(prev_name, expensive)
    local cost_multiplier = Config.cost_multiplier
    if expensive then
        cost_multiplier = Config.cost_expensive_multiplier
    end
    
    return {
        {prev_name, cost_multiplier}
    }
end

function set_recipe_common_data(recipe, prev_name, new_name, expensive)
    recipe.enabled = true -- TODO false // table.insert(data.raw["technology"]["advanced-material-processing"].effects,{type = "unlock-recipe",recipe = "assembling-machine-T1"})
    recipe.ingredients = calculate_ingredients(prev_name, expensive)
    recipe.result = new_name
end
