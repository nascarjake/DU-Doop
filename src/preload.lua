if not script then
    script = {}
end

local assets = require('default-data/assets')
local missions = require('default-data/missions')
local store = require('default-data/store')

local dbutil = require('util/db')

dbutil.injectBulk(assetDB, assets)
dbutil.injectBulk(missionDB, missions)
dbutil.injectBulk(storeDB, store)