local util = require('vacuumline.util')
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
      foreground = { line = theme.line.foreground, even = theme.segment_even.foreground,
        odd = theme.segment_odd.foreground },
      background = { line = theme.line.background, even = theme.segment_even.background,
        odd = theme.segment_odd.background }
    },
    segment = {
      mode = {
        map = {
          n = { label = ' ', background = theme.mode_normal.foreground }, -- NORMAL
          i = { label = ' ', background = theme.mode_insert.foreground }, -- INSERT
          c = { label = ' ', background = theme.mode_command.foreground }, -- COMMAND
          v = { label = ' ', background = theme.mode_visual.foreground }, -- VISUAL
          V = { label = ' ', background = theme.mode_visual_line.foreground }, -- VISUAL LINE
          t = { label = ' ', background = theme.mode_terminal.foreground }, -- TERMINAL
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
        },
        info = {
          foreground = theme.info.foreground,
          background = theme.info.background
        },
        hint = {
          foreground = theme.hint.foreground,
          background = theme.hint.background
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

-- Add dynamic config values
-- TODO: should we generate named configs for each section? (theme.search.foreground, theme.search.background, etc)
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
    segment_config[key] = util.merge({
      background = key == 'blank' and color_config.background[not_even_odd] or color_config.background[even_odd],
      foreground = key == 'blank' and color_config.foreground[not_even_odd] or color_config.foreground[even_odd],
      separator = separator_config.segment[side],
      section_separator = separator_config.section[side],
      next = next and next.key or key -- reference self if there's no next
    }, config)
  end

  return segment_config
end

-- apply user configs over default options
local function format_options(options)
  local opts = options or { separator = {}, color = {}, segment = {} }
  local default_options = get_default_options(opts.theme or gruvbox_theme)

  -- Set up defaults for each config section
  local separator_config = util.merge(default_options.separator, opts.separator)
  local color_config = util.merge(default_options.color, opts.color)

  local segment_opts = opts.segment or {}
  local segment_config = {
    mode = util.merge(default_options.segment.mode, segment_opts.mode),
    file = util.merge(default_options.segment.file, segment_opts.file),
    vcs = util.merge(default_options.segment.vcs, segment_opts.vcs),
    scroll = util.merge(default_options.segment.scroll, segment_opts.scroll),
    lines = util.merge(default_options.segment.lines, segment_opts.lines),
    diagnostics = util.merge(default_options.segment.diagnostics, segment_opts.diagnostics),
    search = util.merge(default_options.segment.search, segment_opts.search),
    lsp = util.merge(default_options.segment.lsp, segment_opts.lsp)
  }

  return {
    backend = opts.backend or require('vacuumline.backend.galaxyline'),
    colors = color_config,
    separator = separator_config,
    segments = segment_config
  }
end

-- generate a dynamic section config for alternating colors, separators, etc
local function format_segments(segments, options)
  local static_segment_config = options.segments
  local color_config = options.colors
  local separator_config = options.separator

  local left_segments = dynamic_config(segments.left, 'left', static_segment_config, color_config, separator_config)
  local right_segments = dynamic_config(segments.right, 'right', static_segment_config, color_config, separator_config)
  local segment_config = util.merge(left_segments, right_segments)

  return segment_config
end

return {
  format_options = format_options,
  format_segments = format_segments,
}
