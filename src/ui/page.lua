local Class = require('@wolfe-labs/Core:Class')
local Screen = require('@wolfe-labs/Screenmancy:Screen')

local Page = {}

function Page:__constructor (parent)
    local out = Screen:__costructor(parent)
    out.elements = self:getPageContent()
    return out
end

function Page:getPageContent () 
    -- return page contents from here
    return ''
end

return Class.new('Page', Page, Screen)