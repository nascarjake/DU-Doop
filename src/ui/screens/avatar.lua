local Class = require('@wolfe-labs/Core:Class')
local Page = require('ui/page')

local AvatarComponent = require('ui/components/avatar-component')

local Avatar = {}

function Avatar:getComponentContent () 
    return { AvatarComponent.new(self) }
end

return Class.new('Avatar', Avatar, Page)