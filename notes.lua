--[[
User-facing
- Setup function
-- pass options for configuring sections

Internal
- Config
-- Has global config section
--- alternating background/foreground
--- left/right segment separators
--- left/right section separators
-- Has segment config
--- Takes from global config by default unless specific option for segment
--- Can override config from corresponding sections user-facing config
- Segments
-- Each segment can have subsegments (sections)
--- Optional sub-segment half-separators
-- Segments are partially user-configurable
- Vacuumline
-- The line is made of segments
--]]

require('vacuumline').setup({
  separator = {
    segment = {
      left = '',
      right = ''
    },
    section = {
      left = '',
      right = ''
    }
  },
  color = {
    foreground = {even = '#282828', odd = '#282828'},
    background = {even = '#b16286', odd = '#98971a'},
  },
  segment = {
    mode = {
      enabled = true,
      foreground = '',
      background = '',
      separator = '',
      map = {
        n = {label = '', foreground = '', background = ''},
        i = {label = '', foreground = '', background = ''},
        -- ...
      }
    },
    file = {
      enabled = true,
      foreground = '',
      background = '',
      separator = ''
    },
    vcs = {
      enabled = true,
      foreground = '',
      background = '',
      separator = ''
    },
    scroll = {
      enabled = true,
      foreground = '',
      background = '',
      accent = '',
      separator = ''
    },
    lines = {
      enabled = true,
      foreground = '',
      background = '',
      separator = '',
      half_separator = ''
    },
    diagnostics = {
      enabled = true,
      separator = '',
      errors = {
        foreground = '',
        background = ''
      },
      warnings = {
        foreground = '',
        background = ''
      }
    },
    search = {
      enabled = true,
      foreground = '',
      background = '',
      separator = ''
    },
    lsp = {
      enabled = true,
      foreground = '',
      background = '',
      separator = ''
    }
  }
})
