local DELIM = '$%$'
local Utils = require('@wolfe-labs/Core:Utils')
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
            elseif t == 'table' then
                local valStr = ''
                for i, v in pairs(value) do
                    if not #valStr then valStr = v
                    else valStr = valStr..DELIM..i .. '~#~' .. v end
                end
                db.setStringValue(k, valStr)
            end
        end
    end
end

local injectBulk = function(db, array, ignoreProps, prefix)
    for _, item in ipairs(array) do
        inject(db, item, ignoreProps, prefix)
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
            elseif t == 'table' then
                out[key] = {}
                local valStr = db.getStringValue(k)
                for _, value in ipairs(Utils.split(valStr,DELIM)) do
                    
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