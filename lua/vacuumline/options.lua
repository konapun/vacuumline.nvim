local M = {}

--TODO: Put short config in options instead of hardcoding in segments
--  Keep passing mode but use it as key

local default_options = {
  separator = {
    segment = {
      left = '',
      right = '',
      short_left = '',
      short_right = ''
    },
    section = {
      left = '',
      right = '',
      short_left = '',
      short_right = ''
    }
  },
  color = {
    foreground = {line = '#98971a', even = '#282828', odd = '#282828', short_even = '#98971a', short_odd = '#98971a'},
    background = {line = '#282828', even = '#b16286', odd = '#98971a', short_even = '#282828', short_odd = '#282828'},
  },
  segment = {
    mode = {
      map = {
        n = {label = ' ', background = '#b16286'}, -- NORMAL
        i = {label = ' ', background = '#98971a'}, -- INSERT
        c = {label = ' ', background = '#458588'}, -- COMMAND
        v = {label = ' ', background = '#d79921'}, -- VISUAL
        V = {label = ' ', background = '#fabd2f'}, -- VISUAL LINE
        t = {label = ' ', background = '#d3869b'}, -- TERMINAL
      }
    },
    file = {},
    vcs = {},
    scroll = {
      accent = '#d79921',
      short_accent = '#98971a'
    },
    lines = {},
    diagnostics = {
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
    search = {},
    lsp = {
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

-- Configure and format vacuumline options based on user input
function M.format(opts, segments)
  opts = opts or {separator = {}, color = {}, segment = {}}

  -- Set up defaults for each config section
  local separator_config = merge(default_options.separator, opts.separator)

  local color_config = merge(default_options.color, opts.color)

  local static_segment_config = {
    mode = merge(default_options.segment.mode, opts.segment.mode),
    file = merge(default_options.segment.file, opts.segment.file),
    vcs = merge(default_options.segment.vcs, opts.segment.vcs),
    scroll = merge(default_options.segment.scroll, opts.segment.scroll),
    lines = merge(default_options.segment.lines, opts.segment.lines),
    diagnostics = merge(default_options.segment.diagnostics, opts.segment.diagnostics),
    search = merge(default_options.segment.search, opts.segment.search),
    lsp = merge(default_options.segment.lsp, opts.segment.lsp)
  }

  -- Add in dynamic config defaults
  -- FIXME: clean this up
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
      section_separator = separator_config.section.left,
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
      section_separator = separator_config.section.right,
      next = next and next.key
    }, config)
  end

  return {
    colors = color_config,
    segments = segment_config
  }
end

return M
