local BaseModel = require('models/base-model')
local Message = {
    db = progressDB,
    id = '',
    title = '',
    message = '',
    fromConstructId = '',
    fromPlayerId = '',
    channel = '',
    timestamp = 0
}

local msgPrefix = '$doop$'
local msgSep = '$%$'

function Message:new (o)
    return BaseModel:new (o)
end

function Message:send (msg, channel)
    if not channel then channel = 'open' end

    local message = Message:new ({
        channel = channel,
        message = message,
        title = '',
        fromConstructId = core.getConstructId(),
        fromPlayerId = system.getMasterPlayerId(),
        timestamp = system.getTime()
    })
    message:save()
    emitter.send(channel, message:toString())
end

function Message:toString ()
    return msgPrefix .. self.fromPlayerId .. msgSep .. self.fromConstructId .. msgSep .. self.title .. msgSep .. self.message .. msgSep .. self.timestamp
end

return Message