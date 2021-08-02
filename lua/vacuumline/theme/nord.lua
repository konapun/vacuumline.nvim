local palette = {
  black         = '#3b4252',
  red           = '#bf616a',
  green         = '#a3be8c',
  yellow        = '#ebcb8b',
  blue          = '#81a1c1',
  purple        = '#b48ead',
  cyan          = '#88c0d0',
  white         = '#e5e9f0',
  bright_black  = '#4c566a',
  bright_red    = '#bf616a',
  bright_green  = '#a3be8c',
  bright_yellow = '#ebcb8b',
  bright_blue   = '#81a1c1',
  bright_purple = '#b48ead',
  bright_cyan   = '#8fbcbb',
  bright_white  = '#eceff4',
  background    = '#2e3440',
  foreground    = '#d8dee9'
}

local theme = {
  background = palette.black,
  foreground = palette.white,
  accent     = palette.purple,
  segment_odd_background  = palette.cyan,
  segment_odd_foreground  = palette.black,
  segment_even_background = palette.blue,
  segment_even_foreground = palette.black,
  mode_normal      = palette.cyan,
  mode_insert      = palette.green,
  mode_command     = palette.blue,
  mode_visual      = palette.yellow,
  mode_visual_line = palette.purple,
  mode_terminal    = palette.red,
  warning_foreground = palette.black,
  warning_background = palette.bright_yellow,
  error_foreground = palette.black,
  error_background = palette.bright_red
}

return theme
