local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

naughty.notify({
})



local function make_button()


  local button_widget =  wibox.widget {
          {
            widget = wibox.widget.imagebox,
            image = beautiful.poweroff_icon
          },
          widget = wibox.container.margin,
          margins = 4
        }

  button_widget:buttons(
    awful.button({},1, function() awesome.quit() end)
  )

  return button_widget

end
poweroff = make_button()
