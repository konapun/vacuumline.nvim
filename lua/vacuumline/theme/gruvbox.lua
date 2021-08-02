local palette = {
  black         = '#282828',
  red           = '#cc241d',
  green         = '#98971a',
  yellow        = '#d79921',
  blue          = '#458588',
  purple        = '#b16286',
  cyan          = '#689d6a',
  white         = '#a89984',
  bright_black  = '#928374',
  bright_red    = '#fb4934',
  bright_green  = '#b8bb26',
  bright_yellow = '#fabd2f',
  bright_blue   = '#83a598',
  bright_purple = '#d3869b',
  bright_cyan   = '#8ec07c',
  bright_white  = '#ebdbb2',
}

local theme = {
  background = palette.black,
  foreground = palette.green,
  accent     = palette.yellow,
  segment_odd_background  = palette.purple,
  segment_odd_foreground  = palette.black,
  segment_even_background = palette.green,
  segment_even_foreground = palette.black,
  mode_normal      = palette.purple,
  mode_insert      = palette.green,
  mode_command     = palette.blue,
  mode_visual      = palette.yellow,
  mode_visual_line = palette.cyan,
  mode_terminal    = palette.red,
  warning_foreground = palette.black,
  warning_background = palette.bright_yellow,
  error_foreground = palette.black,
  error_background = palette.bright_red
}

return theme
