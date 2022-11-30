local conditions = require('vacuumline.condition')

local function identity(value)
  return value
end

-- This is vacuumline's internal representation of a segment
-- The backend statusline API is responsible for transforming a vacuumline segment into its backend-specific equivalent
return function(definition)
  local color = definition.color or {}
  local separator = definition.separator or {}
  local cache = {
    size = 0
  }

  -- cache the length of the rendered segment for size calculation
  local function enhance_formatter(formatter)
    return function(provider)
      local format = formatter(provider)
      return function(...)
        local value = format(...)
        if value then
          cache.size = #value
        end

        return value
      end
    end
  end

  local function get_size()
    return cache.size
  end

  -- FIXME: better defaults
  local segment = {
    id = definition.id,
    provider = definition.provider,
    formatter = enhance_formatter(definition.formatter or identity),
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
    get_size = get_size,
  }
end
