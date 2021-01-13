-- bootstrap the compiler
fennel = require("lib.fennel")
table.insert(package.loaders, fennel.make_searcher({correlate=true}))
view = require("lib.fennelview")
pp = function(x) print(view(x)) end
lume = require("lib.lume")
bump = require("lib.bump")
sti = require("lib.sti")
params = require("params")
util = require("util")
camera = require("camera")
anim = require("anim")
lg = _G.love.graphics

require("wrap")