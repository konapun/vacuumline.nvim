local segment = require('vacuumline.segment')
local section = require('vacuumline.section')

-- FIXME: need to pass providers since these are backend-dependent (or should the backend convert this somehow?)
return function(providers, theme)
  -- mode color indicator
  local color_indicator = segment({
    provider = providers.mode_color,
    condition = 'TODO',
    foreground = 'TODO',
    background = 'TODO',
    separator = 'TODO',
    separator_foreground = 'TODO',
    separator_background = 'TODO',
  })
  color_indicator.add_condition(function()
    -- TODO
  end)

  -- mode icon indicator
  local icon_indicator = segment({
    provider = providers.mode_icon,
  })

  local mode = section()

  -- TODO: add shrink/grow behavior to section API
  --- Text truncate behavior
  --- segment show/hide based on available space
  mode.add_segment(color_indicator)
  mode.add_segment(icon_indicator)

  return mode
end

