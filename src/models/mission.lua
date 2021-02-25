local BaseModel = require('models/base-model')
local Class = require('@wolfe-labs/Core/Class')
local log = require('util/log')
local posToWorld = require('util/basic').posToWorld

local MissionLibraryIndexKey = '~~MissionIndex~~'

local Mission = {
    db = missionDB,
    id = '',
    title = '',
    description = '',
    goalLocation = '',
    goalRadius = 1, -- distance in meters
    goalTransmitCode = '',
    difficulty = 1,
    startLocation = '',
    complete = false,
    createdBy = ''
}



function Mission:checkGoal ()
    if self.goalLocation then
        -- check position
        local distance = posToWorld(self.goalLocation) - vec3(core.getConstructWorldPos())
        if distance:len() < goalRadius then
            return true
        end
    elseif self.goalTransmitCode then
        -- check transmitter
    else
        log.error('Mission id ' .. self.id .. ' does not have proper goal setup')
    end
    return false
end

function Mission:getLibraryIndex ()
    return self.db.getStringValue(MissionLibraryIndexKey)
end

function Mission:start ()
    self.startLocation = ''
    -- transform current location to pos string
end

return Class.new('Mission', Mission, BaseModel)