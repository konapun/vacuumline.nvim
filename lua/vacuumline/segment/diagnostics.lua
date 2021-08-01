local condition = require('vacuumline.condition')

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.diagnostics
  local next = segment[config.next]

  local error_config = config.errors
  local warning_config = config.warnings

  local DiagnosticWarnKey = 'DiagnosticWarn_' .. mode
  local DiagnosticErrorKey = 'DiagnosticError_' .. mode

  local Diagnostics = {
    {
      [DiagnosticWarnKey] = {
        provider = 'DiagnosticWarn',
        condition = condition.standard,
        highlight = mode == 'short' and {warning_config.background, color.background.line} or {warning_config.foreground, warning_config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {warning_config.background, next.background}
      }
    },
    {
      [DiagnosticErrorKey] = {
        provider = 'DiagnosticError',
        condition = condition.standard,
        highlight = mode == 'short' and {error_config.background, color.background.line} or {error_config.foreground, error_config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {error_config.background, warning_config.background}
      }
    }
  }

  return Diagnostics
end

return generate
