local awful = require'awful'
require'awful.autofocus'
local wibox = require'wibox'

-- Titlebar around windows
local titlebar = require'widgets.titlebar'

-- Raise window on mouse_enter
client.connect_signal('mouse::enter', function(c)
   c:activate{context = 'mouse_enter', raise = false}
end)

-- Make titlebar for each window
client.connect_signal('request::titlebars', function(c)
   titlebar.make_titlebar(c)
end)
