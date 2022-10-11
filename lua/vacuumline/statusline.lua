local get_segment_factory = require('vacuumline.segment_factory')

-- Return an internal representation of the statusline
return function(config)
  local theme = config.theme
  local active_config = {
    foreground = theme.active.foreground,
    background = theme.active.background,
  }
  local inactive_config = {
    foreground = theme.inactive.foreground,
    background = theme.inactive.background,
  }

  local active_segments = get_segment_factory(active_config)
  local inactive_segments = get_segment_factory(inactive_config)

  return {
    segments = {
      left = {
        active = {
          active_segments.mode(),
          active_segments.file(),
          active_segments.vcs(),
        },
        inactive = {
          inactive_segments.file(),
        },
      },
      right = {
        active = {
          active_segments.lsp(),
          active_segments.search(),
          active_segments.format(),
          active_segments.diagnostics(),
          active_segments.scroll(),
        },
        inactive = {
          inactive_segments.format(),
          inactive_segments.scroll(),
        },
      },
    }
  }
end
