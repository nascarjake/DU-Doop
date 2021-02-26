local Class = require('@wolfe-labs/Core:Class')
local Page = require('ui/page')
local AvatarComponent = require('ui/components/avatar-component')
local StatusPanel = require('ui/components/status-panel')

local Home = {
    left = AvatarComponent,
    right = StatusPanel,
    showMenu = false
}

function Home:getPageContent (parent) 
    local l = self.left.new(self)
    l.width = 50
    l.height = 100
    self:addElement(l)
    local r = self.right.new(self)
    r.width = 50
    r.height = 100
    r.x = 50
    self:addElement(r)
end

return Class.new('Home', Home, Page)