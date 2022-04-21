-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, 'luarocks.loader')

-- load theme
local beautiful = require'beautiful'
local gears = require'gears'
-- beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')  -- doesn't work no idea why
beautiful.init(gears.filesystem.get_configuration_dir() .. 'themes/default/theme.lua') 
-- beautiful.init('~/.config/awesome/themes/default/theme.lua')
-- beautiful.init(os.getenv("HOME") .. '/.config/awesome/themes/default/theme.lua')

-- load key and mouse bindings
require'bindings'

-- load rules
require'rules'

-- load signals
require'signals'



-- hack to refocus wanted primary_screen after boot/reload; direct calling awful.screen.focus did NOT work, propably because it is exec too early
local vars = require'config.vars'
local awful = require'awful'
local exec = "printf 'local awful = require\"awful\"\nawful.screen.focus(" .. tostring(vars.primary_screen or 1) .. ")' | awesome-client"
awful.spawn.with_shell(exec)


-- -- autostart programs
-- -- awful.spawn("~/.xprofile")
-- os.execute("sh ~/.xprofile")
