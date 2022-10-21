local segment = require('vacuumline.segment')
local section = require('vacuumline.section')

-- FIXME: need to pass providers since these are backend-dependent (or should the backend convert this somehow?)
return function(providers, theme)
  -- mode color indicator
  local color_indicator = segment({
    id = 'mode_color_indicator',
    provider = providers.mode_color, -- FIXME
    color = {
      foreground = theme.background,
      background = theme.background,
    },
  })

  -- mode icon indicator
  local icon_indicator = segment({
    id = 'mode_icon_indicator',
    provider = providers.mode_icon, -- FIXME
    color = {
      foreground = theme.foreground,
      background = theme.background,
      style = 'bold',
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.foreground,
      background = theme.background, -- FIXME
    },
  })

  local mode = section()

  -- TODO: add shrink/grow behavior to section API
  --- Text truncate behavior
  --- segment show/hide based on available space
  mode.add_segment(color_indicator)
  mode.add_segment(icon_indicator)

  return mode
end
