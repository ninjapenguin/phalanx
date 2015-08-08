local router = require "src.phalanx.router"
local route = require "src.phalanx.route"

function return_ngx_mock(route)

        local route = route or '/test'
        return {
            HTTP_NOT_FOUND = 0,
            var = {
                request_method = 'GET',
                request_uri = route
            },
            exit = function() end
        }
end

describe("Phalanx router", function()
    it("should match routes in passed order", function()

        local context = return_ngx_mock()
        local r = router:new(context)

        local i1 = {get = function() end}
        local i2 = {get = function() end}
        local t1 = {new = function() return i1 end}
        local t2 = {new = function() return i2 end}
        stub(i1, "get")
        stub(i2, "get")

        r:add('r1', route:new('^/test', t1))
        r:add( 'r2', route:new('^/test', t2))

        r:route()

        assert.stub(i1.get).was.called(1)
        assert.stub(i2.get).was_not.called()
    end)

    it("should pass matched params to controller method", function()

        local context = return_ngx_mock('/test/param/1')
        local r = router:new(context)

        local i1 = {get = function(one, two) print("here") end}
        local i2 = {get = function(one, two) end}
        local t1 = {new = function() return i1 end}
        local t2 = {new = function() return i2 end}
        stub(i1, "get")
        stub(i2, "get")

        r:add('r1', route:new('^/test/(%w+)/(%d+)', t1))
        r:add( 'r2', route:new('^/test/(%w+)/(%d+)', t2))

        r:route()

        assert.stub(i1.get).was.called(1)
        assert.stub(i1.get).was.called_with(i1, "param", "1")

    end)

    it("should call exit when no routes match", function()

        local context = return_ngx_mock('/test/param/1')
        stub(context, "exit")
        local r = router:new(context)

        r:route()
        assert.stub(context.exit).was.called(1)
    end)
end)