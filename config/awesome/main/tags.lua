local awful = require("awful")

-- Each screen has its own tag table.
local names = { 
    "web", 
    "code", 
    "term", 
    "music", 
}

local l = awful.layout.suit  -- Just to save some typing: use an alias.
--local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile,l.tile, l.tile, l.tile, l.tile }
awful.tag(names, s, l.tile)