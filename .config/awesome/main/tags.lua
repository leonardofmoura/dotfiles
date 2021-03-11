local awful = require("awful")

-- Each screen has its own tag table.
local names = { 
    "1:web", 
    "2:code", 
    "3:term",
    "4:files",
    "5:coms", 
    "6:music", 
}

local l = awful.layout.suit  -- Just to save some typing: use an alias.
--local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile,l.tile, l.tile, l.tile, l.tile }
awful.tag(names, s, l.tile)