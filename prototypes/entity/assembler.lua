LEVELS = settings.startup["infinity-factory-additional-tiers"].value

for i = 1, LEVELS do
    assembler_object = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
    assembler_object.type = "assembling-machine"
    assembler_object.name = "assembling-machine-T" .. i
    -- assembler_object.max_health = 400 * math.pow(2, i)
    assembler_object.crafting_speed = 1.25 * math.pow(2, i)
    assembler_object.energy_source.emissions_per_minute = 2 * math.pow(2, i)
    assembler_object.energy_usage = 375 * math.pow(2, i) .. "kW"
    -- assembler_object.module_specification.module_slots = 4 * math.pow(2, i)

    assembler_item = {
        type = "item",
        name = "assembling-machine-T" .. i,
        icon = "__base__/graphics/icons/assembling-machine-3.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "production-machine",
        order = "c[assembling-machine-T" .. i .. "]",
        place_result = "assembling-machine-T" .. i,
        stack_size = 50
    }

    assembler_recipe = {
        type = "recipe",
        name = "assembling-machine-T" .. i,
        ingredients = {
          {"stone-furnace", 1 * i},
          {"electronic-circuit", 1 * i},
          {"iron-plate", 1 * i}
        },
        result = "assembling-machine-T" .. i,
        enabled = true
    }

    data:extend({
        assembler_object,
        assembler_item,
        assembler_recipe
    })
end

--[[
assembler_t1 = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
assembler_t1.type = "assembling-machine"
assembler_t1.name = "assembling-machine-T1"
assembler_t1.max_health = 800
assembler_t1.crafting_speed = 2.5
assembler_t1.energy_source.emissions_per_minute = 4
assembler_t1.energy_usage = "750kW"
assembler_t1.module_specification.module_slots = 8 

assembler_t1_item = {
    type = "item",
    name = "assembling-machine-T1",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "c[assembling-machine-T1]",
    place_result = "assembling-machine-T1",
    stack_size = 50
  }

assembler_t1_recipe = {
    type = "recipe",
    name = "assembling-machine-T1",
    ingredients = {
      {"stone-furnace", 1},
      {"electronic-circuit", 1},
      {"iron-plate", 1}
    },
    result = "assembling-machine-T1",
    enabled = true
  }

data:extend({
    assembler_t1,
    assembler_t1_item,
    assembler_t1_recipe

      
    
      
})
--]]

-- table.insert(data.raw["technology"]["advanced-material-processing"].effects,{type = "unlock-recipe",recipe = "assembling-machine-T1"})