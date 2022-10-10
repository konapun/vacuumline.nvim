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
return {
  New = function()
    return {
      provider = 'TODO', -- TODO
      condition = function () end, -- TODO
      foreground = '#ffffff', -- TODO
      background = '#000000', -- TODO
      separator = '>', -- TODO
      separator_foreground = '#ffffff', -- TODO
      separator_background = '#000000', -- TODO
    }
  end
}
