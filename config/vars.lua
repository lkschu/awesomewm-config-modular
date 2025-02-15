
local awful = require'awful'
local wibox = require'wibox'

local beautiful = require'beautiful'



local _M = {}

_M.layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.floating,
   --awful.layout.suit.tile.left,
   --awful.layout.suit.tile.top,
   --awful.layout.suit.fair,
   awful.layout.suit.fair.horizontal,
   --awful.layout.suit.spiral,
   --awful.layout.suit.spiral.dwindle,
   --awful.layout.suit.max,
   --awful.layout.suit.max.fullscreen,
   --awful.layout.suit.magnifier,
   --awful.layout.suit.corner.nw,
}

-- Acceptable values:
-- nil,"right","top","bottom" or "left"
_M.titlebar_position = "right"

_M.mw_widgets = {
   awful.widget.keyboardlayout(),
   -- wibox.widget.textclock(),
   wibox.widget {
      { awful.widget.watch('bash -c "sensors | grep SMBUSMASTER | cut -d \':\' -f 2 | cut -d \'+\' -f 2 | xargs"', 5), margins = 20, widget = wibox.container.margin },
      forced_height = 30,
      forced_width = 50,
      widget = wibox.container.background
   },
   wibox.widget {
      { awful.widget.watch('bash -c "free -h | grep Mem: | awk \'{print $7 }\'"', 5), margins = 20, widget = wibox.container.margin },
      forced_height = 30,
      forced_width = 50,
      widget = wibox.container.background
   },
   require("widgets.awesome-wm-widgets.cpu-widget.cpu-widget")({ width = 60, step_width = 4, step_spacing = 0, static_color = false, color = '#31D662', background_color = '#CCD4FF' })
}

      
_M.primary_screen = 1
_M.systray_screen = 1 -- systray can always only be on one screen

_M.tagwidth = 38
_M.tags = {'1', '2', '', '4', '@'}
_M.tags = {'  ', '  ', '  ', '  ', '  '} -- < unicode small space ' ' around chars, still shit, better just use svg?
_M.tags = {'1', '2', '3', '4', '5'}
_M.tags = {'  ', '  ', '  ', '  ', '  '}
_M.tags = {{'1'}, {'2'}, {'3'}, {'4'}, {'5'}}



_M.tags_icon_font = true -- not yet used
_M.tags = {
   { -- Screen 1
      { name = '1', icon = beautiful.icons.terminal},
      { name = '2', icon = nil, },
      { name = '3', icon = nil, },
      { name = '4', icon = nil, },
      { name = '5', icon = nil, }

   },
   { -- Screen 2
      { name = '6', icon = beautiful.icons.terminal },
      { name = '7', icon = nil, },
      { name = '8', icon = nil, },
      { name = '9', icon = nil, },

   },
}



return _M
