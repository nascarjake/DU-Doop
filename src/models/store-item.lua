local BaseModel = require('models/base-model')
local Class = require('@wolfe-labs/Core/Class')
local StoreItem = {
    db = storeDB,
    id = '',
    name = '',
    description = '',
    price = 0,
    asset = '',
    use = '', --string name of a function out of item-uses
    useParams = '' -- string to be parsed by function
}

return Class.new('StoreItem', StoreItem, BaseModel)