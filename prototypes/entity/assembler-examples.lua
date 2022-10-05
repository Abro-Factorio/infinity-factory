
data:extend(
    {
        {
        type = "assembling-machine",
        name = "assembling-machine-1",
        icon = "__base__/graphics/icons/assembling-machine-1.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = "assembling-machine-1"},
        max_health = 300,
        corpse = "assembling-machine-1-remnants",
        dying_explosion = "assembling-machine-1-explosion",
        resistances =
        {
        {
            type = "fire",
            percent = 70
        }
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = "assembling-machine",
        next_upgrade = "assembling-machine-2",
        alert_icon_shift = util.by_pixel(-3, -12),
        animation =
        {
        layers =
        {
            {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
            priority="high",
            width = 108,
            height = 114,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            hr_version =
            {
                filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
                priority="high",
                width = 214,
                height = 226,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, 2),
                scale = 0.5
            }
            },
            {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
            priority="high",
            width = 95,
            height = 83,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5.5),
            hr_version =
            {
                filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
                priority="high",
                width = 190,
                height = 165,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                draw_as_shadow = true,
                shift = util.by_pixel(8.5, 5),
                scale = 0.5
            }
            }
        }
        },
        crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
        crafting_speed = 0.5,
        energy_source =
        {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 4
        },
        energy_usage = "75kW",
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound =
        {
        sound =
        {
            {
            filename = "__base__/sound/assembling-machine-t1-1.ogg",
            volume = 0.5
            }
        },
        audible_distance_modifier = 0.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20
        }
    },

    {
        type = "assembling-machine",
        name = "assembling-machine-3",
        icon = "__base__/graphics/icons/assembling-machine-3.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral","placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = "assembling-machine-3"},
        max_health = 400,
        corpse = "assembling-machine-3-remnants",
        dying_explosion = "assembling-machine-3-explosion",
        alert_icon_shift = util.by_pixel(-3, -12),
        resistances =
        {
        {
            type = "fire",
            percent = 70
        }
        },
        fluid_boxes =
        {
        {
            production_type = "input",
            pipe_picture = assembler3pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0, -2} }},
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            pipe_picture = assembler3pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = 1,
            pipe_connections = {{ type="output", position = {0, 2} }},
            secondary_draw_orders = { north = -1 }
        },
        off_when_no_fluid_recipe = true
        },
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound =
        {
        sound =
        {
            {
            filename = "__base__/sound/assembling-machine-t3-1.ogg",
            volume = 0.45
            }
        },
        audible_distance_modifier = 0.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        damaged_trigger_effect = hit_effects.entity(),
        drawing_box = {{-1.5, -1.7}, {1.5, 1.5}},
        fast_replaceable_group = "assembling-machine",
        animation =
        {
        layers =
        {
            {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
            priority = "high",
            width = 108,
            height = 119,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.5),
            hr_version =
            {
                filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
                priority = "high",
                width = 214,
                height = 237,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.75),
                scale = 0.5
            }
            },
            {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
            priority = "high",
            width = 130,
            height = 82,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            hr_version =
            {
                filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
                priority = "high",
                width = 260,
                height = 162,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(28, 4),
                scale = 0.5
            }
            }
        }
        },

        crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
        crafting_speed = 1.25,
        energy_source =
        {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 2
        },
        energy_usage = "375kW",
        module_specification =
        {
        module_slots = 4
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  }
)