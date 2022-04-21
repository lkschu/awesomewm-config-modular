local awful = require'awful'
local wibox = require'wibox'
local gears = require'gears'
local beautiful = require'beautiful'



function makebutton(icon, cmd)
    -- takes a unicode icon and a terminal command
    button = wibox.widget
            {
                {
                    {
                        text = icon,
                        font          = beautiful.icon_font, 
                        widget = wibox.widget.textbox
                    },
                    top = 2, bottom = 2, left = 6, right = 6,
                    widget = wibox.container.margin
                },
                widget = wibox.container.background
            }
    button:connect_signal("mouse::enter", function(c) c:set_fg(beautiful.fg_focus) local wb = mouse.current_wibox old_cursor, old_wibox = wb.cursor, wb wb.cursor = "hand2" end)
    button:connect_signal("mouse::leave", function(c) c:set_fg(beautiful.fg_normal) if old_wibox then old_wibox.cursor = old_cursor old_wibox = nil end end)
    --button:connect_signal("button::press", function(c) c:set_fg("#000000") awful.spawn(terminal .." -e ".. cmd) end)
    button:connect_signal("button::press", function(c) c:set_fg("#000000") awful.spawn(cmd) end)
    button:connect_signal("button::release", function(c) c:set_fg(beautiful.fg_focus) end)
    return button
end

local buttons = {
    makebutton('', 'alacritty -e zsh'),
    makebutton('', 'alacritty -e ranger'),
    makebutton('', 'anki'),
}


local hotkeybar = wibox.widget {
   {
      layout = wibox.layout.fixed.horizontal,
      table.unpack(buttons),
   },
   shape = gears.shape.rounded_rect,
   shape_border_width = 1,
   shape_border_color = beautiful.tasklist_bg_normal,
   widget = wibox.container.background
}

return hotkeybar