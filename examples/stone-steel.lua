-- Electric Stone Furnace ****************************************************************
electricstone = util.table.deepcopy(data.raw["furnace"]["stone-furnace"])
electricstone.name = "electric-stone-furnace"
electricstone.icon = "__Electric Furnaces__/graphics/icons/electric-stone-furnace.png"
electricstone.minable.result = "electric-stone-furnace"
electricstone.fast_replaceable_group = "furnace"
electricstone.next_upgrade = "electric-steel-furnace"
electricstone.working_sound =
{
  sound =
  {
    filename = "__base__/sound/electric-furnace.ogg",
    volume = 0.7
  },
  apparent_volume = 1.5
}
electricstone.energy_usage = "90kW"
electricstone.crafting_speed = 2
electricstone.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 1
}
electricstone.animation.layers[1].filename = "__Electric Furnaces__/graphics/entity/electric-stone-furnace/electric-stone-furnace.png"
electricstone.animation.layers[1].hr_version.filename = "__Electric Furnaces__/graphics/entity/electric-stone-furnace/hr-electric-stone-furnace.png"
electricstone.working_visualisations[1].effect = nil
electricstone.working_visualisations[1].animation.layers[1] =
{
  filename = "__Electric Furnaces__/graphics/entity/electric-stone-furnace/electric-stone-furnace-heater.png",
  priority = "extra-high",
  width = 8,
  height = 11,
  frame_count = 12,
  axially_symmetrical = false,
  direction_count = 1,
  shift = {0.046875, 0.565625},
  hr_version = {
    filename = "__Electric Furnaces__/graphics/entity/electric-stone-furnace/hr-electric-stone-furnace-heater.png",
    priority = "extra-high",
    width = 16,
    height = 27,
    frame_count = 12,
    axially_symmetrical = false,
    direction_count = 1,
    shift = util.by_pixel(0.5, 18),
    scale = 0.5
  }
}
electricstone.working_visualisations[1].animation.layers[2].repeat_count = 12
electricstone.working_visualisations[1].animation.layers[2].hr_version.repeat_count = 12
electricstone.working_visualisations[2].effect = nil

-- Electric Steel Furnace ****************************************************************
electricsteel = util.table.deepcopy(data.raw["furnace"]["steel-furnace"])
electricsteel.name = "electric-steel-furnace"
electricsteel.icon = "__Electric Furnaces__/graphics/icons/electric-steel-furnace.png"
electricsteel.minable.result = "electric-steel-furnace"
electricsteel.fast_replaceable_group = "furnace"
electricsteel.working_sound =
{
  sound =
  {
    filename = "__base__/sound/electric-furnace.ogg",
    volume = 0.7
  },
  apparent_volume = 1.5
}
electricsteel.energy_usage = "90kW"
electricsteel.crafting_speed = 4
electricsteel.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 2
}
electricsteel.animation.layers[1].filename = "__Electric Furnaces__/graphics/entity/electric-steel-furnace/electric-steel-furnace.png"
electricsteel.animation.layers[1].hr_version.filename = "__Electric Furnaces__/graphics/entity/electric-steel-furnace/hr-electric-steel-furnace.png"
electricsteel.working_visualisations[1] =
{
  draw_as_light = true,
  fadeout = true,
  animation =
  {
    filename = "__Electric Furnaces__/graphics/entity/electric-steel-furnace/electric-steel-furnace-heater.png",
    priority = "high",
    width = 25,
    height = 12,
    frame_count = 12,
    axially_symmetrical = false,
    direction_count = 1,
    shift = util.by_pixel(0, 20),
    hr_version = {
      filename = "__Electric Furnaces__/graphics/entity/electric-steel-furnace/hr-electric-steel-furnace-heater.png",
      priority = "high",
      width = 48,
      height = 20,
      frame_count = 12,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 20.5),
      scale = 0.5
    }
  }
}
electricsteel.working_visualisations[2].effect = nil
electricsteel.working_visualisations[3].effect = nil
electricsteel.working_visualisations[4].effect = nil

data:extend(
{
  electricstone,
  electricsteel,

  {
    type = "item",
    name = "electric-stone-furnace",
    icon = "__Electric Furnaces__/graphics/icons/electric-stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "a[stone-furnace]b",
    place_result = "electric-stone-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-steel-furnace",
    icon = "__Electric Furnaces__/graphics/icons/electric-steel-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "b[steel-furnace]b",
    place_result = "electric-steel-furnace",
    stack_size = 50
  },

  {
    type = "recipe",
    name = "electric-stone-furnace",
    ingredients = {
      {"stone-furnace", 1},
      {"electronic-circuit", 1},
      {"iron-plate", 1}
    },
    result = "electric-stone-furnace",
    enabled = true
  },
  {
    type = "recipe",
    name = "electric-steel-furnace",
    ingredients = {
      {"steel-furnace", 1},
      {"electronic-circuit", 5},
      {"iron-plate", 5}
    },
    result = "electric-steel-furnace",
    energy_required = 3,
    enabled = false
  }
})

table.insert(data.raw["technology"]["advanced-material-processing"].effects,{type = "unlock-recipe",recipe = "electric-steel-furnace"})