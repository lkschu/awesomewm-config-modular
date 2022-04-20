local _M = {
   terminal = os.getenv('TERMINAL') or 'alacritty',
   editor   = os.getenv('EDITOR')   or 'vim',
   launcher = os.getenv('HOME') .. '/.config/rofi/launchers/misc/launcher.sh'
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
