local Base = require('models/base')
local Mission = {
    id = '',
    title = '',
    description = '',
    location = '',
    difficulty = 1,
    startLocation = '',
    complete = false,
    createdBy = ''
}

function Mission:new (o)
    return Base:new (o)
end

return Mission