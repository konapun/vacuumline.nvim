local gruvbox_theme = require('vacuumline.theme.gruvbox')

local M = {}

--TODO: Put short config in options instead of hardcoding in segments
--  Keep passing mode but use it as key

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
      foreground = {line = theme.foreground, even = theme.segment_even_foreground, odd = theme.segment_odd_foreground},
      background = {line = theme.background, even = theme.segment_even_background, odd = theme.segment_odd_background}
    },
    segment = {
      mode = {
        map = {
          n = {label = ' ', background = theme.mode_normal}, -- NORMAL
          i = {label = ' ', background = theme.mode_insert}, -- INSERT
          c = {label = ' ', background = theme.mode_command}, -- COMMAND
          v = {label = ' ', background = theme.mode_visual}, -- VISUAL
          V = {label = ' ', background = theme.mode_visual_line}, -- VISUAL LINE
          t = {label = ' ', background = theme.mode_terminal}, -- TERMINAL
        }
      },
      file = {},
      vcs = {},
      scroll = {
        accent = theme.accent
      },
      lines = {},
      diagnostics = {
        background = theme.error_background,
        errors = {
          foreground = theme.error_foreground,
          background = theme.error_background
        },
        warnings = {
          foreground = theme.warning_foreground,
          background = theme.warning_background
        }
      },
      search = {},
      lsp = {
        foreground = theme.foreground,
        background = theme.background
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

-- Configure and format vacuumline options based on user input
function M.format(opts, segments)
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
  -- FIXME: clean this up
  -- TODO: do the same thing for short segments
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
