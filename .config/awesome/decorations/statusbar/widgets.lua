local lain = require("lain")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")
local gears = require("gears")
local awful = require("awful")

local markup = lain.util.markup

local get_background = function (color,children)
    return wibox.widget {
        {
            {
                children,
                widget = wibox.container.place
            },
            bg = beautiful.black,
            fg = color,
            shape = gears.shape.rounded_rect,
            forced_height = 100,
            forced_width = 100,
            widget = wibox.container.background
        },
        margins = 5,
        widget = wibox.container.margin,
    }
end


------- Battery widget ---------------
local battery_icon = wibox.widget {
    image = gears.color.recolor_image(beautiful.bat_widget_icon,beautiful.bat_color),
    forced_height = 20,
    widget = wibox.widget.imagebox
}

local battery_text = lain.widget.bat {
    timeout = 5,
    settings = function()
        widget:set_markup(" " .. bat_now.perc .. "%")

        if bat_now.ac_status == 1 then
            battery_icon:set_image(gears.color.recolor_image(beautiful.bat_plug_icon,beautiful.bat_color))
        else
            battery_icon:set_image(gears.color.recolor_image(beautiful.bat_widget_icon,beautiful.bat_color))
        end

        bat_notification_critical_preset = {
            title = "Battery exhausted",
            text = "Shutdown imminent",
            timeout = 15,
            fg = beautiful.red,
            bg = beautiful.bg_normal
        }

        bat_notification_low_preset = {
            title = "Battery low",
            text = "Plug the cable!",
            timeout = 15,
            fg = beautiful.yellow,
            bg = beautiful.bg_normal
        }

        bat_notification_charged_preset = {
            title   = "Battery full",
            text    = "You can unplug the cable",
            timeout = 15,
            fg      = beautiful.green,
            bg      = beautiful.bg_normal
        }
    
    end
}

-- Create the widget
local battery = get_background(beautiful.magenta, wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    battery_icon,
    battery_text
})

------- Temperature widget ----------

local temp_icon = wibox.widget {
    image = gears.color.recolor_image(beautiful.thermometer_icon,beautiful.temp_color),
    forced_height = 20,
    widget = wibox.widget.imagebox
}

local temp_text = lain.widget.temp {
    settings = function()
        widget:set_markup(" " .. coretemp_now .. "ºC")
    end
}

-- Create the widget
local therm = get_background(beautiful.cyan, wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    temp_icon,
    temp_text
})

------- Volume widget ----------

local volume_icon = wibox.widget {
    image = gears.color.recolor_image(beautiful.volume_icon,beautiful.volume_color),
    forced_height = 20,
    widget = wibox.widget.imagebox
}

local vol_text = lain.widget.alsa {
    settings = function()
        widget:set_markup(" " .. volume_now.level)
    end
}

local vol = get_background(beautiful.green, wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    volume_icon,
    vol_text,
})

--------- Clock widget --------------

local clock = wibox.widget {
    {
        {
            {
                widget = wibox.widget.textclock
            },
            bg = beautiful.black,
            fg = beautiful.yellow,
            shape = gears.shape.rounded_rect,
            forced_height = 100,
            widget = wibox.container.background
        },
        margins = 5,
        widget = wibox.container.margin,
    },
    widget = wibox.container.place
}

------------ Keyboard Layout --------
local layout = get_background(beautiful.red, wibox.widget {
    widget = awful.widget.keyboardlayout()
});


local ret = {
    bat = battery,
    temp = therm,
    volume = vol,
    vol_control = vol_text,
    clock = clock,
    layout = layout,
}

return ret
