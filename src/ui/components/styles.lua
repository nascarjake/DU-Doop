local Class = require('@wolfe-labs/Core:Class')
local Component = require('ui/component')

local Styles = {}

function Styles:getComponentContent () 
    return [[<style>
    
    </style>]]
end

return Class.new('Styles', Styles, Component)