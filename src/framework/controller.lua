class = require("30log")

controller = class('controller')

function controller:init(request, response)
	self.request = request
	self.response = response
end

return controller