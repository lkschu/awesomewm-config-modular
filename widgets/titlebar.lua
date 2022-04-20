local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local beautiful = require 'beautiful'
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local helper = require("modules.helper")
local config = require("config.vars")

-- Titlebar widget for windows
local titlebar = {}


function titlebar.make_titlebar(c)
   -- buttons for the titlebar
   local buttons = {
      -- let mouse move (floating) windows
      awful.button {
         modifiers = {},
         button    = 1,
         on_press  = function()
            c:activate { context = 'titlebar', action = 'mouse_move' }
         end
      },
      -- let mouse resize (floating) windows
      awful.button {
         modifiers = {},
         button    = 3,
         on_press  = function()
            c:activate { context = 'titlebar', action = 'mouse_resize' }
         end
      },
   }


   -- Position of Titlebar: top/right
   local position
   position = config.titlebar_position

   local vertical
   local pos_align

   if position == 'top' then
      vertical = false
      pos_align = 'north'
   elseif position == 'bottom' then
      vertical = false
      pos_align = 'north'
   elseif position == 'right' then
      vertical = true
      pos_align = 'west'
   elseif position == 'left' then
      vertical = true
      pos_align = 'east'
   else
      -- If not set (or nil) no titlebar is wanted
      return
   end

   local layout_align
   local layout_flex
   local layout_fix
   if vertical then
      layout_align = wibox.layout.align.vertical
      layout_flex = wibox.layout.flex.vertical
      layout_fix = wibox.layout.fixed.vertical
   else
      layout_align = wibox.layout.align.horizontal
      layout_flex = wibox.layout.flex.horizontal
      layout_fix = wibox.layout.fixed.horizontal
   end

   local this_titlebar = awful.titlebar(c, {
      -- size = dpi(32),
      size = 32,
      position = position
   })

   local close_button = wibox.widget{
         { awful.titlebar.widget.closebutton(c), top = 1, left = 1, right = 1, bottom = 1, widget = wibox.container.margin },
         shape = gears.shape.rounded_rect,
         widget = wibox.container.background,
         bg = beautiful.bg_focus,
         shape_border_width = 1,
         shape_border_color = beautiful.fg_focus
      }
   helper.widget_connect_mouse_hover_bg(close_button, '#ff000033', beautiful.bg_focus)
   helper.widget_connect_mouse_hover_fg(close_button, '#ff0000', beautiful.fg_focus)
   helper.widget_connect_mouse_hover_border(close_button, '#ff0000', beautiful.fg_focus)
   close_button = wibox.widget{
      close_button,
      margins = 1, widget = wibox.container.margin
   }

   this_titlebar:setup {
      { -- Left
         { -- Make Icon, add buttons so move/resize works and give margins
            { awful.titlebar.widget.iconwidget(c), buttons = buttons, layout = layout_fix },
            --margins = 2,
            top    = 2,
            left   = 2,
            right  = 2,
            bottom = 2,
            widget = wibox.container.margin
         },
         { awful.titlebar.widget.stickybutton(c), margins = 3, widget = wibox.container.margin },
         { awful.titlebar.widget.ontopbutton(c), margins = 7, widget = wibox.container.margin },
         layout = layout_align
      },
      { -- Middle
         { -- Title
            {
               align  = "center",
               widget = awful.titlebar.widget.titlewidget(c)
            },
            widget = wibox.container.rotate,
            direction = pos_align
         },
         buttons = buttons,
         layout  = layout_flex
      },
      { -- Right
         {
            {
               {
                  { awful.titlebar.widget.floatingbutton(c), top = 3, left = 2, right = 2, bottom = 1, widget = wibox.container.margin },
                  { awful.titlebar.widget.maximizedbutton(c), top = 1, left = 2, right = 2, bottom = 1, widget = wibox.container.margin },
                  layout = layout_fix
               },
               shape = gears.shape.rounded_rect, widget = wibox.container.background, shape_border_width = 1, shape_border_color = beautiful.fg_focus },
            margins = 4, widget = wibox.container.margin },
         close_button,
         layout = layout_fix
      },
      layout = layout_align
   }

   -- Default titlebar
   -- awful.titlebar(c).widget = {
   --    -- left
   --    {
   --       awful.titlebar.widget.iconwidget(c),
   --       buttons = buttons,
   --       layout  = wibox.layout.fixed.horizontal,
   --    },
   --    -- middle
   --    {
   --       -- title
   --       {
   --          align = 'center',
   --          widget = awful.titlebar.widget.titlewidget(c),
   --       },
   --       buttons = buttons,
   --       layout  = wibox.layout.flex.horizontal,
   --    },
   --    -- right
   --    {
   --       awful.titlebar.widget.floatingbutton(c),
   --       awful.titlebar.widget.maximizedbutton(c),
   --       awful.titlebar.widget.stickybutton(c),
   --       awful.titlebar.widget.ontopbutton(c),
   --       awful.titlebar.widget.closebutton(c),
   --       layout = wibox.layout.fixed.horizontal()
   --    },
   --    layout = wibox.layout.align.horizontal,
   -- }


end

return titlebar
