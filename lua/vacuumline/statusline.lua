local get_section_factory = require('vacuumline.section_factory')

-- Return an internal representation of the statusline
return function(config)
  local theme = config.colors
  local active_config = {
    foreground = theme.foreground.line,
    background = theme.background.line,
  }
  local inactive_config = {
    foreground = theme.background.line,
    background = theme.foreground.line,
  }

  local active_sections = get_section_factory(active_config)
  local inactive_sections = get_section_factory(inactive_config)

  return {
    sections = {
      left = {
        active = {
          active_sections.mode(),
          active_sections.file(),
          active_sections.vcs(),
        },
        inactive = {
          inactive_sections.file(),
        },
      },
      right = {
        active = {
          active_sections.lsp(),
          active_sections.search(),
          active_sections.lines(),
          active_sections.diagnostics(),
          active_sections.scroll(),
        },
        inactive = {
          inactive_sections.lines(),
          inactive_sections.scroll(),
        },
      },
    }
  }
end
