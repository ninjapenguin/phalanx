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
      ["framework.controller"] = "src/framework/controller.lua",
      ["framework.request"] = "src/framework/request.lua",
      ["framework.response"] = "src/framework/response.lua",
      ["framework.route"] = "src/framework/route.lua",
      ["framework.router"] = "src/framework/router.lua",
   }
}