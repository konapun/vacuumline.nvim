local segment = require('vacuumline.segment')
local section = require('vacuumline.section')

-- FIXME: need to pass providers since these are backend-dependent (or should the backend convert this somehow?)
return function(providers, theme)
  -- mode color indicator
  local color_indicator = segment({
    provider = function()
      -- TODO
    end,
  })

  -- mode icon indicator
  local icon_indicator = segment({
    provider = function()
      -- TODO
    end,
  })

  local mode = section()

  mode.add_segment(color_indicator)
  mode.add_segment(icon_indicator)

  return mode
end

