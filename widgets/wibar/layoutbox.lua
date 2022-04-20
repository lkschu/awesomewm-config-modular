local awful = require'awful'

local buttons = require'bindings.widgets.layoutbox'.buttons

-- Makes layoutbox widget per screen?
return function(s)
   return awful.widget.layoutbox{
      screen = s,
      buttons = buttons,
   }
end
