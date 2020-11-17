-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local lain = require("lain")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

--Error handling
require("main.error_handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/theme/theme.lua")

--user variables
user_vars = require("main.user_variables")

terminal = user_vars.terminal
editor = user_vars.editor
editor_cmd = user_vars.editor_cmd

modkey = user_vars.modkey

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = require("main.layouts")
-- }}}

--define the menu
require("main.menu")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- require set_wallpaper function
require("decorations.wallpaper")

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- add the statusbar
require("decorations.statusbar_main")
-- }}}

-- Mouse buttons
require("keybindings.global_mouse")

-- {{{ Key bindings
require("keybindings.global_keys")

-- Client keys
require("keybindings.client_keys")

-- Bind tags to number buttons
require("keybindings.tags")

-- Client Buttons
require("keybindings.client_mouse")

-- Set global keys
root.keys(globalkeys)
-- }}}

--Rules
require("main.rules")

-- Signals
require("main.signals")

-- Add gaps between clients
beautiful.useless_gap = user_vars.gapWidth

-- Run autostart applications
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

naughty.config.defaults['icon_size'] = 100
