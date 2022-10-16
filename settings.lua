_G.data:extend({
	{
		type = "int-setting",
		name = "infinity-factory-additional-levels",
		setting_type = "startup",
        minimum_value = 0,
		maximum_value = 10,
		default_value = 4,
		order = "a"
	},
	{
		type = "int-setting", -- TODO double?
		name = "infinity-factory-upgrade-multiplier",
		setting_type = "startup",
        minimum_value = 2,
		maximum_value = 16,
		default_value = 2,
		order = "a"
	},
	{
		type = "int-setting", -- TODO double?
		name = "infinity-factory-cost-multiplier",
		setting_type = "startup",
        minimum_value = 2,
		maximum_value = 16,
		default_value = 4,
		order = "a"
	},
	{
		type = "int-setting", -- TODO double?
		name = "infinity-factory-cost-expensive-multiplier",
		setting_type = "startup",
        minimum_value = 4,
		maximum_value = 16,
		default_value = 8,
		order = "a"
	},
	{
		type = "int-setting", -- TODO double?
		name = "infinity-factory-biter-upgrade-multiplier",
		setting_type = "startup",
        minimum_value = 2,
		maximum_value = 10,
		default_value = 2,
		order = "b-a"
	},
	{
		type = "double-setting",
		name = "infinity-factory-biter-speed-coefficient",
		setting_type = "startup",
        minimum_value = -100.0,
		maximum_value = 100.0,
		default_value = 15.12,
		order = "b-b"
	},
	{
		type = "double-setting",
		name = "infinity-factory-biter-speed-max",
		setting_type = "startup",
        minimum_value = 0.01,
		maximum_value = 10000.0,
		default_value = 1000,
		order = "b-c"
	},
})
