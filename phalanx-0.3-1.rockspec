package = "Phalanx"
version = "0.3-1"
source = {
   url = "https://github.com/ninjapenguin/phalanx/archive/0.3.tar.gz" ,
   dir = "phalanx-0.1"
}
description = {
   summary = "A microframework for use in with NginX-lua.",
   detailed = [[
      An MVC microframework for rapid api development
      within the NginX-Lua environment.
   ]],
   homepage = "https://github.com/ninjapenguin/phalanx/",
   license = "MIT <http://opensource.org/licenses/MIT>"
}
dependencies = {
   "lua >= 5.1",
   "penlight >= 1.0.0-1",
   "30log"
}
build = {
   type = "builtin",
   modules = {
      ["phalanx.controller"] = "src/phalanx/controller.lua",
      ["phalanx.request"] = "src/phalanx/request.lua",
      ["phalanx.response"] = "src/phalanx/response.lua",
      ["phalanx.route"] = "src/phalanx/route.lua",
      ["phalanx.router"] = "src/phalanx/router.lua",
   }
}