local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))


local create_tasklist = function (s)
    local taglist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = tasklist_buttons,
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                id     = 'clienticon',
                widget = awful.widget.clienticon,
            },
            margins = 5,
            widget  = wibox.container.margin,

            create_callback = function(self, c, index, objects)
                self:get_children_by_id('clienticon')[1].client = c
            end,
        },
    }

    local widget = wibox.widget {
        {
            {
                widget = taglist
            },
            bg = beautiful.black,
            shape = gears.shape.rounded_rect,
            widget = wibox.container.background
        },
        margins = 5,
        widget = wibox.container.margin
    }
    

    return widget
end

return create_tasklist