local StoreItem = require('models/store-item')
local Base = require('models/base')
local util = require('util/basic')
local StoreManager = {
    library = {},
    inventory = {}
}

function StoreManager:new (o)
    return Base:new (o)
end

function StoreManager:loadLibrary ()
    self.library = {}
    local ids = util.strSplit(StoreItem:getLibraryIndex())
    for _, id in ipairs(ids) do
        table.insert(library, StoreItem:load(id));
    end
end

function StoreManager:purchase (itemId, profile)
    local item = StoreItem:load(itemId)
    if profile.credits >= item.price then
        table.insert(self.currentMissions, self.library[id])
        return true
    else
        return false
    end
end

function StoreManager:update ()

end

return StoreManager