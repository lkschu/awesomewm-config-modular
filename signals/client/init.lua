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


-- Similar behavior as other window managers DWM, XMonad.
-- Master-Slave layout new client goes to the slave, master is kept
-- If you need new slave as master press: ctrl + super + return
client.connect_signal("manage", function(c)
    if not awesome.startup then awful.client.setslave(c) end
end)
