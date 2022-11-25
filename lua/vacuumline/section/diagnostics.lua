local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')
local condition = require('vacuumline.condition')

-- TODO: Conditions
return function(config)
  local info = segment({
    id = 'diagnostics_info',
    provider = providers.diagnostics.info,
    color = {
      foreground = config.info.foreground,
      background = config.info.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.info.background,
      background = config.next_background,
    }
  })

  local hint = segment({
    id = 'diagnostics_hint',
    provider = providers.diagnostics.hint,
    color = {
      foreground = config.hint.foreground,
      background = config.hint.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.hint.background,
      background = config.info.background,
    }
  })

  local warn = segment({
    id = 'diagnostics_warn',
    provider = providers.diagnostics.warn,
    color = {
      foreground = config.warnings.foreground,
      background = config.warnings.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.warnings.background,
      background = config.hint.background,
    }
  })

  local error = segment({
    id = 'diagnostics_error',
    provider = providers.diagnostics.error,
    color = {
      foreground = config.errors.foreground,
      background = config.errors.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.errors.background,
      background = config.warnings.background,
    }
  })

  return section({ info, hint, warn, error })
end
