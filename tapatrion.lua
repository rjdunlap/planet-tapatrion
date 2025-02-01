local utils = require("__any-planet-start__.utils")

utils.set_prerequisites("agriculture", nil)
utils.set_prerequisites("heating-tower", nil)
utils.remove_tech("concrete", true, true)
utils.remove_tech("landfill", true, true)
utils.remove_tech("steel-processing", true, true)

utils.set_prerequisites("heat-inserter", "heating-tower")

utils.set_trigger("agriculture", {type = "mine-entity", entity = "stingfrond"})
utils.set_trigger("heating-tower", {type = "mine-entity", entity = "sunnycomb"})