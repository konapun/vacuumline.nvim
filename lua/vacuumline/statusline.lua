local section_factory = require('vacuumline.section_factory')
local options = require('vacuumline.options')
local util = require('vacuumline.util')

local sections = {
  left = {
    active = {
      section_factory.mode(),
      section_factory.file(),
      section_factory.vcs()
    },
    inactive = {
      section_factory.file()
    }
  },
  right = {
    active = {
      section_factory.lsp(),
      section_factory.search(),
      section_factory.lines(),
      section_factory.diagnostics(),
      section_factory.scroll()
    },
    inactive = {
      section_factory.lines(),
      section_factory.scroll()
    }
  }
}

local function build_side(sctns, config)
  return util.map(sctns, function(section)
    local generator = section[2]
    return generator(config)
  end)
end

-- Return an internal representation of the statusline
return function(config)
  local left_active_config = options.format_sections(sections.left.active, config.active)
  local left_inactive_config = options.format_sections(sections.left.inactive, config.inactive)
  local right_active_config = options.format_sections(sections.right.active, config.active)
  local right_inactive_config = options.format_sections(sections.right.inactive, config.inactive)

  print('Got left active config (dynamic):', vim.inspect(left_active_config))
  return {
    sections = {
      left = {
        active = build_side(sections.left.active, left_active_config),
        inactive = build_side(sections.left.inactive, left_inactive_config)
      },
      right = {
        active = build_side(sections.right.active, right_active_config),
        inactive = build_side(sections.right.inactive, right_inactive_config)
      }
    }
  }
end
