local palette = {
  black         = '#1a1b26',
  red           = '#e06c75',
  green         = '#98c379',
  yellow        = '#d19a66',
  blue          = '#61afef',
  purple        = '#c678dd',
  cyan          = '#56b6c2',
  white         = '#bbc2cf',
  bright_black  = '#5c6370',
  bright_red    = '#e06c75',
  bright_green  = '#98c379',
  bright_yellow = '#d19a66',
  bright_blue   = '#61afef',
  bright_purple = '#c678dd',
  bright_cyan   = '#56b6c2',
  bright_white  = '#ffffff',
  background    = '#24283b',
  foreground    = '#bbc2cf'
}

local theme = {
  line             = {foreground = palette.white, background = palette.black},
  segment_odd      = {foreground = palette.black, background = palette.cyan},
  segment_even     = {foreground = palette.black, background = palette.blue},
  mode_normal      = {foreground = palette.cyan},
  mode_insert      = {foreground = palette.green},
  mode_command     = {foreground = palette.blue},
  mode_visual      = {foreground = palette.yellow},
  mode_visual_line = {foreground = palette.purple},
  mode_terminal    = {foreground = palette.red},
  warning          = {foreground = palette.black, background = palette.bright_yellow},
  error            = {foreground = palette.black, background = palette.bright_red},
  scroll           = {foreground = palette.purple}
}

return theme
