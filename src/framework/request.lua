local class = require('30log')

local request = class()
request.__name = 'request'

function request:__init(context)
	self.context = context or ngx
end

function request:post()
	self.context.req.read_body()
	return self.context.req.get_body_data()
end

function request:redirect( url )
	local url = url or self.context.var.request_uri
	self.context.redirect( url )
end

return request