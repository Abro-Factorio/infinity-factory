local EXAMPLE_TYPE = "capsule"
local EXAMPLE_NAME = "grenade"
local PREFIX_NAME = "grenade-"

local function item_updater(zero_item, level, item)
    item.capsule_action.attack_parameters.cooldown = zero_item.capsule_action.attack_parameters.cooldown / math.pow(Config.upgrade_multiplier, level)
    item.capsule_action.attack_parameters.range = zero_item.capsule_action.attack_parameters.range * math.pow(Config.upgrade_multiplier, level)
    item.capsule_action.attack_parameters.projectile_creation_distance = zero_item.capsule_action.attack_parameters.projectile_creation_distance * math.pow(Config.upgrade_multiplier, level)
    item.stack_size = zero_item.stack_size * math.pow(Config.upgrade_multiplier, level)

    for i,element in pairs(item.capsule_action.attack_parameters.ammo_type.action) do
        if element.type == "direct" and element.action_delivery ~= nil and element.action_delivery.type == "projectile" then
            element.action_delivery.projectile = get_name_by_level("grenade-", level)
            element.action_delivery.starting_speed = element.action_delivery.starting_speed * math.pow(Config.upgrade_multiplier, level)
        end
    end

end

add_item_and_recipe_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, item_updater, Consts.EMPTY_FUNCTION)

local function grenade_projectile_item_updater(zero_item, level, item)
    local item_area_action = get_from_array_by_type(item.action, "area")
    local zero_item_area_action = get_from_array_by_type(zero_item.action, "area")
    get_from_array_by_type(item_area_action.action_delivery.target_effects, "damage").damage.amount =
        get_from_array_by_type(zero_item_area_action.action_delivery.target_effects, "damage").damage.amount * math.pow(Config.upgrade_multiplier, level)
    item_area_action.radius = zero_item_area_action.radius * math.pow(Config.upgrade_multiplier, level)

    local item_direct_action = get_from_array_by_type(item.action, "direct")
    local zero_item_direct_action = get_from_array_by_type(zero_item.action, "direct")
    get_from_array_by_type(item_direct_action.action_delivery.target_effects, "destroy-decoratives").radius =
        get_from_array_by_type(zero_item_direct_action.action_delivery.target_effects, "destroy-decoratives").radius * math.pow(Config.upgrade_multiplier, level)
end

add_item_all_levels("projectile", "grenade", "grenade-", grenade_projectile_item_updater)
