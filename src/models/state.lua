local Base = require('models/base')
local State = {
    name = '',
    init = function () end,
    start = function () end,
    stop = function () end,
    isRunning = false,
    isInit = false
}



function State:enter ()
    if not self.isInit then 
        self.init() 
        self.isInit = true
    end
    self.start()
    self.isRunning = true
end

function State:exit (transition)
    self.stop()
    self.isRunning = false
    self.transition = transition
end

return Class.new('State', State, BaseModel)