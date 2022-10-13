local UNIT_TYPE = "unit"
local SPAWNER_TYPE = "unit-spawner"
local BITER_PREFIX = "biter-"
local SPITTER_PREFIX = "spitter-"

-- Begemoth biter stats

local BITER_ATTACK = 90

local function create_biter(biter_name, level, scale, tint1, tint2)
    local biter = util.table.deepcopy(data.raw["unit"]["behemoth-biter"])
    local coefficient = Config.upgrade_multiplier * level
    biter.name = biter_name
    biter.max_health = biter.max_health * coefficient
    for i = 1, #biter.resistances do
        biter.resistances[i].decrease = biter.resistances[i].decrease * coefficient
        biter.resistances[i].percent = biter.resistances[i].percent * coefficient
    end
    biter.healing_per_tick = biter.healing_per_tick * coefficient
    -- TODO spawning_time_modifier = 12
    
    -- TODO
    local collision_edge = biter.collision_box[2][1] + level * 0.1
    biter.collision_box = {{-collision_edge, -collision_edge}, 
                           {collision_edge, collision_edge}}

    local selection_x0 = biter.selection_box[1][1] - level * 0.1
    local selection_y0 = biter.selection_box[1][2] - level * 0.26
    local selection_x1 = biter.selection_box[2][1] + level * 0.1
    local selection_y1 = biter.selection_box[2][2] + level * 0.26

    biter.selection_box = {{selection_x0, selection_y0}, {selection_x1, selection_y1}}

    -- TODO what? sticker_box = {{-0.6, -0.8}, {0.6, 0}}
    

    biter.attack_parameters.range = biter.attack_parameters.range + level * 0.5
    biter.attack_parameters.ammo_type = make_unit_melee_ammo_type(BITER_ATTACK * coefficient)
    biter.attack_parameters.cooldown = 1
    biter.attack_parameters.animation = biterattackanimation(scale, tint1, tint2)
    
    biter.movement_speed = biter.movement_speed + 0.7 * level
    biter.distance_per_frame = biter.distance_per_frame + 0.2 * level

    biter.pollution_to_join_attack = biter.pollution_to_join_attack * coefficient/2
    biter.corpse = biter_name .. "-corpse"
    biter.run_animation = biterrunanimation(scale, tint1, tint2)

    return biter
end

for i = 1, Config.additional_levels do 
    local biter_name = get_name_by_level(BITER_PREFIX, i)
    
    local k = i/Config.additional_levels

    local indexed_biter_scale = 1.2 + 0.25 * i
    local indexed_biter_tint1 = {r = 1 - k, g = 1 - k, b = 1 - k, a = 1}
    local indexed_biter_tint2 = {r = 1 - k, g = 1 - k, b = 1 - k, a = 1}

    local biter = create_biter(biter_name, i, indexed_biter_scale, indexed_biter_tint1, indexed_biter_tint2)

    data:extend({
        biter,
        add_biter_die_animation(indexed_biter_scale, indexed_biter_tint1, indexed_biter_tint2,
        {
            type = "corpse",
            name = biter_name .. "-corpse",
            icon = "__base__/graphics/icons/big-biter-corpse.png",
            icon_size = 64, icon_mipmaps = 4,
            selectable_in_game = false,
            selection_box = {{-1, -1}, {1, 1}},
            subgroup="corpses",
            order = "c[corpse]-a[biter]-c[big]",
            flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
        })
    })

    
    local biter_spawner = data.raw["unit-spawner"]["biter-spawner"]
    local unit = biter_spawner["result_units"]
    unit[#unit+1] = {biter_name, {{0.0, 0.3}, {0.6, 0.0}}}
end
