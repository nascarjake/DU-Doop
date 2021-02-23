if not script then
    script = {}
end

local assets = require('default-data/assets')
local missions = require('default-data/missions')
local store = require('default-data/store')

local dbInject = require('util/db').dbInject

dbInject(assetDB, assets)
dbInject(missionDB, missions)
dbInject(storeDB, store)