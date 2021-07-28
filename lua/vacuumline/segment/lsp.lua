local function generate(opts)
  local config = opts.lsp

  local LSP = {
    LspInfo = {
      provider = 'GetLspClient',
      highlight = {config.foreground, config.background}
    }
  }

  return LSP
end

return generate
