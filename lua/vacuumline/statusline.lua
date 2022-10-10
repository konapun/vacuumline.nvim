local segments = require('vacuumline.segment_factory')

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

  return {
    segments = {
      left = {
        active = {
          segments.mode(active_config),
          segments.file(active_config),
          segments.vcs(active_config),
        },
        inactive = {},
      },
      right = {
        active = {
          segments.lsp(active_config),
          segments.search(active_config),
          segments.format(active_config),
          segments.diagnostics(active_config),
          segments.scroll(active_config),
        },
        inactive = {
          segments.format(inactive_config),
          segments.scroll(inactive_config),
        },
      },
    }
  }

end
