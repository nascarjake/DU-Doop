local Class = require('@wolfe-labs/Core:Class')
local Events = require('@wolfe-labs/Core:Events')
local Utils = require('@wolfe-labs/Core:Utils')
local Screen = require('@wolfe-labs/Screenmancy:Screen')
local Page = require('ui/page')

local AvatarComponent = require('ui/components/avatar-component')

local Avatar = {}

function Avatar:getPageContent (parent) 
    system.print('pageContent ' .. Utils.dumpTable(parent, 1))
    self:addElement(AvatarComponent:new(self))
end

return Class.new('Avatar', Avatar, Page, Screen, Events)