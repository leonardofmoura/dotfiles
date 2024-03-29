-- USER DEFINED VARIABLES

local user_vars = {
    -- This is used later as the default terminal and editor to run.
    terminal = "alacritty",
    editor = "nvim",

    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt.
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey = "Mod4",

    gapWidth = 7,
}

user_vars.editor_cmd = user_vars.terminal .. " -e " .. user_vars.editor

return user_vars