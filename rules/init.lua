local awful = require'awful'
local ruled = require'ruled'

ruled.client.connect_signal('request::rules', function()
   -- All clients will match this rule.
   ruled.client.append_rule{
      id         = 'global',
      rule       = {},
      properties = {
         focus     = awful.client.focus.filter,
         raise     = true,
         screen    = awful.screen.preferred,
         placement = awful.placement.no_overlap + awful.placement.no_offscreen,
         size_hints_honor = false
      }
   }

   -- Sticky clients.
   ruled.client.append_rule{
      id = 'sticky',
      rule_any = {
         class = {
            'Tomate-gtk',
         }
      },
      properties = {sticky = true}
  }

   -- Top left clients.
   ruled.client.append_rule{
      id = 'topleft',
      rule_any = {
         class = {
            'Tomate-gtk',
         }
      },
      properties = {x = 0, y = 21}
  }

   -- Floating clients.
   ruled.client.append_rule{
      id = 'floating',
      rule_any = {
         instance = {'copyq', 'pinentry'},
         class = {
            'Arandr',
            'Blueman-manager',
            'Gpick',
            'Kruler',
            -- 'Sxiv',
            'Tor Browser',
            'Wpa_gui',
            'veromix',
            'xtightvncviewer',
            'Tomate-gtk',
         },
         -- Note that the name property shown in xprop might be set slightly after creation of the client
         -- and the name shown there might not match defined rules here.
         name = {
            'Event Tester',  -- xev.
         },
         role = {
            'AlarmWindow',    -- Thunderbird's calendar.
            'ConfigManager',  -- Thunderbird's about:config.
            'pop-up',         -- e.g. Google Chrome's (detached) Developer Tools.
         }
      },
      properties = {floating = true}
   }

   -- Add titlebars to normal clients and dialogs
   ruled.client.append_rule{
      id         = 'titlebars',
      rule_any   = {type = {'normal', 'dialog'}},
      properties = {titlebars_enabled = true},
   }

   -- Set Firefox to always map on the tag named '2' on screen 1.
   -- These clients always spawn on tag 9 ie screen 2 tag 4
   ruled.client.append_rule {
      rule_any    = {
         class = {
            'kotatogram-desktop', 
            'KotatogramDesktop', 
            'Thunderbird',
            'KeePassXC',
            'keepassxc',
            'signal',
            'Signa',
         }
      },
      properties = {screen = 2, tag = '9'}
   }
end)
