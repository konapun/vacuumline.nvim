-- Given a list of condition functions, return a single function that executes all conditions
local function combine_conditions(conditions)
  return function()
    for _, condition in ipairs(conditions) do
      if not condition() then
        return false
      end
    end
    return true
  end
end

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

  return {
    definition = segment,
    add_condition = function(condition)
      segment.condition = condition --combine_conditions({ segment.condition, condition }) FIXME: add this back
    end,
    add_behavior = function(behavior, fn)
      -- TODO
      if behavior == 'shrink' then
        behaviors.shrink = fn
      elseif behavior == 'grow' then
      end
      behaviors.grow = fn
    end,
  }
end
