local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

naughty.notify({
})



local function make_button(icon,event)


  local button_widget =  wibox.widget {
          {
            widget = wibox.widget.imagebox,
            image = icon
          },
          widget = wibox.container.margin,
          margins = 4
        }

  button_widget:buttons(
    awful.button({},1, event)
  )

  return button_widget

end
poweroff = make_button(beautiful.poweroff_icon,function() awful.spawn("poweroff") end)
closesession = make_button(beautiful.closesession_icon, function() awesome.quit() end)
