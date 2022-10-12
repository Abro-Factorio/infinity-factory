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