local EXAMPLE_TYPE = "land-mine"
local EXAMPLE_NAME = "land-mine"
local PREFIX_NAME = "land-mine-"

local function object_updater(zero_object, level, object)
    object.trigger_radius = zero_object.trigger_radius * math.pow(Config.upgrade_multiplier, level) --TODO linear grow ?

    local object_source_effects = object.action.action_delivery.source_effects
    local zero_object_source_effects = zero_object.action.action_delivery.source_effects
    get_from_array_by_type(object_source_effects, "nested-result").action.radius =
        get_from_array_by_type(zero_object_source_effects, "nested-result").action.radius * math.pow(Config.upgrade_multiplier, level) --TODO add effect grow? 6k on T10 now

    local object_target_effects = get_from_array_by_type(object_source_effects, "nested-result").action.action_delivery.target_effects
    local zero_object_target_effects = get_from_array_by_type(zero_object_source_effects, "nested-result").action.action_delivery.target_effects
    get_from_array_by_type(object_target_effects, "damage").damage.amount =
        get_from_array_by_type(zero_object_target_effects, "damage").damage.amount * math.pow(Config.upgrade_multiplier, level)
        
    get_from_array_by_type(object_source_effects, "damage").damage.amount =
        get_from_array_by_type(zero_object_source_effects, "damage").damage.amount * math.pow(Config.upgrade_multiplier, level)
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)