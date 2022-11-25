local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')
local formatters = require('vacuumline.formatter')

return function(theme)
  -- file format
  local file_format = segment({
    id = 'file_format',
    provider = providers.file.format,
    formatter = formatters.pad_before,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.next_background,
    },
  })

  -- line column
  local line_column = segment({
    id = 'line_column',
    provider = providers.file.position,
    formatter = formatters.pad_after,
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

  return section({ file_format, line_column })
end
