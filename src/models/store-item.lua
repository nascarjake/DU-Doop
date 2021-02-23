local Base = require('models/base')
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
    return Base:new (o)
end

return StoreItem