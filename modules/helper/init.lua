
local helper = {}

function helper.dump_object(o)
   -- is shit!
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(v) ~= "function" then
            -- Works despite error warning
            goto continue
         end
         if type(k) ~= 'number' then
            k = '"'..k..'"' 
         end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
         ::continue::
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Connects mouse enter/leave signals to recolor widget
-- Must propably be called on background widget
function helper.widget_connect_mouse_hover_bg(w, color_enter, color_leave)
   assert(type(w.set_bg) == 'function', "Got no background widget!\nOr set_bg() not supported by widget")
   w:connect_signal("mouse::enter", function (c)
      c:set_bg(color_enter)
   end)
   w:connect_signal("mouse::leave", function (c)
      c:set_bg(color_leave)
   end)
end
function helper.widget_connect_mouse_hover_fg(w, color_enter, color_leave)
   assert(type(w.set_fg) == 'function', "Got no background widget!\nOr set_fg() not supported by widget")
   w:connect_signal("mouse::enter", function (c)
      c:set_fg(color_enter)
   end)
   w:connect_signal("mouse::leave", function (c)
      c:set_fg(color_leave)
   end)
end
function helper.widget_connect_mouse_hover_border(w, color_enter, color_leave)
   assert(type(w.set_shape_border_color) == 'function', "Got no background widget!\nOr set_shape_border_color() not supported by widget")
   w:connect_signal("mouse::enter", function (c)
      c:set_shape_border_color(color_enter)
   end)
   w:connect_signal("mouse::leave", function (c)
      c:set_shape_border_color(color_leave)
   end)
end

return helper
