_G.data:extend({
	{
		type = "int-setting",
		name = "infinity-factory-additional-levels",
		setting_type = "startup",
        minimum_value = 0,
		maximum_value = 10,
		default_value = 4
	},
	{
		type = "int-setting", -- TODO double?
		name = "infinity-factory-upgrade-multiplier",
		setting_type = "startup",
        minimum_value = 2,
		maximum_value = 16,
		default_value = 2
	},
	{
		type = "int-setting", -- TODO double?
		name = "infinity-factory-cost-multiplier",
		setting_type = "startup",
        minimum_value = 2,
		maximum_value = 16,
		default_value = 4
	}
})
