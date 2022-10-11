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
  return {
    provider = definition.provider,
    condition = definition.condition or function() end,
    foreground = definition.foreground,
    background = definition.background,
    separator = definition.separator.symbol,
    separator_foreground = definition.separator.foreground,
    separator_background = definition.seprator.background,
  }
end
