local Class = require('@wolfe-labs/Core:Class')
local Component = require('ui/component')

local Styles = {}

function Styles:getComponentContent () 
    return [[<style>
    .row{display:flex;flex-flow:row wrap}.column{flex:1}.merge2{flex:2}.merge3{flex:3}.merge4{flex:4}.row,.merge2,.merge3,.merge4{margin:0 8px}.nested{padding:0!important;margin:0!important;border:0!important}
    </style>]]
end

return Class.new('Styles', Styles, Component)