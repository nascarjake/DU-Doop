local Class = require('@wolfe-labs/Core:Class')
local Component = require('ui/component')

local StatusPanel = {}

function StatusPanel:getComponentContent () 
    return '<div>status</div>'
end

return Class.new('StatusPanel', StatusPanel, Component)