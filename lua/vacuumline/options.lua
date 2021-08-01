local M = {}

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
    foreground = {line = '#98971a', even = '#282828', odd = '#282828'},
    background = {line = '#282828', even = '#b16286', odd = '#98971a'},
  },
  segment = {
    mode = {
      enabled = true,
      map = { -- TODO
        n = {label = ' ', background = '#b16286'}, -- NORMAL
        i = {label = ' ', background = '#98971a'}, -- INSERT
        c = {label = ' ', background = '#458588'}, -- COMMAND
        v = {label = ' ', background = '#d79921'}, -- VISUAL
        V = {label = ' ', background = '#fabd2f'}, -- VISUAL LINE
        t = {label = ' ', background = '#d3869b'}, -- TERMINAL
        s = {label = 's', background = '#fb4934'},
        S = {label = 'S', background = '#b8bb26'},
        R = {label = 'R', background = '#b16286'},
        r = {label = 'r', background = '#b16286'},
        ce = {label = 'ce', background = '#b16286'},
        cv = {label = 'cv', background = '#b16286'},
        ic = {label = 'ic', background = '#8ec07c'},
        no = {label = 'no', background = '#fabd2f'},
        rm = {label = 'rm', background = '#b16286'},
        Rv = {label = 'Rv', background = '#b16286'},
        ['!'] = {label = '!', background = '#b16286'},
        [''] = {label = '^S', background = '#83a598'},
        ['^V'] = {label = ' ', background = '#680d6a'}, -- VISUAL BLOCK
        ['r?'] = {label = 'r?', background = '#b16286'},
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
      accent = '#d79921',
    },
    lines = {
      enabled = true,
    },
    diagnostics = {
      enabled = true,
      background = '#fb4934',
      errors = {
        foreground = '#282828',
        background = '#fb4934'
      },
      warnings = {
        foreground = '#282828',
        background = '#fabd2f'
      }
    },
    search = {
      enabled = true,
    },
    lsp = {
      enabled = true,
      foreground = '#98971a',
      background = '#282828'
    }
  }
}

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

local function add_dynamic_config(segments, side, static_segment_config, color_config, separator_config)
  local segment_config = {}
  local segment_index = 1
  local incrementor = side == 'left' and 1 or -1

  for _, segment in ipairs(segments) do
    local key = segment.key
    local config = static_segment_config[key]
    local even_odd = segment_index % 2 == 0 and 'even' or 'odd'
    local not_even_odd = segment_index % 2 == 0 and 'odd' or 'even'
    local next = segments[segment_index + incrementor]

    segment_index = segment_index + 1
    segment_config[key] = merge({
      background = key == 'blank' and color_config.background[not_even_odd] or color_config.background[even_odd],
      foreground = key == 'blank' and color_config.foreground[not_even_odd] or color_config.foreground[even_odd],
      separator = separator_config.segment[side],
      next = next and next.key
    }, config)

    return segment_config
  end
end

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

  -- Add in dynamic config defaults
  local segment_config = {}

  local left_segment_index = 1
  for _, segment in ipairs(segments.left) do
    local key = segment.key
    local config = static_segment_config[key]
    local even_odd = left_segment_index % 2 == 0 and 'even' or 'odd'
    local not_even_odd = left_segment_index % 2 == 0 and 'odd' or 'even'
    local next = segments.left[left_segment_index + 1]

    left_segment_index = left_segment_index + 1
    segment_config[key] = merge({
      background = key == 'blank' and color_config.background[not_even_odd] or color_config.background[even_odd],
      foreground = key == 'blank' and color_config.foreground[not_even_odd] or color_config.foreground[even_odd],
      separator = separator_config.segment.left,
      next = next and next.key
    }, config)
  end

  local right_segment_index = 1
  for _, segment in ipairs(segments.right) do
    local key = segment.key
    local config = static_segment_config[key]
    local even_odd = right_segment_index % 2 == 0 and 'even' or 'odd'
    local not_even_odd = right_segment_index % 2 == 0 and 'odd' or 'even'
    local next = segments.right[right_segment_index - 1]

    right_segment_index = right_segment_index + 1
    segment_config[key] = merge({
      background = key == 'blank' and color_config.background[not_even_odd] or color_config.background[even_odd],
      foreground = key == 'blank' and color_config.foreground[not_even_odd] or color_config.foreground[even_odd],
      separator = separator_config.segment.right,
      next = next and next.key
    }, config)
  end

  --[[ return merge(
    add_dynamic_config(segments.left, 'left', static_segment_config, color_config, separator_config),
    add_dynamic_config(segments.right, 'right', static_segment_config, color_config, separator_config)
  ) ]]
  return {
    colors = color_config,
    segments = segment_config
  }
end

return M
