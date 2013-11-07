local class = require('30log')

local route = class()
route.__name = 'route'

function route:__init(pattern, callback)
	self.pattern = pattern
	self.callback = callback
end

function route:get_pattern()
	return self.pattern
end

function route:get_callback()
	return self.callback
end

return route