local EXAMPLE_TYPE = "roboport"
local EXAMPLE_NAME = "roboport"
local PREFIX_NAME = "roboport-"

local function object_updater(zero_object, level, object)
    object.recharge_minimum = change_energy_pow_upgrade(zero_object.recharge_minimum, level)
    object.charging_energy = change_energy_pow_upgrade(zero_object.charging_energy, level)

    object.logistics_radius = zero_object.logistics_radius * math.pow(Config.upgrade_multiplier, level)
    object.construction_radius = zero_object.construction_radius * math.pow(Config.upgrade_multiplier, level)
    object.robot_slots_count = zero_object.robot_slots_count * math.pow(Config.upgrade_multiplier, level)
    object.material_slots_count = zero_object.material_slots_count * math.pow(Config.upgrade_multiplier, level)

    
    object.charging_offsets = {}
    for i = 1, math.min(#zero_object.charging_offsets * math.pow(Config.upgrade_multiplier, level), Consts.MAX_CHARGING_OFFSET_COUNT) do -- TODO WHy 192 in game?
        object.charging_offsets[i] = zero_object.charging_offsets[i % #zero_object.charging_offsets] -- Set all difference positions
    end
end

add_data_all_levels(EXAMPLE_TYPE, EXAMPLE_NAME, PREFIX_NAME, object_updater, Consts.EMPTY_FUNCTION, Consts.EMPTY_FUNCTION)