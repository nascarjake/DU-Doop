local isInt = require('util/basic').isInt

local dbInject = function (db, dataTable)
    for key, value in pairs(dataTable) do
        local t = type(value)
        if t == 'string' then
            db.setStringValue(key, value)
        elseif t == 'number' and isInt(t) then
            db.setIntValue(key, value)
        elseif t == 'number' then
            db.setFloatValue(key, value)
        elseif t == 'boolean' then
            if t then
                db.setIntValue(key, 1)
            else
                db.setIntValue(key, 0)
            end
        end
    end
end

return {
    dbInject = dbInject
}