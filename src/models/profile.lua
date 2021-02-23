local Base = require('models/base')
local Profile = {
    captainName = '',
    shipName = '',
    xp = 0,
    credits = 0,
    factionId = ''
}

function Profile:new (o)
    return Base:new (o)
end

return Profile