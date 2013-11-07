local class = require('30log')

local response = class()
response.__name = 'response'

response.headers = {
	['content-type'] = 'text/html'
}

function response:__init()
	self.body_content = nil
end

function response:set_header(header, value)
	response.headers[header] = value
end

function response:send_headers()
	for name,value in pairs(self.headers) do
		ngx.header[name] = value
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