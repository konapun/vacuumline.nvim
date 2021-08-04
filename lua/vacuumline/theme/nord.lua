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
