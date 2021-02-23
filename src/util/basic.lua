local isInt = function (i)
    if (i == math.floor(i)) then
       return true
    end
    return false
end

local convertPosToWorld = function (pos) 
    local num  = ' *([+-]?%d+%.?%d*e?[+-]?%d*)'
    local posPattern = '::pos{' .. num .. ',' .. num .. ',' ..  num .. ',' .. num ..  ',' .. num .. '}'    
    local systemId, bodyId, latitude, longitude, altitude = string.match(pos, posPattern)
    if (systemId == "0" and bodyId == "0") then
        return vec3(tonumber(latitude),
                    tonumber(longitude),
                    tonumber(altitude))
    end
    longitude = math.rad(longitude)
    latitude = math.rad(latitude)
    local planet = atlas[tonumber(systemId)][tonumber(bodyId)]  
    local xproj = math.cos(latitude);   
    local planetxyz = vec3(xproj*math.cos(longitude),
                          xproj*math.sin(longitude),
                             math.sin(latitude));
    return planet.center + (planet.radius + altitude) * planetxyz
end

local arrayHasValue = function (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local strSplit = function (str, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

return { 
    isInt = isInt
    posToWorld = convertPosToWorld.
    arrayHasValue = arrayHasValue,
    strSplit = strSplit
}