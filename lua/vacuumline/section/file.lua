local segment = require('vacuumline.segment')
local section = require('vacuumline.section')

-- FIXME: need to pass providers since these are backend-dependent (or should the backend convert this somehow?)
return function(providers, theme)
  -- file icon
  local file_icon = segment({
    id = 'file_icon',
    provider = providers.file_icon, -- FIXME
    condition = conditions.not_empty,
    color = {
      foreground = theme.background,
      background = theme.background,
    },
  })
  file_icon.add_condition(conditions.not_empty)

  local file = section()

  file.add_segment(file_icon)

  return file
end
