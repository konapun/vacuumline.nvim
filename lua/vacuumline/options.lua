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

local function get_inactive_config(active_config)
  local active_colors = active_config.colors
  local colors = {
    background = {
      even = active_colors.background.line,
      odd = active_colors.background.line,
      line = active_colors.background.line
    },
    foreground = {
      even = active_colors.background.even,
      odd = active_colors.background.even,
      line = active_colors.foreground.line
    }
  }

  local separator = {
    section = {
      left = '',
      right = ''
    },
    segment = {
      left = '',
      right = ''
    }
  }

  local active_segments = active_config.segments
  local segments = {
    diagnostics = {
      background = colors.background.line,
      errors = {
        foreground = active_segments.diagnostics.errors.background,
        background = colors.background.line
      },
      warnings = {
        foreground = active_segments.diagnostics.warnings.background,
        background = colors.background.line
      },
      info = {
        foreground = active_segments.diagnostics.info.background,
        background = colors.background.line
      },
      hint = {
        foreground = active_segments.diagnostics.hint.background,
        background = colors.background.line
      }
    },
    file = active_segments.file,
    lines = active_segments.lines,
    lsp = active_segments.lsp,
    mode = active_segments.mode,
    scroll = active_segments.scroll,
    search = active_segments.search,
    vcs = active_segments.vcs
  }

  return {
    colors = colors,
    separator = separator,
    segments = segments
  }
end

local function index_segments(segments)
  local indexed_segments = {}
  for _, segment in ipairs(segments) do
    local key = segment[1]
    local gen = segment[2]

    indexed_segments[key] = gen
  end
  return indexed_segments
end

-- Add dynamic config values
local function dynamic_config(segments, side, static_section_config, color_config, separator_config)
  local segment_config = {}
  local increment = side == 'right' and -1 or 1

  local segment_index = 1 -- track index manually since it can go backwards
  for _, segment in ipairs(segments) do
    local key = segment[1]
    local config = static_section_config[key]
    local even_odd = segment_index % 2 == 0 and 'even' or 'odd'
    local not_even_odd = segment_index % 2 == 0 and 'odd' or 'even'
    local next = segments[segment_index + increment] -- key, generator

    segment_index = segment_index + 1
    segment_config[key] = util.merge({
      background = key == 'blank' and color_config.background[not_even_odd] or color_config.background[even_odd],
      foreground = key == 'blank' and color_config.foreground[not_even_odd] or color_config.foreground[even_odd],
      separator = separator_config.segment[side],
      section_separator = separator_config.section[side],
      next = next and next[1] or nil -- reference self if there's no next
    }, config)
  end

  -- link next segments
  local indexed_segments = index_segments(segments)
  for key, config in pairs(segment_config) do
    local next = config.next and segment_config[config.next] or {foreground = '#ff0000', background = '#282828'} -- FIXME: get this from default options

    config.next_background = function()
      local next_key = config.next
      while next_key ~= nil do
        local section = indexed_segments[next_key]
        -- TODO: test section condition (but the section function isn't called yet! need to figure out how to track initialized sections)
        next_key = nil
      end
      return next.background
    end
    -- config.next = next
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

  local active_config = {
      colors = color_config,
      separator = separator_config,
      segments = segment_config
  }
  local inactive_config = get_inactive_config(active_config)

  return {
    backend = opts.backend or require('vacuumline.backend.galaxyline'),
    active = active_config,
    inactive = inactive_config,
    colors = color_config,
    separator = separator_config,
    segments = segment_config
  }
end

-- generate a dynamic section config for alternating colors, separators, etc
local function format_sections(sections, side, options)
  local static_section_config = options.segments
  local color_config = options.colors
  local separator_config = options.separator

  return dynamic_config(sections, side, static_section_config, color_config, separator_config) -- FIXME: pass configuration with side rather than separately?
end

return {
  format_options = format_options,
  format_sections = format_sections,
}
