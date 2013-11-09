local controller = require "src.framework.controller"

describe("Phalanx controller", function()
    it("should accept and return the request object", function()
        req = {tree = "green"}
        resp = {car = "blue"}
        c = controller:new(req, resp)

        assert.are.same(req, c.request)
    end)

    it("should accept and return the response object", function()
        req = {tree = "green"}
        resp = {car = "blue"}
        c = controller:new(req, resp)

        assert.are.same(resp, c.response)
    end)
end)