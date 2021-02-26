local Class = require('@wolfe-labs/Core:Class')
local Component = require('ui/component')
local AvatarComponent = require('ui/components/avatar-component')
local StatusPanel = require('ui/components/status-panel')

local Frame = {
    left = AvatarComponent,
    right = StatusPanel,
    showMenu = false
}

function Frame:getComponentContent () 
    return [[<div>
        
    </div>]]
end

return Class.new('Frame', Frame, Component)