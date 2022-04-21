local awful = require'awful'
local wibox = require'wibox'
local gears = require'gears'
local beautiful = require'beautiful'

local menu = require'widgets.menu'
local taglist = require'widgets.wibar.taglist'
local tasklist = require'widgets.wibar.tasklist'
local layoutbox = require'widgets.wibar.layoutbox'
local battery_widget = require("widgets.awesome-wm-widgets.battery-widget.battery")
local brightness_widget = require("widgets.awesome-wm-widgets.brightness-widget.brightness")

local calendar_widget = require("widgets.awesome-wm-widgets.calendar-widget.calendar")
local multiwidget = require'widgets.multiwidget'

local vars = require"config.vars"

return function(s)
   local systray = nil
   local systrayscreen = vars.systray_screen or 1
   -- if s.index == systrayscreen then 
   --    systray = wibox.widget.systray()
   --    -- systray.visible = true
   --    -- systray.set_screen(systrayscreen)
   --    -- systray = wibox.widget {
   --    --    {
   --    --       systray,
   --    --       top = 1,
   --    --       bottom = 1,
   --    --       left = 5,
   --    --       right = 5,
   --    --       widget = wibox.container.margin
   --    --    },
   --    --    shape = gears.shape.rounded_rect,
   --    --    shape_border_width = 1,
   --    --    shape_border_color = beautiful.tasklist_bg_normal,
   --    --    bg = beautiful.bg_systray,
   --    --    widget = wibox.container.background
   --    -- }
   --    -- -- systray = awful.widget.only_on_screen(systray, systrayscreen)
   -- end

   -- if s.index == 1 then
   --    systray = wibox.container.only_on_screen:setup {
   --       widget = wibox.widget.systray(),
   --       screen = systrayscreen
   --    }
   -- end

   systray = wibox.widget.systray()

   s.widgets = {
      layoutbox      = layoutbox(s),
      taglist        = taglist(s),
      tasklist       = tasklist(s),
      -- keyboardlayout = awful.widget.keyboardlayout(),
      hotkeybar      = require'widgets.hotkeybar',
      promptbox      = awful.widget.prompt(),
      systray        = systray,
      textclock      = wibox.widget.textclock(),
      -- battery        = battery_widget({show_current_level=true, margin_right=4}),
      -- brightness     = brightness_widget({type='icon_and_text', program='xbacklight',step=5,tooltip=true,path_to_icon='/usr/share/icons/Arc/status/symbolic/display-brightness-symbolic.svg'})
      -- brightness     = brightness_widget({type='arc', program='xbacklight',step=5,tooltip=true})
   }

   s.seperator = wibox.widget {
      {
         orientation = 'vertical',
         forced_width  = 10,
         --forced_height = 14,
         thickness     = 1,
         -- shape           = gears.shape.powerline,
         -- shape           = gears.shape.circle,
         color         = beautiful.bg_minimize,
         widget        = wibox.widget.separator
      },
      valign = 'center',
      halign = 'center',
      widget = wibox.container.place,
   }

   s.cal_w = calendar_widget({
      theme = 'nord',
      placement = "top_right",
      start_sunday = false,
      radius = 8
   })
   s.widgets.textclock:connect_signal("button::press",
      function(_, _, _, button)
         if button == 1 then s.cal_w.toggle()
         end
      end)


   if s.index == 1 then
      s.multiwidget = multiwidget
   else
      s.multiwidget = nil
   end
   -- s.multiwidget = multiwidget


   s.widgets.wibar = awful.wibar{
      screen = s,
      position = 'top',
      widget = {
         -- left widgets
         {
            layout = wibox.layout.fixed.horizontal,
            --menu.launcher,
            s.widgets.taglist,
            s.widgets.promptbox,
            s.seperator,
            s.widgets.hotkeybar,
            s.seperator,
         },
         -- middle widgets
         s.widgets.tasklist,
         -- right widgets
         {
            layout = wibox.layout.fixed.horizontal,
            s.multiwidget,
            s.widgets.brightness,
            s.widgets.battery,
            s.widgets.systray,
            s.widgets.textclock,
            s.widgets.layoutbox,
         },
         layout = wibox.layout.align.horizontal,
      }
   }
end
