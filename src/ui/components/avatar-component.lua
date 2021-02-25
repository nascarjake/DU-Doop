local Class = require('@wolfe-labs/Core:Class')
local Component = require('ui/component')

local AvatarComponent = {}

function AvatarComponent:getComponentContent () 
    return '<div>Avatar</div>'
end

return Class.new('AvatarComponent', AvatarComponent, Component)