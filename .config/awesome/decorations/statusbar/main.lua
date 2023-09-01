local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")

local create_taglist = require("decorations.statusbar.taglist")
local create_tasklist = require("decorations.statusbar.tasklist")
local widgets = require("decorations.statusbar.widgets")

local sep = lain.util.separators
local separator_pre = sep.arrow_left("alpha",beautiful.bg_focus)
local separator_post = sep.arrow_left(beautiful.bg_focus,"alpha")

local separator = {
    layout = wibox.layout.fixed.horizontal,
    separator_pre,
    separator_post,
} 

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- add the tags
    require("main.tags")

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = create_taglist(s)

    -- Create a tasklist widget
    s.mytasklist = create_tasklist(s)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height=40 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.flex.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
            s.mytasklist,
        },
        widgets.clock, -- Middle widgets
        { -- Right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                widgets.systray,
                widgets.temp,
                widgets.volume,
                -- widgets.bat,
                widgets.layout,
                s.mylayoutbox,
            },
            halign = 'right',
            widget = wibox.container.place
        },
    }    
end)
