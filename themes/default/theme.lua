---------------------------
-- Default awesome theme --
---------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.xforeground = xrdb.foreground or "#d8dee9"
theme.xbackground = xrdb.background or "#2e2d2c"

-- theme.xcolor0 =  "#3b4252"
theme.xcolor0 = xrdb.color0 or "#313745"
theme.xcolor8 = xrdb.color8 or "#4c566a"
theme.xcolor1 = xrdb.color1 or "#9c4a33"
theme.xcolor9 = xrdb.color9 or "#bf616a"
theme.xcolor2 = xrdb.color2 or "#6d9b22"
theme.xcolor10 = xrdb.color10 or "#8ec090"
theme.xcolor3 = xrdb.color3 or "#f0905c"
theme.xcolor11 = xrdb.color11 or "#ebcb8b"
theme.xcolor4 = xrdb.color4 or "#5e89af"
theme.xcolor12 = xrdb.color12 or "#81a1c1"
theme.xcolor5 = xrdb.color5 or "#977bbb"
theme.xcolor13 = xrdb.color13 or "#b48ead"
theme.xcolor6 = xrdb.color6 or "#79beb4"
theme.xcolor14 = xrdb.color14 or "#7ccde4"
theme.xcolor7 = xrdb.color7 or "#a4a9b3"
theme.xcolor15 = xrdb.color15 or "#eceff4"

theme.xforeground = "#d8dee9"
theme.xbackground = "#2e2d2c"
theme.xbackground = "#2b2a29"
theme.xcolor0 = "#3b4252"
theme.xcolor8 = "#4c566a"
theme.xcolor1 = "#bf616a"
theme.xcolor9 = "#bf616a"
theme.xcolor2 = "#a3be6c"
theme.xcolor10 = "#8ec090"
theme.xcolor3 = "#d08770"
theme.xcolor11 = "#ebcb8b"
theme.xcolor4 = "#5e81ac"
theme.xcolor12 = "#81a1c1"
theme.xcolor5 = "#b48ead"
theme.xcolor13 = "#b48ead"
theme.xcolor6 = "#88c0d0"
theme.xcolor14 = "#8fbcbb"
theme.xcolor7 = "#c1c9ff"
theme.xcolor15 = "#eceff4"

theme.xforeground = "#B3BBC8"
theme.xbackground = "#26282A"
theme.xcolor0 = "#090C13"
theme.xcolor8 = "#4E586B"
theme.xcolor1 = "#9E2323"
theme.xcolor9 = "#CC4D5A"
theme.xcolor2 = "#408513"
theme.xcolor10 = "#6C996E"
theme.xcolor3 = "#DD6C49"
theme.xcolor11 = "#F0BB28"
theme.xcolor4 = "#2B85F3"
theme.xcolor12 = "#6EABE9"
theme.xcolor5 = "#FF4ADE"
theme.xcolor13 = "#853075"
theme.xcolor6 = "#35D3FF"
theme.xcolor14 = "#419998"
theme.xcolor7 = "#B1DDEE"
theme.xcolor15 = "#FDFFF0"

-- 00 "#2e3440"
-- 01 "#3b4252"
-- 02 "#434c5e"
-- 03 "#4c566a"
-- 04 "#d8dee9"
-- 05 "#e5e9f0"
-- 06 "#eceff4"
-- 07 "#8fbcbb"
-- 08 "#88c0d0"
-- 09 "#81a1c1"
-- 10 "#5e81ac"
-- 11 "#bf616a"
-- 12 "#d08770"
-- 13 "#ebcb8b"
-- 14 "#a3be8c"
-- 15 "#b48ead"

-- theme.font          = "BlexNerd Font Mono 9"
-- theme.font          = "FiraCode Nerd Font 8"
-- theme.font          = "VictorMono Nerd Font 12"
theme.font = "monofur Nerd Font 12"
theme.useless_gap = dpi(4)
theme.border_width = dpi(5)

-- -- Defaults
-- theme.bg_normal     = "#222222"
-- theme.bg_focus      = "#535d6c"
-- theme.bg_urgent     = "#ff0000"
-- theme.bg_minimize   = "#444444"
-- theme.bg_systray    = theme.bg_normal
--
-- theme.fg_normal     = "#aaaaaa"
-- theme.fg_focus      = "#ffffff"
-- theme.fg_urgent     = "#ffffff"
-- theme.fg_minimize   = "#ffffff"
--
-- theme.border_color_normal = "#000000"
-- theme.border_color_active = "#535d6c"
-- theme.border_color_marked = "#91231c"

-- own config
theme.bg_normal = theme.xcolor8
theme.bg_focus = theme.xcolor12
theme.bg_urgent = theme.xcolor1
theme.bg_minimize = theme.xbackground
theme.bg_systray = theme.bg_normal

theme.fg_normal = theme.xforeground
theme.fg_focus = theme.xcolor15
theme.fg_urgent = theme.xcolor15
theme.fg_minimize = theme.xcolor8

-- theme.taglist_fg_normal = '#ff0000' or theme.fg_focus
theme.taglist_fg_empty = theme.fg_normal
theme.taglist_fg_occupied = theme.fg_normal
theme.taglist_fg_focus = theme.xcolor15
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_bg_occupied = theme.xbackground

theme.border_color_normal = theme.bg_normal
theme.border_color_normal = theme.xbackground
theme.border_color_active = theme.bg_focus
theme.border_color_active = theme.xcolor12
theme.border_color_marked = "#EE2DFF"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

-- -- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

theme.icons = {}
icons_path = os.getenv("HOME") .. "/.config/awesome/themes/default/icons/"
theme.icons.terminal = icons_path .. "feather/terminal.svg"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

-- theme.wallpaper = "/home/lks/.config/awesome/themes/default/forest.jpeg"
theme.wallpaper = "/home/lks/.config/awesome/themes/default/background_stalman.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule = {
            urgency = 'critical'
        },
        properties = {
            bg = '#ff0000',
            fg = '#ffffff'
        }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
