local gruvbox_theme = require('vacuumline.theme.gruvbox')

local function get_default_options(theme)
  return {
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
      foreground = {line = theme.line.foreground, even = theme.segment_even.foreground, odd = theme.segment_odd.foreground},
      background = {line = theme.line.background, even = theme.segment_even.background, odd = theme.segment_odd.background}
    },
    segment = {
      mode = {
        map = {
          n = {label = ' ', background = theme.mode_normal.foreground}, -- NORMAL
          i = {label = ' ', background = theme.mode_insert.foreground}, -- INSERT
          c = {label = ' ', background = theme.mode_command.foreground}, -- COMMAND
          v = {label = ' ', background = theme.mode_visual.foreground}, -- VISUAL
          V = {label = ' ', background = theme.mode_visual_line.foreground}, -- VISUAL LINE
          t = {label = ' ', background = theme.mode_terminal.foreground}, -- TERMINAL
        }
      },
      file = {},
      vcs = {},
      scroll = {
        accent = theme.scroll.foreground
      },
      lines = {},
      diagnostics = {
        background = theme.error.background,
        errors = {
          foreground = theme.error.foreground,
          background = theme.error.background
        },
        warnings = {
          foreground = theme.warning.foreground,
          background = theme.warning.background
        }
      },
      search = {},
      lsp = {
        foreground = theme.line.foreground,
        background = theme.line.background
      }
    }
  }
end

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

-- Add dynamic config values
local function dynamic_config(segments, side, static_segment_config, color_config, separator_config)
  local segment_config = {}
  local increment = side == 'right' and -1 or 1

  local segment_index = 1
  for _, segment in ipairs(segments) do
    local key = segment.key
    local config = static_segment_config[key]
    local even_odd = segment_index % 2 == 0 and 'even' or 'odd'
    local not_even_odd = segment_index % 2 == 0 and 'odd' or 'even'
    local next = segments[segment_index + increment]

    segment_index = segment_index + 1
    segment_config[key] = merge({
      background = key == 'blank' and color_config.background[not_even_odd] or color_config.background[even_odd],
      foreground = key == 'blank' and color_config.foreground[not_even_odd] or color_config.foreground[even_odd],
      separator = separator_config.segment[side],
      section_separator = separator_config.section[side],
      next = next and next.key or key -- reference self if there's no next
    }, config)
  end

  return segment_config
end

-- Configure and format vacuumline options based on user input
return function(opts, segments)
  opts = opts or {separator = {}, color = {}, segment = {}}
  local default_options = get_default_options(opts.theme or gruvbox_theme)

  -- Set up defaults for each config section
  local separator_config = merge(default_options.separator, opts.separator)
  local color_config = merge(default_options.color, opts.color)
  local segment_opts = opts.segment or {}

  local static_segment_config = {
    mode = merge(default_options.segment.mode, segment_opts.mode),
    file = merge(default_options.segment.file, segment_opts.file),
    vcs = merge(default_options.segment.vcs, segment_opts.vcs),
    scroll = merge(default_options.segment.scroll, segment_opts.scroll),
    lines = merge(default_options.segment.lines, segment_opts.lines),
    diagnostics = merge(default_options.segment.diagnostics, segment_opts.diagnostics),
    search = merge(default_options.segment.search, segment_opts.search),
    lsp = merge(default_options.segment.lsp, segment_opts.lsp)
  }

  -- Add in dynamic config defaults
  local left_segments = dynamic_config(segments.left, 'left', static_segment_config, color_config, separator_config)
  local right_segments = dynamic_config(segments.right, 'right', static_segment_config, color_config, separator_config)
  local segment_config = merge(left_segments, right_segments)

  return {
    backend = opts.backend or require('backend.galaxyline'),
    colors = color_config,
    segments = segment_config
  }
end
