local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'

local beautiful = require 'beautiful'
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local vars = require 'config.vars'

local buttons = require 'bindings.widgets.taglist'.buttons

-- taglist contains all tags or 'workspaces'
return function(s)

   -- buttons are assigned in bingings.widgets.taglist.buttons!
   local taglist_buttons = buttons

   local mytaglist = awful.widget.taglist {
      screen          = s,
      buttons         = taglist_buttons,
      filter          = awful.widget.taglist.filter.all,
      layout          = {
         spacing_widget = {
            {
               --forced_width  = 10,
               forced_height = 14,
               thickness     = 1,
               --shape           = gears.shape.powerline,
               color         = '#777777',
               widget        = wibox.widget.separator
            },
            valign = 'center',
            halign = 'center',
            widget = wibox.container.place,
         },
         spacing        = 3,
         layout         = wibox.layout.fixed.horizontal
      },

      -- Notice that there is *NO* wibox.wibox prefix, it is a template,
      -- not a widget instance.
      widget_template = {
         {  -- 'upper' widget, containing a bar to indicate status: empty, focus, etc
            {
               wibox.widget.base.make_widget(),
               forced_height = 4,
               id = 'background_role',
               widget = wibox.container.background,
            },
            margins = 1,
            widget = wibox.container.margin
         },

         {  -- 'bottom' widget, containing icon and number
            { 
               {
                  { id = 'icon_role', 
                  --stylesheet = "* {color : " .. beautiful.fg_normal .. ";}",
                  stylesheet = "* {color : #ff0000;}",
                  widget = wibox.widget.imagebox },
                  { 
                     { 
                        id = 'text_role', 
                        widget = wibox.widget.textbox, 
                     }, 
                     top = -5, widget = wibox.container.margin },
                  layout = wibox.layout.fixed.horizontal,
               },
               fill_horizontal = true,
               valign = 'center',
               halign = 'center',
               widget = wibox.container.place,
            },
            widget = wibox.container.margin, 
            layout = wibox.layout.fixed.horizontal, 
            -- forced_width = dpi(vars.tagwidth),
            forced_width = vars.tagwidth,
         },
         bottom = 1,
         layout = wibox.layout.align.vertical,
         widget = wibox.container.margin,
      },
   }
   return mytaglist





   -- local taglist = awful.widget.taglist {
   --    screen = s,
   --    filter = awful.widget.taglist.filter.all,
   --    buttons = buttons,
   -- }



   -- return taglist
end
