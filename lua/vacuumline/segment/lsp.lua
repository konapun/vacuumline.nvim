local lspclient = require('galaxyline.provider_lsp')
local condition = require('vacuumline.condition')

local format_hide_width = 40

local function generate(opts, mode)
  local color = opts.colors
  local config = opts.segments.lsp

  local LspInfoKey = 'LspInfo_' .. mode

  local LSP = {
    {
      [LspInfoKey] = {
        provider = function()
          print('Buftype: ' .. vim.bo[0].buftype)
          local client = lspclient.get_lsp_client()
          return client
        end,
        condition = condition.gen_check_width(format_hide_width),
        highlight = mode == 'short' and {color.foreground.line, color.background.line} or {config.foreground, config.background}
      }
    }
  }

  return LSP
end

return generate
