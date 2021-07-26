local M = {}

local palette = {
  background = '#282828',
  foreground = '#ebdbb2',
  accent     = '#b8bb26',
  black      = '#282828',
  red        = '#cc241d',
  green      = '#98971a',
  yellow     = '#d79921',
  blue       = '#458588',
  purple     = '#b16286',
  cyan       = '#689d6a',
  white      = '#a89984',
  bright_black = '#928374',
  bright_red   = '#fb4934',
  bright_green = '#b8bb26',
  bright_yellow = '#fabd2f',
  bright_blue   = '#83a598',
  bright_purple = '#d3869b',
  bright_cyan   = '#8ec07c',
  bright_white  = '#ebdbb2'
}

-- Perform a one dimensional merge over two tables
local function merge(t1, t2)
  local merged = {}
  for k,v in pairs(t1) do
    merged[k] = v
  end
  for k,v in pairs(t2) do
    merged[k] = v
  end

  return merged
end

local separator_left = ''
local separator_right = ''

--[[
Configure and format vacuumline options based on user input
--]]
function M.format(opts, sections)
  local standard_config = {
    enabled = true
  }

  -- TODO: each section should have a .next pointer
  return {
    mode = merge(standard_config, {
      background = palette.purple,
      foreground = palette.background,
      separator = separator_left,
      map = {
        n      = {text = ' ', background = palette.purple}, -- NORMAL
        i      = {text = ' ', background = palette.green}, -- INSERT
        c      = {text = ' ', background = palette.blue}, -- COMMAND
        v      = {text = ' ', background = palette.yellow}, -- VISUAL
        V      = {text = ' ', background = palette.bright_yellow}, -- VISUAL LINE
        ['^V'] = {text = ' ', background = palette.cyan}, -- VISUAL BLOCK
        t      = {text = ' ', background = palette.bright_purple}, -- TERMINAL
        -- TODO
        no     = {text = 'no', background = palette.bright_yellow},
        s      = {text = 's', background = palette.bright_red},
        S      = {text = 'S', background = palette.bright_green},
        [''] = {text = '^S', background = palette.bright_blue},
        ic     = {text = 'ic', background = palette.bright_cyan},
        R      = {text = 'R', background = palette.purple},
        Rv     = {text = 'Rv', background = palette.purple},
        cv     = {text = 'cv', background = palette.purple},
        ce     = {text = 'ce', background = palette.purple},
        r      = {text = 'r', background = palette.purple},
        rm     = {text = 'rm', background = palette.purple},
        ['r?'] = {text = 'r?', background = palette.purple},
        ['!']  = {text = '!', background = palette.purple}
      }
    }),
    file = merge(standard_config, {
      background = palette.green,
      foreground = palette.background,
      separator = separator_left
    }),
    vcs = merge(standard_config, {
      background = palette.purple,
      foreground = palette.background,
      separator = separator_left
    }),
    scroll = merge(standard_config, {
      background = palette.blue,
      foreground = palette.background,
      accent = palette.yellow,
      separator = separator_right
    }),
    lines = merge(standard_config, {
      separator = separator_right
    }),
    diagnostics = merge(standard_config, {
      separator = separator_right,
      errors = {},
      warnings = {}
    }),
    search = merge(standard_config, {
      separator = separator_right,
    }),
    lsp = merge(standard_config, {
      separator = separator_right,
    })
  }
end

return M
