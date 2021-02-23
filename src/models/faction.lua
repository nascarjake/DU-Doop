local BaseModel = require('models/base-model')
local Faction = {
    db = progressDB,
    id = '',
    name = '',
    description = '',
    xp = 0,
    logo = '' --assetId
}

function Faction:new (o)
    return BaseModel:new (o)
end

return Faction