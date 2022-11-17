-- Initialize a segment builder with the provided theme
return function(segment)
  local providers = get_providers(config)

  return function(segment, status)
    local color = segment.color
    local separator = segment.separator -- FIXME: I don't think lualine needs this
    local provider = providers[segment.provider]

    -- format is prodvider
    return {
      provider,
      icon = segment.icon, -- FIXME: Is this needed?
      color = {
        fg = segment.colors.foreground[status],
        bg = segment.colors.background[status],
      },
    }
  end
end
