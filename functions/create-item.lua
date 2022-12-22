function create_item_with_level(exmaple_type, exmaple_name, prefix_name, level)
    return create_item_with_level(exmaple_type, exmaple_name, prefix_name, level, Consts.EMPTY_FUNCTION)
end

function create_item_with_level(exmaple_type, exmaple_name, prefix_name, level, item_updater)
    validate_level(level)
    local new_name = get_name_by_level(prefix_name, level)
    local zero_item = data.raw[exmaple_type][exmaple_name]

    local item = util.table.deepcopy(zero_item)
    item.name = new_name
    item.order = zero_item.order --TODO настроить порядок, чтобы в списке рецептов Т10 шёл после Т9, а не после Т1. Буква всегда одна, но может быть 2 квадратные скобки

    item_updater(zero_item, level, item)
    return item
end