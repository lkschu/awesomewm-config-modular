local awful = require'awful'
local wibox = require'wibox'

local menu = require'widgets.menu'
local taglist = require'widgets.wibar.taglist'
local tasklist = require'widgets.wibar.tasklist'
local layoutbox = require'widgets.wibar.layoutbox'
local battery_widget = require("widgets.awesome-wm-widgets.battery-widget.battery")
local brightness_widget = require("widgets.awesome-wm-widgets.brightness-widget.brightness")

local calendar_widget = require("widgets.awesome-wm-widgets.calendar-widget.calendar")

local multiwidget = require'widgets.multiwidget'

return function(s)
   s.widgets = {
      layoutbox      = layoutbox(s),
      taglist        = taglist(s),
      tasklist       = tasklist(s),
      keyboardlayout = awful.widget.keyboardlayout(),
      promptbox      = awful.widget.prompt(),
      systray        = wibox.widget.systray(),
      textclock      = wibox.widget.textclock(),
      -- battery        = battery_widget({show_current_level=true, margin_right=4}),
      -- brightness     = brightness_widget({type='icon_and_text', program='xbacklight',step=5,tooltip=true,path_to_icon='/usr/share/icons/Arc/status/symbolic/display-brightness-symbolic.svg'})
      -- brightness     = brightness_widget({type='arc', program='xbacklight',step=5,tooltip=true})
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

   s.testwidget = awful.widget.watch('bash -c "sensors | grep SMBUSMASTER | cut -d \':\' -f 2 | cut -d \'+\' -f 2 | xargs"', 5)

   if s.index == 1 then
      s.multiwidget = multiwidget
   else
      s.multiwidget = nil
   end

   s.multiwidget = multiwidget

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
         },
         -- middle widgets
         s.widgets.tasklist,
         -- right widgets
         {
            layout = wibox.layout.fixed.horizontal,
            s.multiwidget,
            s.testwidget,
            s.widgets.keyboardlayout,
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
