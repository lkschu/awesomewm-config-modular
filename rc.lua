-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, 'luarocks.loader')

-- load theme
local beautiful = require'beautiful'
local gears = require'gears'
--beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')
--beautiful.init('~/.config/awesome/themes/default/theme.lua')
beautiful.init('~/.config/awesome/themes/default/theme.lua')
-- beautiful.init(os.getenv("$HOME") .. '.config/awesome/default/theme.lua')

-- load key and mouse bindings
require'bindings'

-- load rules
require'rules'

-- load signals
require'signals'



-- -- autostart programs
-- local awful = require("awful")
-- -- awful.spawn("~/.xprofile")
-- os.execute("sh ~/.xprofile")
