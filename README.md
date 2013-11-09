# Phalanx [![Build Status](https://travis-ci.org/ninjapenguin/phalanx.png?branch=master)](https://travis-ci.org/ninjapenguin/phalanx)

A micro framework for nginx-lua currently primarily aimed at producing lightweight, high throughput api's

## TL;DR;

```Lua
local app_router = require("phalanx.framework.router"):new()
local route = require("phalanx.framework.route")

app_router:add(
	'book', route:new('^/book/(%w+)', require("myapp.controller.book"))
)

app_router:add(
	'user', route:new('^/user', require("phgdb.controller.user"))
)

ngx.say(
	app_router
	:route()
	:send_headers()
	:body()
)
```

## Download

Download one liner:

```bash
git clone https://github.com/ninjapenguin/phalanx.git && cd phalanx && luarocks make
````

## Dependencies

The below rocks are dependencies (these will be auto installed for you with the above command)

[30log] (https://github.com/Yonaba/30log)
```bash
luarocks install --server=http://rocks.moonscript.org/manifests/Yonaba 30log
```

[Penlight] (http://stevedonovan.github.io/Penlight/api/index.html)
```bash
luarocks install --server=http://rocks.moonscript.org moonrocks
```