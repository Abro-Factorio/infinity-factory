local EXAMPLE_TYPE = "radar"
local EXAMPLE_NAME = "radar"
local PREFIX_NAME = "radar-"

local function object_updater(zero_object, level, object)
    object.energy_per_sector = change_energy_pow_upgrade(zero_object.energy_per_sector, level)
    object.max_distance_of_sector_revealed = zero_object.max_distance_of_sector_revealed * math.pow(Config.upgrade_multiplier, level)
    object.max_distance_of_nearby_sector_revealed = zero_object.max_distance_of_nearby_sector_revealed * math.pow(Config.upgrade_multiplier, level)
    object.energy_per_nearby_scan = change_energy_pow_upgrade(zero_object.energy_per_nearby_scan, level)
    object.rotation_speed = zero_object.rotation_speed * math.pow(Config.upgrade_multiplier, level)
    -- TODO scan_speed? Work now or not?
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)