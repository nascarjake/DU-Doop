if not script then
    script = {}
end

local assets = require('default-data/assets')
local missions = require('default-data/missions')
local store = require('default-data/store')

local dbutil = require('util/db')

dbutil.inject(assetDB, assets)
dbutil.inject(missionDB, missions)
dbutil.inject(storeDB, store)