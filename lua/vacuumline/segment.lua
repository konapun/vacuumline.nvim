-- The segment observer surfaces resize events to the segment
local segment_observer = function(segment)
  return {
    resize = function(size)
      segment.resize(size) -- TODO
    end,
  }
end

-- This is vacuumline's internal representation of a segment
-- The backend statusline API is responsible for transforming a vacuumline segment into its backend-specific equivalent
--
-- Segment types
-- - active
-- - inactive
-- Segment positions
-- - left
-- - right
-- Segment size
-- - short
-- - long
return function(definition)
  local color = definition.color or {}
  local separator = definition.separator or {}

  local segment = {
    id = definition.id,
    provider = definition.provider,
    condition = definition.condition or function() end,
    icon = definition.icon or nil, -- FIXME: is this needed? Is there a lualine equivalent?
    color = {
      foreground = color.foreground,
      background = color.background,
      style = color.style or nil,
    },
    separator = {
      symbol = separator.symbol or nil,
      foreground = separator.foreground or nil,
      background = separator.background or nil,
    },
  }

  local conditions = {}
  local behaviors = {}

  return {
    definition = segment,
    add_condition = function(condition)
      -- TODO
      table.insert(conditions, condition)
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
