local Mission = require('models/mission')
local Base = require('models/base')
local util = require('util/basic')
local MissionManager = {
    library = {},
    currentMissions = {},
    completedMissions = {} -- array of missionIDs 
}

function MissionManager:new (o)
    return Base:new (o)
end

function MissionManager:loadLibrary ()
    self.library = {}
    local ids = util.strSplit(Mission:getLibraryIndex())
    for _, id in ipairs(ids) do
        table.insert(library, Mission:load(id));
    end
end

function MissionManager:startMission (id)
    if util.arrayHasValue(self.completedMissions, id) then
        table.insert(self.currentMissions, self.library[id])
    else
        return false
    end
end

function MissionManager:update ()
    local indexesToRemove = {}
    for i, mission in ipairs(currentMissions) do
        if mission.checkGoal() then
            table.insert(completedMissions, mission.id)
            table.insert(indexesToRemove, i)
            mission.complete = true
            library[mission.id] = mission
        end
    end
    for _, index in ipairs(indexesToRemove) do
        table.remove(currentMissions, index)
    end
end

return MissionManager