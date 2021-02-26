local Class = require('@wolfe-labs/Core/Class')
local Table = require('@wolfe-labs/Core:Table')
local Talent = require('models/talent')
local Base = require('models/base')
local util = require('util/basic')
local TalentManager = {
    library = {}
}

function TalentManager:load ()
    self.library = {}
    local keys = Table.keys(Talent.defaults)
    for _, id in ipairs(keys) do
        local talent = Talent:load(id)
        talent.fn = Talents.defaults[id].fn
        table.insert(self.library, talent);
    end
end

function TalentManager:save ()
    for _, talent in ipairs(self.library) do
        talent.save()
    end
end

function TalentManager:purchase (id)

end

function TalentManager:update (action)
    local xpChange = 0
    for k, talent in ipairs(self.library) do
        if not talent or not talent.fn then
            Talent:defaultFn(action, xpChange)
        else
            talent.fn(action, xpChange)
        end
    end
    -- update player xp
end

return Class.new('TalentManager', TalentManager, Base)