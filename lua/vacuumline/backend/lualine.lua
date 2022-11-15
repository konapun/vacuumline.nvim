local lualine = require('lualine')
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
        normal = { c = { fg = config.color.foreground.line, bg = config.color.background.line } },
        inactive = { c = { fg = config.color.foreground.line, bg = config.color.background.line } }, -- FIXME
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }
end

return function(config)
  local lualine_config = build_lualine(config)

  print('USING LUALINE BACKEND')
  return {
    statusline = statusline(lualine_config),
    winbar = winbar(lualine_config),
  }
end
