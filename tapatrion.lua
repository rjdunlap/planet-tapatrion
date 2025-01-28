local utils = require("__any-planet-start__.utils")

utils.set_prerequisites("agriculture", nil)
utils.set_prerequisites("heating-tower", nil)

utils.set_trigger("agriculture", {type = "mine-entity", entity = "stingfrond"})
utils.set_trigger("heating-tower", {type = "mine-entity", entity = "sunnycomb"})