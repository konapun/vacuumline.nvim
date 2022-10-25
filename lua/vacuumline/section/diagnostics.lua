local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')
local condition = require('vacuumline.condition')

-- TODO: Conditions
return function(theme)
  local hint = segment({
    id = 'diagnostics_hint',
    provider = providers.diagnostics.hint,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.foreground,
      background = theme.background, -- TODO: or use next()?
    }
  })

  local info = segment({
    id = 'diagnostics_info',
    provider = providers.diagnostics.info,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background, -- TODO: or use next()?
    }
  })

  local warn = segment({
    id = 'diagnostics_warn',
    provider = providers.diagnostics.warn,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background, -- TODO: or use next()?
    }
  })

  local error = segment({
    id = 'diagnostics_error',
    provider = providers.diagnostics.error,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
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
