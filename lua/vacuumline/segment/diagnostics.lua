local function generate(opts)
  local config = opts.diagnostics
  local next = opts[config.next]

  local error_config = config.errors
  local warning_config = config.warnings

  local Diagnostics = {
    {
      DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        highlight = {warning_config.foreground, warning_config.background},
        separator = config.separator,
        separator_highlight = {warning_config.background, next.background}
      }
    },
    {
      DiagnosticError = {
        provider = 'DiagnosticError',
        highlight = {error_config.foreground, error_config.background},
        separator = config.separator,
        separator_highlight = {error_config.background, warning_config.background}
      }
    }
  }

  return Diagnostics
end

return generate
