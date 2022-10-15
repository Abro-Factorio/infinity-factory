local EXAMPLE_TYPE = "pipe-to-ground"
local EXAMPLE_NAME = "pipe-to-ground"
local PREFIX_NAME = "pipe-to-ground-"

local function get_array_with_underground_distance(arr)
    for i = 1, #arr do
        if arr[i].max_underground_distance ~= nil then
            return arr[i]
        end
    end

    error("Not found max_underground_distance in: " .. serializeTable(arr))
end

local function object_updater(zero_object, level, object)
    local zero_object_height = 1
    if (zero_object.fluid_box.height ~= nil) then
        zero_object_height = zero_object.fluid_box.height
    end
    object.fluid_box.height = zero_object_height * math.pow(Config.upgrade_multiplier, level)

    local zero_max_underground_distance = get_array_with_underground_distance(zero_object.fluid_box.pipe_connections).max_underground_distance
    get_array_with_underground_distance(object.fluid_box.pipe_connections).max_underground_distance = 
        math.min(zero_max_underground_distance * math.pow(Config.upgrade_multiplier, level), Consts.MAX_UNDERGROUND_PIPE_DISTANCE) --TODO linear grow
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)