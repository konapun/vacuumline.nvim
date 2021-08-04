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
  line             = {foreground = palette.green, background = palette.black},
  segment_odd      = {foreground = palette.black, background = palette.purple},
  segment_even     = {foreground = palette.black, background = palette.green},
  mode_normal      = {foreground = palette.purple},
  mode_insert      = {foreground = palette.green},
  mode_command     = {foreground = palette.blue},
  mode_visual      = {foreground = palette.yellow},
  mode_visual_line = {foreground = palette.cyan},
  mode_terminal    = {foreground = palette.red},
  warning          = {foreground = palette.black, background = palette.bright_yellow},
  error            = {foreground = palette.black, background = palette.bright_red},
  scroll           = {foreground = palette.yellow}
}

return theme
