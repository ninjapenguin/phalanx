# Phalanx [![Build Status](https://travis-ci.org/ninjapenguin/phalanx.png?branch=master)](https://travis-ci.org/ninjapenguin/phalanx)

A micro framework for nginx-lua currently primarily aimed at producing lightweight, high throughput api's

## TL;DR;

```Lua
local app_router = require("phalanx.router"):new()
local route = require("phalanx.route")

app_router:add(
	'book', route:new('^/book/(%w+)', require("myapp.controller.book"))
)

app_router:add(
	'user', route:new('^/user', require("myapp.controller.user"))
)

ngx.say(
	app_router
	:route()
	:send_headers()
	:body()
)
```

## Install

Download one liner:

```bash
git clone https://github.com/ninjapenguin/phalanx.git && cd phalanx && luarocks make
````

## Examples

The below is an example of a simple phalanx site setup

### nginx.conf

```nginx
worker_processes 4;

events {
   worker_connections 1024;
}

http {

    lua_package_path "/web/root/sites/phalanx/lua/?.lua;;";

    include       mime.types;
    sendfile on;

    server {
      lua_code_cache off;
      listen 80;
      server_name phalanx.dev;

      root /web/root/sites/phalanx/public;

      access_log /var/log/nginx/access_phalanx.log;
      error_log /var/log/nginx/error_phalanx.log debug;

      location / {
        try_files $uri @framework;
      }

      location @framework {
        content_by_lua_file '/web/root/sites/phalanx/lua/index.lua';
      }
    }
}
```

### index.lua

```lua
local app_router = require("phalanx.router"):new()
local route = require("phalanx.route")

app_router:add(
    'welcome', route:new('^/', require("controller.welcome"))
)

ngx.say(
    app_router
    :route()
    :send_headers()
    :body()
)
```

### controller/welcome.lua

```lua
local page = require("phalanx.controller"):extends()
function page:get()
    self.response:body("Hello World")
end

return page
```

### Files

```
├── lua
│   ├── controller
│   │   └── welcome.lua
│   └── index.lua
└── public
    └── test.html
```

## Dependencies

The below rocks are dependencies (these will be handled for you when installing via luarocks)

[30log] (https://github.com/Yonaba/30log)
```bash
luarocks install --server=http://rocks.moonscript.org/manifests/Yonaba 30log
```

[Penlight] (http://stevedonovan.github.io/Penlight/api/index.html)
```bash
luarocks install --server=http://rocks.moonscript.org moonrocks
```