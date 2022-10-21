local get_section_factory = require('vacuumline.section_factory')

Status = {
  Active = 'active',
  Inactive = 'Inactive'
}

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
          active_sections.format(),
          active_sections.diagnostics(),
          active_sections.scroll(),
        },
        inactive = {
          inactive_sections.format(),
          inactive_sections.scroll(),
        },
      },
    }
  }
end
