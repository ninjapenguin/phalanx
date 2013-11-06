local class = require('lib.30log')

local request = class()
request.__name = 'request'

function request:__init(context)
	self.context = context or ngx
end

function request:post()
	ngx.req.read_body()
	return ngx.req.get_body_data()
end

function request:redirect( url )
	local url = url or ngx.var.request_uri
	ngx.redirect( url )
end

return request