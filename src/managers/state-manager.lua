local Class = require('@wolfe-labs/Core/Class')
local StateLibrary = require('default-data/states')
local State = require('models/state')
local Base = require('models/base')
local util = require('util/basic')
local log = require('util/log')
local StateManager = {
    library = {},
    currentState = nil,
}

function StateManager:loadLibrary ()
    self.library = StateLibrary
end

function StateManager:start (stateId)
    local newState = State:new(self.library[stateId])
    self.currentState = newState
    newState:enter()
end

function StateManager:transition (stateId)
    self.currentState:exit(stateId)
end

function StateManager:update ()
    if not currentState.isRunning then
        if not currentState.transition then
            log.error('No transition for state')
            return
        end
        self:start(currentState.transition)
    end
end

return Class.new('StateManager', StateManager, Base)