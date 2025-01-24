local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

for _,connection in pairs (data.raw["space-connection"]) do 
    if connection == nil then
        break
    end
    if connection.from == "gleba" or connection.from == "aquilo" then
        data.raw["space-connection"][connection.name].length = 45000
        data.raw["space-connection"][connection.name].from = "tapatrion"
        data.raw["space-connection"][connection.name].asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    end 
    if connection.to == "gleba" or connection.to == "aquilo" then
        data.raw["space-connection"][connection.name].length = 45000
        data.raw["space-connection"][connection.name].to = "tapatrion"
        data.raw["space-connection"][connection.name].asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    end
end

data.raw.planet["aquilo"].hidden = true
data.raw.planet["aquilo"].map_gen_settings = nil
data.raw.planet["gleba"].hidden = true
data.raw.planet["gleba"].map_gen_settings = nil