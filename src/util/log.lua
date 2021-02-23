local log = function (msg)
    system.print(msg)
end

local logError = function (msg) 
    if logLevel > 0 then log(msg) end
end

local logInfo = function (msg)
    if logLevel > 1 then log(msg) end
end

local logDebug = function (msg)
    if logLevel > 2 then log(msg) end
end

return {
    error = logError,
    info = logInfo,
    debug = logDebug
}