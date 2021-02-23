local DELIM = '$%$'

local util = require('util/basic')
local arrayHasValue = util.arrayHasValue
local isInt = util.isInt

local inject = function (db, dataTable, ignoreProps, prefix)
    if not prefix and dataTable and dataTable.id then 
        prefix = dataTable.id
    end
    for key, value in pairs(dataTable) do
        if not arrayHasValue(ignoreProps, key) then 
            local t = type(value)
            local k = prefix .. DELIM .. key
            if t == 'string' then
                db.setStringValue(k, value)
            elseif t == 'number' and isInt(t) then
                db.setIntValue(k, value)
            elseif t == 'number' then
                db.setFloatValue(k, value)
            elseif t == 'boolean' then
                if t then
                    db.setIntValue(k, 1)
                else
                    db.setIntValue(k, 0)
                end
            end
        end
    end
end

local extract = function (db, model, id, ignoreProps)
    local out = {}
    for key, value in pairs(model) do
        if not arrayHasValue(ignoreProps, key) then 
            local t = type(value)
            local k = id .. DELIM .. key
            if t == 'string' then
                out[key] = db.getStringValue(k)
            elseif t == 'number' and isInt(t) then
                out[key] = db.getIntValue(k)
            elseif t == 'number' then
                out[key] = db.getFloatValue(k)
            elseif t == 'boolean' then
                if db.getIntValue(k) == 0 then
                    out[key] = false
                else
                    out[key] = true
                end
            end
        end
    end
    return out
end

return {
    inject = inject,
    extract = extract
}