local get_providers = require('vacuumline.backend.galaxyline.providers')
local condition = require('galaxyline.condition')

-- Initialize a segment builder with the provided theme
return function(config)
  local providers = get_providers(config)

  -- Adapt an internal segment into a galaxyline segment
  return function(segment, status)
    local segment_key = segment.id .. '_' .. status

    local color = segment.color
    local separator = segment.separator
    local provider = providers[segment.provider] -- TODO: check for not found errors

    return {
      [segment_key] = {
        provider = segment.formatter(provider), -- FIXME: Do this in vacuumline/segment
        condition = segment.condition,
        icon = segment.icon, -- FIXME: This probably isn't needed since it can be part of the provider
        highlight = { color.foreground, color.background },
        separator = separator.symbol,
        separator_highlight = { separator.foreground, separator.background },
      }
    }
  end
end

