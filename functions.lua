function create_builds(level)
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

function get_name_by_level(prefix, level)
    validate_level(level)
    if level == Config.additional_levels then
        return prefix .. "exp"
    else
        return prefix .. "T" .. level
    end
end

function validate_level(level)
    if level <= 0 or level > Config.additional_levels then
        error("Unexpected value: level must be in [1;" .. Config.additional_levels .. "] but level = " .. level)
    end
end

function get_number_from_enegry(energy)
    return tonumber(string.sub(energy, 0, -3))
end

function get_unit_from_enegry(energy)
    return string.sub(energy, -2, -1)
end