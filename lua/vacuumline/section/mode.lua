local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

-- FIXME: need to pass providers since these are backend-dependent (or should the backend convert this somehow?)
return function(config)
  -- mode color indicator
  local color_indicator = segment({
    id = 'mode_color_indicator',
    provider = providers.mode.color,
    color = {
      foreground = config.background,
      background = config.background,
    },
  })

  -- mode icon indicator
  local icon_indicator = segment({
    id = 'mode_icon_indicator',
    provider = providers.mode.icon,
    color = {
      foreground = config.foreground,
      background = config.background,
      style = 'bold',
    },
    separator = {
      symbol = config.separator,
      foreground = config.foreground,
      background = config.background, -- FIXME - this depends on the next segment
    },
  })

  local mode = section()
  mode.add_segment(color_indicator)
  mode.add_segment(icon_indicator)

  return mode
end
