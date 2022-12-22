local calculate_max_health
local calculate_next_upgrade
local set_energy_usage
local set_module_slots

function create_zero_object_with_upgrade(exmaple_type, exmaple_name, prefix_name)
    local zero_object = util.table.deepcopy(data.raw[exmaple_type][exmaple_name])
    zero_object.next_upgrade = get_name_by_level(prefix_name, 1)
    if (zero_object.fast_replaceable_group == nil) then
        zero_object.fast_replaceable_group = exmaple_name
    end

    return zero_object
end

function create_object_with_level(exmaple_type, exmaple_name, prefix_name, level)
    return create_object_with_level(exmaple_type, exmaple_name, prefix_name, level, Const.EMPTY_FUNCTION)
end

function create_object_with_level(exmaple_type, exmaple_name, prefix_name, level, object_updater)
    validate_level(level)
    local new_name = get_name_by_level(prefix_name, level)
    local zero_object = data.raw[exmaple_type][exmaple_name]

    local object = util.table.deepcopy(zero_object)
    object.type = exmaple_type
    object.name = new_name
    object.minable.result = new_name
    object.max_health = calculate_max_health(zero_object, level)
    object.next_upgrade = calculate_next_upgrade(prefix_name, level)
    set_energy_source(zero_object, level, object)
    set_energy_usage(zero_object, level, object)
    set_module_slots(zero_object, level, object)

    object_updater(zero_object, level, object)
    return object
end

function calculate_max_health(zero_object, level)
    return math.min(zero_object.max_health * math.pow(Config.upgrade_multiplier, level), Consts.MAX_HP)
end

function calculate_next_upgrade(prefix_name, level)
    if level < Config.additional_levels then
        return get_name_by_level(prefix_name, level + 1)
    else 
        return nil
    end 
end

function set_energy_source(zero_object, level, object)
    if (zero_object.energy_source ~= nil) then
        if (zero_object.energy_source.emissions_per_minute ~= nil) then
            object.energy_source.emissions_per_minute = zero_object.energy_source.emissions_per_minute * math.pow(Config.upgrade_multiplier, level)
        end
        if (zero_object.energy_source.drain ~= nil) then
            object.energy_source.drain = change_energy_pow_upgrade(zero_object.energy_source.drain, level)
        end
        if (zero_object.energy_source.buffer_capacity ~= nil) then
            object.energy_source.buffer_capacity = change_energy_pow_upgrade(zero_object.energy_source.buffer_capacity, level)
        end
        if (zero_object.energy_source.input_flow_limit ~= nil) then
            object.energy_source.input_flow_limit = change_energy_pow_upgrade(zero_object.energy_source.input_flow_limit, level)
        end
        if (zero_object.energy_source.output_flow_limit ~= nil) then
            object.energy_source.output_flow_limit = change_energy_pow_upgrade(zero_object.energy_source.output_flow_limit, level)
        end
        if (zero_object.energy_source.max_temperature ~= nil) then
            object.energy_source.max_temperature = change_energy_pow_upgrade(zero_object.energy_source.max_temperature, level)
        end
        if (zero_object.energy_source.specific_heat ~= nil) then
            object.energy_source.specific_heat = change_energy_pow_upgrade(zero_object.energy_source.specific_heat, level)
        end
        if (zero_object.energy_source.max_transfer ~= nil) then
            object.energy_source.max_transfer = change_energy_pow_upgrade(zero_object.energy_source.max_transfer, level)
        end
        if (zero_object.energy_source.min_working_temperature ~= nil) then
            object.energy_source.min_working_temperature = change_energy_pow_upgrade(zero_object.energy_source.min_working_temperature, level)
        end
        if (zero_object.energy_source.minimum_glow_temperature ~= nil) then
            object.energy_source.minimum_glow_temperature = change_energy_pow_upgrade(zero_object.energy_source.minimum_glow_temperature, level)
        end
    end
end

function set_energy_usage(zero_object, level, object)
    if (zero_object.energy_usage ~= nil) then
        object.energy_usage = change_energy_pow_upgrade(zero_object.energy_usage, level)
    end
    if (zero_object.energy_usage_per_tick ~= nil) then
        object.energy_usage_per_tick = change_energy_pow_upgrade(zero_object.energy_usage_per_tick, level)
    end
end

function set_module_slots(zero_object, level, object)
    if (zero_object.module_specification ~= nil and object.module_specification.module_slots ~= nil) then
        object.module_specification.module_slots = math.min(zero_object.module_specification.module_slots * math.pow(Config.upgrade_multiplier, level), Consts.MAX_MODULE_SLOTS)
    end
end