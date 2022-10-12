{
    type = "transport-belt",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "transport-belt"},
    max_health = 150,
    corpse = "transport-belt-remnants",
    dying_explosion = "transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.17
      },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "underground-belt",
    next_upgrade = "fast-transport-belt",
    speed = 0.03125,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },


  {
    type = "transport-belt",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-transport-belt"},
    max_health = 170,
    corpse = "express-transport-belt-remnants",
    dying_explosion = "express-transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/express-transport-belt.ogg",
        volume = 0.3
      },
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = express_belt_animation_set,
    related_underground_belt = "express-underground-belt",
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },