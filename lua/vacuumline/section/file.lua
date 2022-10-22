local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.providers')

-- TODO: Conditions
return function(theme)
  -- file icon
  local file_icon = segment({
    id = 'file_icon',
    provider = providers.file.icon,
    color = {
      foreground = theme.background,
      background = theme.background,
    },
  })

  -- file name
  local file_name = segment({
    id = 'file_name',
    provider = providers.file.name,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
  })

  -- file endcap TODO: is this needed or a relic from galaxyline?
  local endcap = segment({
    id = 'file_endcap',
    provider = providers.null,
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background, -- TODO: next.background
    },
  })

  local file = section()
  file.add_segment(file_icon)
  file.add_segment(file_name)
  file.add_segment(endcap)

  return file
end
