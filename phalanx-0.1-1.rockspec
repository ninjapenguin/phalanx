package = "Phalanx"
version = "0.1-1"
source = {
   url = "https://github.com/ninjapenguin/phalanx/archive/0.1.tar.gz" ,
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
}
build = {
   type = "builtin",
   modules = {
      ["phalanx.controller"] = "src/framework/controller.lua",
      ["phalanx.request"] = "src/framework/request.lua",
      ["phalanx.response"] = "src/framework/response.lua",
      ["phalanx.route"] = "src/framework/route.lua",
      ["phalanx.router"] = "src/framework/router.lua",
   }
}