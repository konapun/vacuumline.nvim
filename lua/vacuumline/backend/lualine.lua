local backend = require('lualine')
local statusline = require('vacuumline.backend.lualine.statusline')
local winbar = require('vacuumline.backend.lualine.winbar')

local function build_lualine(config)
  return {
    options = {
      component_separators = { left = config.separator.section.left, right = config.separator.section.right },
      section_separators = { left = config.separator.segment.left, right = config.separator.segment.right },
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = config.colors.foreground.line, bg = config.colors.background.line } },
        inactive = { c = { fg = config.colors.foreground.line, bg = config.colors.background.line } }, -- FIXME
      },
    },
    sections = {
      -- Remove defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},

      -- Left and right sections for appending
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- Remove defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},

      -- Left and right sections for appending
      lualine_c = {},
      lualine_x = {},
    },
  }
end

return function(config)
  local lualine = build_lualine(config)

  local api = {
    statusline = statusline(lualine, config),
    winbar = winbar(lualine),
  }

  return {
    setup = function(build)
      build(api)
      backend.setup(lualine)
    end
  }
end
