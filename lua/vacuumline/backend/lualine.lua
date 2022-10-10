local statusline = require('backend.lualine.statusline')
local winbar = require('backend.lualine.winbar')

local function build_lualine(config)
  local theme = config.theme
return {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = theme.line.foreground, bg = theme.line.background } }, -- FIXME
      inactive = { c = { fg = theme.line.foreground, bg = theme.line.background } }, -- FIXME
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
  local lualine = build_lualine(config)

  return {
    get_statusline = statusline(lualine),
    get_winbar = winbar(lualine),
  }
end
