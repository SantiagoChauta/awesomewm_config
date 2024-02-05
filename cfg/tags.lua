
local awful = require("awful")

local tags = {}
awful.screen.connect_for_each_screen(function(s)
   tags[s] = awful.tag(
    { "Primera", "2", "3", "4", "5", "6", "7", "8", "9" }, s, RC.layouts[1]
  )
end)



local M = {
  tags,
}

return M
