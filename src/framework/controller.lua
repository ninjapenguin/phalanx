class = require("30log")

controller = class()
controller.__name = 'controller'

function controller:__init(request, response)
	self.request = request
	self.response = response
end

return controller