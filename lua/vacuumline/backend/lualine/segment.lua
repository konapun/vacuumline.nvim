local get_providers = require('vacuumline.backend.lualine.providers')

-- Initialize a segment builder with the provided theme
return function(config)
  local providers = get_providers(config)

  return function(segment)
    local color = segment.color
    local separator = segment.separator -- FIXME: I don't think lualine needs this
    local provider = providers[segment.provider]

    -- format is prodvider
    return {
      provider,
      condition = segment.condition,
      icon = segment.icon, -- FIXME: Is this needed?
      color = {
        fg = color.foreground,
        bg = color.background,
      },
      -- TODO: separator config per segment?
      separator = separator.symbol,
    }
  end
end
