local BaseModel = require('models/base-model')
local StoreItem = {
    id = '',
    name = '',
    description = '',
    price = 0,
    asset = '',
    use = '', --string name of a function out of item-uses
    useParams = '' -- string to be parsed by function
}

function StoreItem:new (o)
    return BaseModel:new (o)
end

return StoreItem