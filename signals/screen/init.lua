local awful = require'awful'
local beautiful = require'beautiful'
local wibox = require'wibox'

local vars = require'config.vars'
local widgets = require'widgets'

local gears = require'gears'

screen.connect_signal('request::wallpaper', function(s)
   gears.wallpaper.maximized(beautiful.wallpaper, s, true)
   --awful.wallpaper{
   --   screen = s,
   --   widget = {
   --      {
   --         image     = beautiful.wallpaper,
   --         upscale   = true,
   --         downscale = true,
   --         widget    = wibox.widget.imagebox,
   --      },
   --      valign = 'center',
   --      halign = 'center',
   --      tiled = false,
   --      widget = wibox.container.tile,
   --   }

   --}
end)

screen.connect_signal('request::desktop_decoration', function(s)
   -- make tags, tasklist, wibar, etc.

   local tags = nil

   if s.index > #vars.tags then
      -- If more screens are present than defined, copy last setup
      tags = vars.tags[#vars.tags]
   else
      tags = vars.tags[s.index]
   end

   for k,v in pairs(tags) do
      awful.tag.add(v.name, {
      icon               = v.icon,
      layout             = vars.layouts[1],
      --master_fill_policy = "master_width_factor",
      --gap_single_client  = true,
      --gap                = 15,
      screen             = s,
      --selected           = true,
      })
   end

   first_tag = s.tags[1]
   first_tag:view_only(first_tag)

   widgets.wibar(s)
end)
