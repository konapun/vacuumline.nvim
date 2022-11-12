local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(theme)
  -- file format
  local file_format = segment({
    id = 'file_format',
    provider = providers.file.format,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.next.background,
    },
  })

  -- line column
  local line_column = segment({
    id = 'line_column',
    provider = providers.file.position,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background,
    },
  })

  local lines = section()
  lines.add_segment(file_format)
  lines.add_segment(line_column)

  return lines
end
