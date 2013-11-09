local class = require('30log')

local response = class()
response.__name = 'response'

function response:__init(context)
	self.context = context or ngx
	self.body_content = nil
	self.headers = {
		['content-type'] = 'text/html'
	}
end

function response:set_header(header, value)
	self.headers[header] = value
end

function response:send_headers()
	for name,value in pairs(self.headers) do
		self.context.header[name] = value
	end
	return self
end

---
-- Setter/Getter for response body
---
function response:body(val)
	if val == nil then
		return self.body_content
	end

	self.body_content = val
end

return response