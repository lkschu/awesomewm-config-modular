
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

_M.tagwidth = 38
_M.tags = {'1', '2', '', '4', '@'}
_M.tags = {'  ', '  ', '  ', '  ', '  '} -- < unicode small space ' ' around chars, still shit, better just use svg?
_M.tags = {'1', '2', '3', '4', '5'}
_M.tags = {'  ', '  ', '  ', '  ', '  '}
_M.tags = {{'1'}, {'2'}, {'3'}, {'4'}, {'5'}}




_M.tags = {
   { -- Screen 1
      { name = '1', icon = beautiful.icons.terminal },
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
