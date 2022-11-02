local get_section_factory = require('vacuumline.section_factory')
local options = require('vacuumline.options')
local util = require('vacuumline.util')

local sections = {
  left = {
    active = {
      'mode',
      'file',
      'vcs'
    },
    inactive = {
      'file'
    },
  },
  right = {
    active = {
      'lsp',
      'search',
      'lines',
      'diagnostics',
      'scroll',
    },
    inactive = {
      'lines',
      'scroll',
    },
  }
}

-- Return an internal representation of the statusline
return function(config)
  -- TODO: need to know the order ahead of time for access to `next` config
  -- local active_config = options.format_sections(active_sections, config)
  -- local inactive_config = options.format_sections(inactive_sections, config)
  local active_config = config
  local inactive_config = config

  local active_sections = get_section_factory(active_config.segments)
  local inactive_sections = get_section_factory(inactive_config.segments)

  return {
    sections = {
      left = {
        active = {
          -- make_section_group('mode', 'file', 'vcs') -- TODO
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
