local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')
local conditions = require('vacuumline.condition')
local formatters = require('vacuumline.formatter')

return function(config)
  -- file icon
  local file_icon = segment({
    id = 'file_icon',
    provider = providers.file.icon,
    formatter = formatters.pad,
    -- condition = conditions.standard_not_empty,
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
      background = config.next_background,
    },
  })

  return section({ file_icon, file_name }, {
    conditions = { conditions.standard_not_empty }
  })
end
