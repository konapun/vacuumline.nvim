local conditions = require('vacuumline.condition')

local function identity(value)
  return value
end

-- This is vacuumline's internal representation of a segment
-- The backend statusline API is responsible for transforming a vacuumline segment into its backend-specific equivalent
return function(definition)
  local color = definition.color or {}
  local separator = definition.separator or {}

  -- FIXME: better defaults
  local segment = {
    id = definition.id,
    provider = definition.provider,
    formatter = definition.formatter or identity,
    condition = definition.condition or nil,
    icon = definition.icon or nil, -- FIXME: is this needed? Is there a lualine equivalent?
    color = {
      foreground = color.foreground or '#ffffff',
      background = color.background or '#000000',
      style = color.style or nil,
    },
    separator = {
      symbol = separator.symbol,
      foreground = separator.foreground or '#ffffff',
      background = separator.background or '#000000',
    },
  }

  local function add_condition(condition)
    segment.condition = conditions.combine(segment.condition, condition)
  end

  return {
    definition = segment,
    add_condition = add_condition,
  }
end
