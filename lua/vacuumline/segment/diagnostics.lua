local function generate(opts)
  local config = opts.diagnostics
  local error_config = config.errors
  local warning_config = config.warnings

  local Diagnostics = {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      separator = config.separator,
      separator_highlight = {warning_config.foreground, warning_config.background}
    },
    DiagnosticError = {
      provider = 'DiagnosticError',
      separator = config.separator,
      separator_highlight = {error_config.foreground, error_config.background}
    }
  }

  return Diagnostics
end

return generate
