data:extend({
    {
        type = "technology",
        name = "weapon-shooting-speed-1",
        icon_size = 256, icon_mipmaps = 4,
        icons = util.technology_icon_constant_speed(weapon_shooting_speed_1_icon),
        effects =
        {
          {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.1
          },
          {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.1
          }
        },
        prerequisites = {"military"},
        unit =
        {
          count = 100*1,
          ingredients =
          {
            {"automation-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "e-j-a"
      },
})