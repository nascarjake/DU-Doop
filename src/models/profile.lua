local BaseModel = require('models/base-model')
local Ship = {
    captainName = '',
    shipName = '',
    xp = 0,
    credits = 0,
    factionId = '',
    constructId = '',
    totalFlightTime = 0,
    totalDistanceTravelled = 0,
    lastTravelTime = 0
}

function Ship:new (o)
    return BaseModel:new (o)
end

function Ship:updateDistance()
    local curTime = system.getTime()
    local velocity = vec3(core.getWorldVelocity())
    local spd = vec3(velocity):len()
    local elapsedTime = curTime - self.lastTravelTime
    if (spd > 1.38889) then
        spd = spd / 1000
        local newDistance = spd * (curTime - lastTravelTime)
        self.totalDistanceTravelled = self.totalDistanceTravelled + newDistance
    end
    self.totalFlightTime = self.totalFlightTime + elapsedTime
    self.lastTravelTime = curTime
end

function Ship:calcXP() 
    self.xp = self.totalDistanceTravelled / 100
    return self.xp
end

return Ship