local condition = require('vacuumline.condition')

local function generate(opts, mode)
  local color = opts.colors
  local config = opts.segments.lsp

  local LspInfoKey = 'LspInfo_' .. mode

  local LSP = {
    {
      [LspInfoKey] = {
        provider = 'GetLspClient',
        condition = condition.standard,
        highlight = mode == 'short' and {color.foreground.line, color.background.line} or {config.foreground, config.background}
      }
    }
  }

  return LSP
end

return generate
