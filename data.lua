require "util"

require "config"

if Config.additional_levels > 0 then
    require "consts"
    require "functions"

    require "prototypes.entity.assembler"
    require "prototypes.entity.belt"
end