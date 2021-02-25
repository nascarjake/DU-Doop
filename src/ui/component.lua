local Class = require('@wolfe-labs/Core:Class')
local Element = require('@wolfe-labs/Screenmancy:Element')

local Component = {}

function Component:__constructor (parent)
    local out = self:__init(parent)
    out.contents = self:getComponentContent();
    return out
end

function Component:getComponentContent () 
    -- return component contents from here
    return ''
end

return Class.new('Component', Component, Element)