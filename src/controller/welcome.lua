local welcome = require("phalanx.framework.controller"):extends()

function welcome:get()
	self.response:body("<html> <head></head> <body><h1>Welcome to Phalanx</h1></body></html>")
end

return welcome