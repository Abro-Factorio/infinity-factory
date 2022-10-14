local UNIT_TYPE = "unit"
local SPAWNER_TYPE = "unit-spawner"
local BITER_PREFIX = "biter-"
local SPITTER_PREFIX = "spitter-"

-- Begemoth biter stats

local BITER_ATTACK = 90

local function create_unit(name, type, level, scale, tint1, tint2)
    local coefficient = Config.biter_upgrade_multiplier * level
    local unit
    if(type == "biter") then
        unit = util.table.deepcopy(data.raw["unit"]["behemoth-biter"])
        unit.run_animation = biterrunanimation(scale, tint1, tint2)

        unit.attack_parameters.range = unit.attack_parameters.range + level * 0.5
        unit.attack_parameters.ammo_type = make_unit_melee_ammo_type(BITER_ATTACK * coefficient)
        unit.attack_parameters.animation = biterattackanimation(scale, tint1, tint2)
    elseif(type == "spitter") then
        unit = util.table.deepcopy(data.raw["unit"]["behemoth-spitter"])
        unit.run_animation = spitterrunanimation(scale, tint1, tint2)

        unit.attack_parameters.range = unit.attack_parameters.range + level
        
        unit.attack_parameters.animation = spitterrunanimation(scale, tint1, tint2)
    end

    unit.name = name
    unit.max_health = unit.max_health * coefficient
    for i = 1, #unit.resistances do
        if(unit.resistances[i].decrease ~= nil) then
            unit.resistances[i].decrease = unit.resistances[i].decrease * coefficient
        end
        if(unit.resistances[i].percent ~= nil) then
            unit.resistances[i].percent = unit.resistances[i].percent + ((100 - unit.resistances[i].percent) * (coefficient - 1) / coefficient)
        end
    end

    unit.attack_parameters.cooldown =  unit.attack_parameters.cooldown * 60 / (unit.attack_parameters.cooldown * level + 60)
    
    unit.healing_per_tick = unit.healing_per_tick * coefficient
    -- TODO spawning_time_modifier = 12
    
    -- TODO
    local collision_edge = unit.collision_box[2][1] + level * 0.125
    unit.collision_box = {{-collision_edge, -collision_edge}, 
                           {collision_edge, collision_edge}}

    local selection_x0 = unit.selection_box[1][1] - level * 0.1
    local selection_y0 = unit.selection_box[1][2] - level * 0.26
    local selection_x1 = unit.selection_box[2][1] + level * 0.025
    local selection_y1 = unit.selection_box[2][2] + level * 0.065

    unit.selection_box = {{selection_x0, selection_y0}, {selection_x1, selection_y1}}

    -- TODO what? sticker_box = {{-0.6, -0.8}, {0.6, 0}}
    
    unit.vision_distance = unit.vision_distance + coefficient

    local speed_coefficient = Config.biter_speed_coefficient / 216
    local speed_max = Config.biter_speed_max / 216

    unit.movement_speed = math.max(unit.movement_speed + level * speed_coefficient, 0.01)
    unit.movement_speed = math.min(unit.movement_speed, speed_max)
    
    unit.distance_per_frame = math.max(unit.distance_per_frame + level * speed_coefficient, 0.03)
    unit.distance_per_frame = math.min(unit.distance_per_frame, speed_max + 0.02)

    unit.pollution_to_join_attack = unit.pollution_to_join_attack * coefficient/2
    unit.corpse = name .. "-corpse"

    return unit
end

for i = 1, Config.additional_levels do 
    local biter_name = get_name_by_level(BITER_PREFIX, i)
    local spitter_name = get_name_by_level(SPITTER_PREFIX, i)
    
    local k = (i)/(Config.additional_levels)
    
    local k_r = k * (1 - behemoth_biter_tint2.r)
    local k_g = k * (behemoth_biter_tint2.g - 0.1)
    local k_b = k * (behemoth_biter_tint2.b - 0.1)

    local indexed_biter_scale = behemoth_biter_scale + 0.25 * i
    local indexed_biter_tint1 = {r = 0.1, g = 0.1, b = 0.1, a = 1}
    -- local indexed_biter_tint2 = {r = math.sqrt(0 + k), g = math.sqrt(1 - k), b = 0.1, a = 1}

    local indexed_biter_tint2 = {
        g = behemoth_biter_tint2.g - k_g, 
        b = behemoth_biter_tint2.b - k_b, 
        r = behemoth_biter_tint2.r + k_r, 
        a = 1}

    data:extend({
        create_unit(biter_name, "biter", i, indexed_biter_scale, indexed_biter_tint1, indexed_biter_tint2),
        add_biter_die_animation(indexed_biter_scale, indexed_biter_tint1, indexed_biter_tint2,
        {
            type = "corpse",
            name = biter_name .. "-corpse",
            icon = "__base__/graphics/icons/big-biter-corpse.png",
            icon_size = 64, icon_mipmaps = 4,
            selectable_in_game = false,
            selection_box = {{-1, -1}, {1, 1}},
            subgroup = "corpses",
            order = "c[corpse]-a[biter]-c[big]",
            flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
        }),
        create_unit(spitter_name, "spitter", i, indexed_biter_scale, indexed_biter_tint1, indexed_biter_tint2),
        add_spitter_die_animation(indexed_biter_scale, indexed_biter_tint1, indexed_biter_tint2,
        {
            type = "corpse",
            name = spitter_name .. "-corpse",
            icon = "__base__/graphics/icons/big-biter-corpse.png",
            icon_size = 64, icon_mipmaps = 4,
            selectable_in_game = false,
            selection_box = {{-1, -1}, {1, 1}},
            subgroup = "corpses",
            order = "c[corpse]-b[spitter]-a[small]",
            flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
        })
    })

    local biter_spawner = data.raw["unit-spawner"]["biter-spawner"]
    local unit = biter_spawner["result_units"]
    unit[#unit+1] = {biter_name, {{0.0, 0.3}, {0.6, 0.0}}}

    local spitter_spawner = data.raw["unit-spawner"]["spitter-spawner"]
    unit = spitter_spawner["result_units"]
    unit[#unit+1] = {spitter_name, {{0.0, 0.3}, {0.6, 0.0}}}
end
