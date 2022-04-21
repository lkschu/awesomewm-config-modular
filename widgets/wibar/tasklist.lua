local awful = require'awful'
local beautiful = require'beautiful'
local gears = require'gears'
local wibox = require'wibox'

local buttons = require'bindings.widgets.tasklist'.buttons

return function(s)
   local tasklist = awful.widget.tasklist{
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = buttons,
      style = {
         shape_border_width = 1,
         shape_border_color = beautiful.fg_focus,
         shape = gears.shape.rounded_rect,
      },
      layout   = {
        spacing = 12,
        spacing_widget = {
            {
                forced_width = 5,
                shape        = gears.shape.circle,
                widget       = wibox.widget.separator
            },
            valign = "center",
            halign = "center",
            widget = wibox.container.place,
        },
        layout  = wibox.layout.flex.horizontal
      },
      widget_template = {
         {
            {
               {
                  id = 'icon_role',
                  widget = wibox.widget.imagebox,
               },
               {
                  id = 'text_role',
                  widget = wibox.widget.textbox,
               },
               layout = wibox.layout.fixed.horizontal,
            },
            left = 10,
            right = 10,
            widget = wibox.container.margin,
         },
         id = 'background_role',
         widget = wibox.container.background,
      }
   }

   return tasklist
end
