local M = {}

-- Perform a one dimensional merge over two tables
local function merge(t1, t2)
  local merged = {}
  for k,v in pairs(t1) do
    merged[k] = v
  end

  if t2 then
    for k,v in pairs(t2) do
      merged[k] = v
    end
  end

  return merged
end

local default_options = {
  separator = {
    segment = {
      left = '',
      right = ''
    },
    section = {
      left = '',
      right = ''
    }
  },
  color = {
    foreground = {even = '#282828', odd = '#282828'},
    background = {even = '#b16286', odd = '#98971a'},
  },
  segment = {
    mode = {
      enabled = true,
      map = { -- TODO
        n = {text = ' ', background = '#b16286'}, -- NORMAL
        i = {text = ' ', background = '#98971a'}, -- INSERT
        c = {text = ' ', background = '#458588'}, -- COMMAND
        v = {text = ' ', background = '#d79921'}, -- VISUAL
        V = {text = ' ', background = '#fabd2f'}, -- VISUAL LINE
        t = {text = ' ', background = '#d3869b'}, -- TERMINAL
        s = {text = 's', background = '#fb4934'},
        S = {text = 'S', background = '#b8bb26'},
        R = {text = 'R', background = '#b16286'},
        r = {text = 'r', background = '#b16286'},
        ce = {text = 'ce', background = '#b16286'},
        cv = {text = 'cv', background = '#b16286'},
        ic = {text = 'ic', background = '#8ec07c'},
        no = {text = 'no', background = '#fabd2f'},
        rm = {text = 'rm', background = '#b16286'},
        Rv = {text = 'Rv', background = '#b16286'},
        ['!'] = {text = '!', background = '#b16286'},
        [''] = {text = '^S', background = '#83a598'},
        ['^V'] = {text = ' ', background = '#680d6a'}, -- VISUAL BLOCK
        ['r?'] = {text = 'r?', background = '#b16286'},
      }
    },
    file = {
      enabled = true,
    },
    vcs = {
      enabled = true,
    },
    scroll = {
      enabled = true,
      foreground = '',
      background = '',
      accent = '',
    },
    lines = {
      enabled = true,
    },
    diagnostics = {
      enabled = true,
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
    },
    lsp = {
      enabled = true,
    }
  }
}

-- Configure and format vacuumline options based on user input
function M.format(opts, segments)
  opts = opts or {separator = {}, color = {}, segment = {}}

  -- Set up defaults for each config section
  local separator_config = merge(default_options.separator, opts.separator)

  local color_config = merge(default_options.color, opts.color)

  local static_segment_config = {
    mode = merge(default_options.segment.mode, {}),
    file = merge(default_options.segment.file, {}),
    vcs = merge(default_options.segment.vcs, {}),
    scroll = merge(default_options.segment.scroll, {}),
    lines = merge(default_options.segment.lines, {}),
    diagnostics = merge(default_options.segment.diagnostics, {}),
    search = merge(default_options.segment.search, {}),
    lsp = merge(default_options.segment.lsp, {})
  }

  -- print(inspect(static_segment_config))

  -- Add in dynamic config defaults
  --[[
  TODO: construct segment config:
  - take default config for each segment
  - add in computed defaults:
  -- background color (depending on even/odd)
  -- foreground color (depending on even/odd)
  -- separators (based on whether it's left/right)
  -- next pointer (left to right for left side, right to left for right side)
  - merge with user config, allowing user config to overwrite any parts
  --]]

  local segment_config = {}
  local segment_index = 1
  for _, segment in ipairs(segments.left) do
    local key = segment.key
    local config = static_segment_config[key]
    local even_odd = segment_index % 2 == 0 and 'even' or 'odd'
    local next = segments.left[segment_index + 1]

    segment_index = segment_index + 1
    segment_config[key] = merge({
      background = color_config.background[even_odd],
      foreground = color_config.foreground[even_odd],
      separator = separator_config.segment.left, -- FIXME
      next = next and next.key
    }, config)
  end
  -- TODO: right side

  return segment_config
end

return M
