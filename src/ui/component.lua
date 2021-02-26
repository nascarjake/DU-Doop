local Class = require('@wolfe-labs/Core:Class')
local Element = require('@wolfe-labs/Screenmancy:Element')
local Utils = require('@wolfe-labs/Core:Utils')

local Component = {}

function Component:__constructor (parent, ...)
    system.print('comp ' .. Utils.dumpTable(parent, 1))
    system.print('comp ' .. Utils.dumpTable({...}, 1))
    self:__init(parent)
    self.contents = self:getComponentContent();
end

function Component:getComponentContent () 
    -- return component contents from here
    return ''
end

return Class.new('Component', Component, Element)