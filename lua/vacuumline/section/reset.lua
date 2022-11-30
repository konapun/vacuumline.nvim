local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(config)
  local reset = segment({
    id = 'reset',
    provider = providers.noop,
    color = {
      foreground = config.foreground,
      background = config.background,
    }
  })

  return section({ reset })
end
