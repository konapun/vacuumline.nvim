local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

-- TODO: Conditions
return function(config)
  -- file icon
  local file_icon = segment({
    id = 'file_icon',
    provider = providers.file.icon,
    color = {
      foreground = config.foreground,
      background = config.background,
    },
  })

  -- file name
  local file_name = segment({
    id = 'file_name',
    provider = providers.file.name,
    color = {
      foreground = config.foreground,
      background = config.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.background,
      background = config.next.background,
    },
  })

  local file = section()
  file.add_segment(file_icon)
  file.add_segment(file_name)

  return file
end
