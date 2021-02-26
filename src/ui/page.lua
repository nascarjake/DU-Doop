local Class = require('@wolfe-labs/Core:Class')
local Events = require('@wolfe-labs/Core:Events')
local Screen = require('@wolfe-labs/Screenmancy:Screen')
local Util = require('@wolfe-labs/Core:Utils')

local Page = {}

function Page:__constructor (_, parent, delay)
    Page.__parent.__constructor(self, parent)
    self:getPageContent(parent)
    if delay == nil then self:render() end
end

function Page:init (parent)
    self:iinit(parent)
    self:getPageContent(self)
end

function Page:getPageContent () 
    system.print('nahbruh')
    -- run page:addElement() here
end

return Class.new('Page', Page, Screen, Events)