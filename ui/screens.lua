local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")


require("ui.powermenu")

mykeyboardlayout = awful.widget.keyboardlayout()
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)

    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[6])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }


    -- bottom wibar
    awful.wibar(
        {
          position = "bottom",
          screen =s,
          widget = wibox.widget {
            layout = wibox.layout.align.horizontal,
            s.mytasklist, -- Middle widget
          },
        }
    )

    -- Top wibar
    awful.wibar(
      { 
        position = "top", 
        screen = s,
        widget = wibox.widget {
          layout = wibox.layout.align.horizontal,
          { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.myprompddtbox,
          },
          {
            layout = wibox.layout.fixed.vertical,
          },
          { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
          poweroff,
            s.mylayoutbox,
          },
        }
      }
    )

end)
