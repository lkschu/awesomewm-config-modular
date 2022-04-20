local gears = require "gears"
local awful = require "awful"
require "awful.autofocus"

-- Widget and layout library
local wibox = require "wibox"

-- Theme handling library
local beautiful = require "beautiful"

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Notification library
local naughty = require "naughty"
local menubar = require "menubar"
local hotkeys_popup = require "awful.hotkeys_popup"

-- -- Enable hotkeys help widget for VIM and other apps
-- -- when client with a matching name is opened:
-- require "awful.hotkeys_popup.keys"
-- require "keys"

local vars = require "config.vars"
local helper = require "modules.helper"

local module = {}

module.wd_size_h = 60
module.wd_size_w = 110
module.wd_space_inner = 5
module.wd_space_outer = 15
module.wd_border_width = 3
module.wd_columns = 4


-- form a widget into a tile in the multiwidget grid
local function background_wibox(w)
   return wibox.widget {
      {
         w,
         fill_vertical = true,
         fill_horizontal = true,
         content_fill_vertical = true,
         content_fill_horizontal = true,
         forced_height = module.wd_size_h,
         forced_width = module.wd_size_w,
         valign = 'center',
         halign = 'center',
         widget = wibox.container.place,
      },
      bg = '#4C566A', -- basic
      -- bg = '#00000000', -- tranparent
      forced_height = module.wd_size_h,
      height = module.wd_size_h,
      forced_width = module.wd_size_w,
      width = module.wd_size_w,
      shape_border_width = module.wd_border_width,
      shape_border_color = '#4C566A', -- outline
      shape = function(cr, width, height)
         gears.shape.rounded_rect(cr, width, height, 4)
      end,
      widget = wibox.container.background
   }
end




module.buttons_example = wibox {
   visible = true,
   bg = '#2E3440',
   ontop = true,
   height = 300,
   width = module.wd_columns * module.wd_size_w + (module.wd_columns -1) * (module.wd_space_inner) + 2* module.wd_space_outer,
   shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 8)
   end
}

module.to_setup = {
   --table.unpack(module.widgets),
   --module.widgets[1],
   --module.widgets[2],
   --module.widgets[3],
   --module.testwidget1,
   valign = 'left',
   align = 'top',
   shape_border_width = module.wd_border_width,
   -- shape_border_color = '#4C566A', -- outline
   shape_border_color = '#C2E400', -- outline
   homogeneous = true,
   spacing = module.wd_space_inner,
   -- min_cols_size = 20,
   forced_num_cols = module.wd_columns,
   orientation = 'vertical',
   layout = wibox.layout.grid
}


for i = 1,#vars.mw_widgets do
   table.insert(module.to_setup, i,  background_wibox(vars.mw_widgets[i]))
   -- table.insert(module.widgets, i, background_wibox(vars.mw_widgets[i]))
end


module.buttons_example:setup({
   module.to_setup,
   margins = module.wd_space_outer,
   widget = wibox.container.margin
})

-- module.buttons_example = wibox.widget {   
--    homogeneous = true,
--    spacing = module.wd_space_inner,
--    forced_num_cols = module.wd_columns,
--    layout = wibox.layout.grid,
-- }

-- module.buttons_example:add_widget_at(module.widgets[2], module.buttons_example.get_next_empty()[1], module.buttons_example.get_next_empty()[2])
-- module.buttons_example:add_widget_at(module.widgets[1], 1,1,1,1)

--module.buttons_example = wibox.container.margin {
--   module.buttons_example,
--   margins = module.wd_space_outer,
--   widget = wibox.container.margin
--
--}




-- Button to open multiwidget
local multi_widget_text = wibox.widget {
   text = " ",
   widget = wibox.widget.textbox
}
local multi_widget = wibox.widget {
   {
      multi_widget_text,
      top = 4,
      bottom = 4,
      left = 4,
      right = 4,
      widget = wibox.container.margin
   },
   bg = beautiful.bg_normal, -- basic
   -- bg = '#00000000', --tranparent
   shape_border_width = module.wd_border_width,
   shape_border_color = beautiful.bg_systray, -- outline
   shape = function(cr, width, height)
       gears.shape.rounded_rect(cr, width, height, 4)
   end,
   widget = wibox.container.background
}

-- awful.placement.top(module.buttons_example, { margins = {top = 40, left = 1000}, parent = awful.screen.focused()})
module.buttons_example.visible = false


local old_cursor, old_wibox
multi_widget:connect_signal("button::press", function(c)
   if module.buttons_example.visible == false then
      multi_widget_text.text = " "
      awful.placement.top_right(module.buttons_example, {
         margins = {
            top = 40,
            right = 300
         },
         parent = awful.screen.focused()
      })
      module.buttons_example.visible = true
      -- module.buttons_example:move_next_to(mouse.current_widget_geometry)
      local wb = mouse.current_wibox
      old_cursor, old_wibox = wb.cursor, wb
      wb.cursor = "hand1"
   else
      multi_widget_text.text = " "
      module.buttons_example.visible = false
      if old_wibox then
         old_wibox.cursor = old_cursor
         old_wibox = nil
      end
   end
end)
return multi_widget

