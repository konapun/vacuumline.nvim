local condition = require('vacuumline.condition')

local function diagnostic_condition()
  return condition.standard() and condition.not_terminal()
end

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.diagnostics
  local next = segment[config.next]

  local error_config = config.error
  local warning_config = config.warning
  local info_config = config.info
  local hint_config = config.hint

  local DiagnosticHintKey = 'DiagnosticHint_' .. mode
  local DiagnosticInfoKey = 'DiagnosticInfo_' .. mode
  local DiagnosticWarnKey = 'DiagnosticWarn_' .. mode
  local DiagnosticErrorKey = 'DiagnosticError_' .. mode

  local Diagnostics = {
    {
      [DiagnosticHintKey] = {
        provider = 'DiagnosticHint',
        condition = diagnostic_condition,
        highlight = mode == 'short' and {hint_config.background, color.background.line} or {hint_config.foreground, hint_config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {hint_config.background, next.background}
      }
    },
    {
      [DiagnosticInfoKey] = {
        provider = 'DiagnosticInfo',
        condition = diagnostic_condition,
        highlight = mode == 'short' and {info_config.background, color.background.line} or {info_config.foreground, info_config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {info_config.background, hint_config.background}
      }
    },
    {
      [DiagnosticWarnKey] = {
        provider = 'DiagnosticWarn',
        condition = diagnostic_condition,
        highlight = mode == 'short' and {warning_config.background, color.background.line} or {warning_config.foreground, warning_config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {warning_config.background, info_config.background}
      }
    },
    {
      [DiagnosticErrorKey] = {
        provider = 'DiagnosticError',
        condition = diagnostic_condition,
        highlight = mode == 'short' and {error_config.background, color.background.line} or {error_config.foreground, error_config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {error_config.background, warning_config.background}
      }
    }
  }

  return Diagnostics
end

return generate
