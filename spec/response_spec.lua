local response = require "src.framework.response"

describe("Phalanx response object", function()

    it("should intialise with empty response body", function()
        resp = response:new()

        assert.are.same(resp:body(), nil)
    end)

    it("should enable setting of body string", function()
        resp = response:new()
        local val = "custom body data"
        resp:body(val)

        assert.are.same(resp:body(), val)
    end)

    it("should default to setting content-type to text/html", function()
        local context = {
            header = {}
        }
        resp = response:new(context)
        resp:send_headers()

        assert.is.equals(context.header["content-type"], "text/html")
    end)

    it("should accept key, value header arguments", function()
        local context = {
            header = {}
        }
        resp = response:new(context)
        resp:set_header('X-test', 'yessir')
        resp:send_headers()

        local count = 0
        for _ in pairs(context.header) do count = count + 1 end
        assert.are.equals(count, 2)

    end)

end)