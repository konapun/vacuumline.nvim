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
  background = palette.black,
  foreground = palette.green,
  accent     = palette.yellow,
  segment_odd_background  = palette.green,
  segment_odd_foreground  = palette.black,
  segment_even_background = palette.blue,
  segment_even_foreground = palette.black,
  mode_normal      = palette.green,
  mode_insert      = palette.purple,
  mode_command     = palette.blue,
  mode_visual      = palette.yellow,
  mode_visual_line = palette.cyan,
  mode_terminal    = palette.red,
  warning_foreground = palette.black,
  warning_background = palette.yellow,
  error_foreground = palette.black,
  error_background = palette.red
}

return theme
