local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(theme)
  -- lsp client info
  local client = segment({
    id = 'lsp_client',
    provider = providers.lsp.client,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background,
    }
  })

  local lsp = section()
  lsp.add_segment(client)

  return lsp
end
