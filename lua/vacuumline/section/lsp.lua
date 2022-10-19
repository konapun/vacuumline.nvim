local condition = require('vacuumline.condition')
local vim = vim

local format_hide_width = 40

local function generate(opts, mode)
  local color = opts.colors
  local config = opts.segments.lsp

  local LspInfoKey = 'LspInfo_' .. mode

  local LSP = {
    {
      [LspInfoKey] = {
        provider = 'GetLspClient',
        condition = function() return condition.check_width(format_hide_width) and condition.not_terminal() end,
        highlight = mode == 'short' and {color.foreground.line, color.background.line} or {config.foreground, config.background}
      }
    }
  }

  return LSP
end

return generate
