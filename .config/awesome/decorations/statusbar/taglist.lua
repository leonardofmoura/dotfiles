local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local update_tag = function(item, tag, index)
    local highlight = item:get_children_by_id('highlight')[1]
                
    highlight.visible = tag.selected
end

local create_taglist = function(s)
    local taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style = {
            bg_focus = beautiful.bg_normal
        },
        widget_template = {
            {
                {
                    nil,
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    {
                        {
                            {
                                widget = wibox.widget.textbox
                            },
                            bg = beautiful.bg_focus,
                            id = "highlight",
                            widget = wibox.container.background
                        },
                        forced_height = 2,
                        widget = wibox.container.background
                    },
                    layout  = wibox.layout.align.vertical
                },
                id = 'background_role',
                widget = wibox.container.background,
                bg = beautiful.bg_normal
            },
            widget = wibox.container.margin,
            left = 3,
            right = 3,
                
            create_callback = update_tag,
            update_callback = update_tag
        }
    }

    return taglist
end

return create_taglist