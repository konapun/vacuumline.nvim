local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.providers')
local condition = require('vacuumline.condition')

-- TODO: Conditions
return function(theme)
  local hint = segment({
    id = 'diagnostics_hint',
    provider = providers.diagnostics.hint,
    color = {
      foreground = theme.diagnostics.hint.foreground,
      background = theme.diagnostics.hint.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diagnostics.hint.background,
      background = theme.diagnostics.info.background, -- TODO: or use next()?
    }
  })

  local info = segment({
    id = 'diagnostics_info',
    provider = providers.diagnostics.info,
    color = {
      foreground = theme.diagnostics.info.foreground,
      background = theme.diagnostics.info.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diagnostics.info.background,
      background = theme.diagnostics.warning.background, -- TODO: or use next()?
    }
  })

  local warn = segment({
    id = 'diagnostics_warn',
    provider = providers.diagnostics.warn,
    color = {
      foreground = theme.diagnostics.warning.foreground,
      background = theme.diagnostics.warning.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diagnostics.warning.background,
      background = theme.diagnostics.error.background, -- TODO: or use next()?
    }
  })

  local error = segment({
    id = 'diagnostics_error',
    provider = providers.diagnostics.error,
    color = {
      foreground = theme.diagnostics.error.foreground,
      background = theme.diagnostics.error.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diagnostics.error.background,
      background = theme.background, -- FIXME
    }
  })

  local diagnostics = section()
  diagnostics.add_segment(hint)
  diagnostics.add_segment(info)
  diagnostics.add_segment(warn)
  diagnostics.add_segment(error)

  return diagnostics
end
