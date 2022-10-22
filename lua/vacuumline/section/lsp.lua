local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.providers')

return function(theme)
  -- lsp client info
  local client = segment({
    id = 'lsp_client',
    provider = providers.lsp.client,
    color = {
      foreground = theme.lsp.foreground,
      background = theme.lsp.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.lsp.background,
      background = theme.lsp.background,
    }
  })

  local lsp = section()
  lsp.add_segment(client)

  return lsp
end
