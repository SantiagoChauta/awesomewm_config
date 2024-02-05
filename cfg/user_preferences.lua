
local menubar =require("menubar")

-- This is used later as the default terminal and editor to run.
 terminal = "x-terminal-emulator"
 browser ="firefox"
 explorer = "nautilus"
 editor = "nvim"
 editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
 modkey = "Mod4"

-- Menubar configuration
menubar.utils.terminal = terminal


