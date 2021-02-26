local BaseModel = require('models/base-model')
local Class = require('@wolfe-labs/Core/Class')
local Conversation = {
    db = missionDB,
    id = ''
}


return Class.new('Conversation', Converastion, BaseModel)