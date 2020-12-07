local lain = require("lain")
local beautiful = require("beautiful")
local wibox = require("wibox")

local markup = lain.util.markup

------- Battery widget ---------------
local battery_icon = wibox.widget.imagebox(beautiful.bat_widget_icon)

local battery_text = lain.widget.bat {
    timeout = 5,
    settings = function()
        widget:set_markup(" " .. bat_now.perc .. "% " ..  bat_now.time ..  " remaining " .. bat_now.watt .. " watts ")

        if bat_now.ac_status == 1 then
            battery_icon:set_image(beautiful.bat_plug_icon)
        else
            battery_icon:set_image(beautiful.bat_widget_icon)
        end

        bat_notification_critical_preset = {
            title = "Battery exhausted",
            text = "Shutdown imminent",
            timeout = 15,
            fg = "#FFFFFF",
            bg = "#FF0000"
    }
    end
}

-- Create the widget
local battery = {
    layout = wibox.layout.fixed.horizontal,
    battery_icon,
    battery_text
}
------- Temperature widget ----------

local temp_icon = wibox.widget.imagebox(beautiful.thermometer_icon)

local temp_text = lain.widget.temp {
    settings = function()
        widget:set_markup(" " .. coretemp_now .. "ºC ")
    end
}

-- Create the widget
local therm = {
    layout = wibox.layout.fixed.horizontal,
    temp_icon,
    temp_text
} 

------- Volume widget ----------

local volume_icon = wibox.widget.imagebox(beautiful.volume_icon)

local vol_text = lain.widget.alsa {
    settings = function()
        widget:set_markup(" " .. volume_now.level .. " " .. volume_now.status .. " ")
    end
}

local vol = {
    layout = wibox.layout.fixed.horizontal,
    volume_icon,
    vol_text,
}

-------------------------------------


local ret = {
    bat = battery,
    temp = therm,
    volume = vol,
    vol_control = vol_text,
    bat_control = battery_text,
}

return ret