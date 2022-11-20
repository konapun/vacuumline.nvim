local get_providers = require('vacuumline.backend.lualine.providers')

-- Initialize a segment builder with the provided theme
return function(config)
  local providers = get_providers(config)

  return function(segment)
    local color = segment.color
    local separator = segment.separator
    local provider = providers[segment.provider]

    return {
      provider,
      condition = segment.condition,
      icon = segment.icon, -- FIXME: Is this needed?
      color = function()
        return {
          fg = color.foreground,
          bg = color.background,
        }
      end,
      padding = { left = 0, right = 0 },
      separator = { left = separator.symbol, right = separator.symbol }, -- FIXME
    }
  end
end
