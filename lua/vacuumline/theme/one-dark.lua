local palette = {
  black  = '#282c34',
  red    = '#e06c75',
  green  = '#98c379',
  yellow = '#e5c07b',
  blue   = '#61afef',
  purple = '#c678dd',
  cyan   = '#56b6c2',
  white  = '#abb2bf'
}

local theme = {
  line             = {foreground = palette.green, background = palette.black},
  segment_odd      = {foreground = palette.black, background = palette.green},
  segment_even     = {foreground = palette.black, background = palette.blue},
  mode_normal      = {foreground = palette.green},
  mode_insert      = {foreground = palette.purple},
  mode_command     = {foreground = palette.blue},
  mode_visual      = {foreground = palette.yellow},
  mode_visual_line = {foreground = palette.cyan},
  mode_terminal    = {foreground = palette.red},
  hint             = {foreground = palette.black, background = palette.green},
  info             = {foreground = palette.black, background = palette.blue},
  warning          = {foreground = palette.black, background = palette.yellow},
  error            = {foreground = palette.black, background = palette.red},
  scroll           = {foreground = palette.yellow}
}
return theme
