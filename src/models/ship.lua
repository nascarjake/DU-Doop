local util = require('util/basic')
local BaseModel = require('models/base-model')
local Class = require('@wolfe-labs/Core/Class')
local Ship = {
    db = progressDB,
    captainName = '',
    shipName = '',
    likes = 0,
    dislikes = 0,
    votedForIds = {},
    xp = 0,
    credits = 0,
    factionId = '',
    constructId = '',
    totalFlightTime = 0,
    totalDistanceTravelled = 0,
    lastTravelTime = 0
}

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

function Ship:like() 
    self.likes = self.likes + 1
end

function Ship:dislike() 
    self.dislikes = self.dislikes + 1
end

function Ship:sendLike(id) 
    if not util.arrayHasValue(self.votedForIds, id) then
        emitter.send('doop_ship_like_'..id, 'true')
        table.insert(self.votedForIds);
    end
end

function Ship:sendDislike(id) 
    if not util.arrayHasValue(self.votedForIds, id) then
        emitter.send('doop_ship_like_'..id, 'false')
        table.insert(self.votedForIds);
    end
end

return Class.new('Ship', Ship, BaseModel)