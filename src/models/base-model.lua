local log = require('util/log')
local dbutil = require('util/db')

local BaseModel = {
    db = nil
}

function BaseModel:new (o)
    return Base:new(o)
end

function BaseModel:getIgnoredProps ()
    return {'db'}
end

function BaseModel:save ()
    if not self.db then log.error('No db found') end

    dbutil.inject(self.db, self, self.getIgnoredProps())
end

function BaseModel:load (id)
    if not self.db then log.error('No db found') end
    local loadedData = dbutil.extract(self.db, self, id, self.getIgnoredProps())
    return self:new(loadeddata)
end

return BaseModel