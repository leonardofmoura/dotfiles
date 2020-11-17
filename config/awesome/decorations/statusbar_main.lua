local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")

local taglist_buttons = require("decorations.statusbar_taglist")
local tasklist_buttons = require("decorations.statusbar_tasklist")
local widgets = require("decorations.statusbar_widgets")

local sep = lain.util.separators
local separator_pre = sep.arrow_left("alpha",beautiful.bg_focus)
local separator_post = sep.arrow_left(beautiful.bg_focus,"alpha")

local separator = {
    layout = wibox.layout.fixed.horizontal,
    separator_pre,
    separator_post,
}


-- Create a textclock widget
mytextclock = wibox.widget.textclock()


-- Create batterywidget
-- batterywidget = wibox.widget.textbox()    
-- batterywidget:set_text(" | © | ")    
-- batterywidgettimer = timer({ timeout = 5 })    
-- batterywidgettimer:connect_signal("timeout",    
--   function()    
--     fh = assert(io.popen("acpi | cut -d, -f 2,3 -", "r"))    
--     batterywidget:set_text(" | © " .. fh:read("*l") .. " | ")    
--     fh:close()    
--   end    
-- )    
-- batterywidgettimer:start()

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
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widgets
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            separator_post,
            wibox.widget.systray(),
            separator,
            widgets.temp,
            separator,
            widgets.volume,
            separator,
            widgets.bat,
            separator,
            mykeyboardlayout,
            mytextclock,
            s.mylayoutbox,
        },
    }    
end)