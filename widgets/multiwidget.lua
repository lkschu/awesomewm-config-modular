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

local module = {}

module.wd_size = 75
module.wd_space_inner = 5
module.wd_space_outer = 15
module.wd_border_width = 3
module.wd_columns = 4

module.buttons_example = wibox {
   visible = true,
   bg = '#2E3440',
   ontop = true,
   height = 300,
   width = module.wd_columns * module.wd_size + (module.wd_columns -1) * (module.wd_space_inner) + 2* module.wd_space_outer,
   shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 8)
   end
}

local function background_wibox(w)
   return wibox.widget {
      {
         w,
         fill_horizontal = true,
         valign = 'center',
         halign = 'center',
         widget = wibox.container.place,
      },
      bg = '#4C566A', -- basic
      -- bg = '#00000000', -- tranparent
      forced_height = module.wd_size,
      height = module.wd_size,
      forced_width = module.wd_size,
      width = module.wd_size,
      shape_border_width = module.wd_border_width,
      shape_border_color = '#4C566A', -- outline
      shape = function(cr, width, height)
         gears.shape.rounded_rect(cr, width, height, 4)
      end,
      widget = wibox.container.background
   }
end

module.button = background_wibox(wibox.widget {
   {
      text = "I'm a button!",
      widget = wibox.widget.textbox
   },
   top = 0,
   bottom = 0,
   left = 8,
   right = 8,
   widget = wibox.container.margin
})

local old_cursor, old_wibox
module.button:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.fg_focus)
    local wb = mouse.current_wibox
    old_cursor, old_wibox = wb.cursor, wb
    wb.cursor = "hand1"
end)
module.button:connect_signal("mouse::leave", function(c)
    c:set_bg('#4C566A00')
    if old_wibox then
        old_wibox.cursor = old_cursor
        old_wibox = nil
    end
end)
module.button:connect_signal("button::press", function(c, _, _, button)
    if button == 1 then
        c:set_fg("#000000")
        awful.spawn(terminal)
    end
end)
module.button:connect_signal("button::release", function(c)
    c:set_fg(beautiful.fg_normal)
end)

module.cpu_widget = require("widgets.awesome-wm-widgets.cpu-widget.cpu-widget")
module.cpu_widget = background_wibox(module.cpu_widget({
    width = 75,
    step_width = 3,
    step_spacing = 1,
    color = '#434c5e'
}))

module.testwidget1 = awful.widget.watch('bash -c "sensors | grep SMBUSMASTER | cut -d \':\' -f 2 | cut -d \'+\' -f 2 | xargs"', 5)
module.testwidget1 = background_wibox(module.testwidget1)
module.testwidget2 = awful.widget.watch('bash -c "free -h | grep Mem: | awk \'{print $7 }\'"', 5)
module.testwidget2 = background_wibox(module.testwidget2)
module.testwidget3 = awful.widget.watch('bash -c "sensors | grep SMBUSMASTER | cut -d \':\' -f 2 | cut -d \'+\' -f 2 | xargs"', 5)
module.testwidget3 = background_wibox(module.testwidget3)

module.buttons_example:setup{
   {
      module.button,
      module.cpu_widget,
      module.testwidget1,
      module.testwidget2,
      module.testwidget3,
      valign = 'left',
      align = 'top',
      shape_border_width = module.wd_border_width,
      -- shape_border_color = '#4C566A', -- outline
      shape_border_color = '#C2E400', -- outline
      homogeneous = true,
      spacing = module.wd_space_inner,
      -- min_cols_size = 20,
      -- min_rows_size = 20,
      forced_num_cols = module.wd_columns,
      layout = wibox.layout.grid
   },
   margins = module.wd_space_outer,
   widget = wibox.container.margin
}

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
-- multi_widget:connect_signal("mouse::enter", function(c)
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
-- -- multi_widget:connect_signal("mouse::leave", function(c)
-- multi_widget:connect_signal("button::release", function(c)
--    multi_widget_text.text = " "
--    module.buttons_example.visible = false
--    if old_wibox then
--       old_wibox.cursor = old_cursor
--       old_wibox = nil
--    end
-- end)

-- return module
return multi_widget

