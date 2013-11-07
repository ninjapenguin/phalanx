class = require("30log")

controller = class()
controller.__name = 'controller'

function controller:__init(request, response)
	self.controller_request = request
	self.controller_response = response
end

function controller:request()
	return self.controller_request
end

function controller:response()
	return self.controller_response
end

return controller