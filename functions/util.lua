function get_name_by_level(prefix, level)
    validate_level(level)
    if level < Config.additional_levels then
        return prefix .. "T" .. level
    else
        return prefix .. "exp"
    end
end

function get_prev_name_by_level(prefix_name, level, exmaple_name)
    validate_level(level)
    if level > 1 then
        return get_name_by_level(prefix_name, level - 1)
    else
        return exmaple_name
    end
end

function validate_level(level)
    if level <= 0 or level > Config.additional_levels then
        error("Unexpected value: level must be in [1;" .. Config.additional_levels .. "] but level = " .. level)
    end
end

function change_energy(energy, change_function)
    return change_function(get_number_from_enegry(energy)) .. get_unit_from_enegry(energy)
end

function change_energy_pow_upgrade(energy, level)
    return change_energy(energy, function(x) return x * math.pow(Config.upgrade_multiplier, level) end)
end

function get_number_from_enegry(energy)
    return tonumber(string.sub(energy, 0, -3))
end

function get_unit_from_enegry(energy)
    return string.sub(energy, -2, -1)
end

function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0
    local tmp = string.rep(" ", depth)
    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")
        for k, v in pairs(val) do
            tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end
        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
    end

    return tmp
end

function get_from_array(arr, type_key, type_value)
    for i,element in pairs(arr) do
        if element[type_key] == type_value then 
            return element
        end
    end
    return nil
end

function get_from_array_by_type(arr, type_value)
    return get_from_array(arr, "type", type_value)
end