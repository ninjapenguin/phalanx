local class = require('30log')
local map = require('pl.OrderedMap')

local router = class()
router.__name = 'router'

function router:__init(context)
  self.callbacks = map()
  self.ngx = context or ngx
end

function router:add(name, route)
  self.callbacks:set(name, route)
end

function router:route()
  local method = self.ngx.var.request_method:lower()

  for route_name, route_object in self.callbacks:iter() do
    local rets = {self.ngx.var.request_uri:find(route_object:get_pattern())}

    local start = rets[1]
    local finish = rets[2]

    table.remove(rets, 1)
    table.remove(rets, 1)

    if start ~= nil then
      local request = require('phalanx.request'):new()
      local response = require('phalanx.response'):new()

      local callback = route_object:get_callback():new(request, response)

      callback[method](callback, unpack(rets))

      return response
    end
  end

  self.ngx.exit(self.ngx.HTTP_NOT_FOUND)
end

return router