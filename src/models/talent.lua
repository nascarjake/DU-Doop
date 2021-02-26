local BaseModel = require('models/base-model')
local Class = require('@wolfe-labs/Core/Class')
local Talent = {
    db = progressDB,
    id = '',
    name = '',
    description = '',
    lvl = 1,
    fn = nil
    logo = '' --assetId
}

local defaults = {
    'land' = {
        id = 'land',
        name = 'Landing',
        description = 'Increases the amount of XP earned when you land by 5%.'
    },
    'takeoff' = {
        id = 'takeoff',
        name = 'Takeoff',
        description = 'Increases the amount of XP earned when you takeoff by 5%.'
    },
    'daily' = {
        id = 'daily',
        name = 'Startup Bonus',
        description = 'Increases the amount of XP earned when you start up for the first time each day by 5%.'
    },
    'travel' = {
        id = 'travel',
        name = 'Travel',
        description = 'Increases the amount of XP earned when you travel 10km by 5%.'
    },
}

function Talent:defaultFn (action, xp)
    if action == self.id then
        xp = xp + ((xp * .05) * self.lvl)
    end
    return xp
end

return Class.new('Talent', Talent, BaseModel)