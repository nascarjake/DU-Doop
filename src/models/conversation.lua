local BaseModel = require('models/base-model')
local Class = require('@wolfe-labs/Core/Class')
local Conversation = {
    db = progressDB,
    id = '',
    name = '',
    description = '',
    xp = 0,
    logo = '' --assetId
}


return Class.new('Conversation', Converastion, BaseModel)