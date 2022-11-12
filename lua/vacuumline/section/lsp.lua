local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(config)
  -- lsp client info
  local client = segment({
    id = 'lsp_client',
    provider = providers.lsp.client,
    color = {
      foreground = config.foreground,
      background = config.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.background,
      background = config.next.background,
    }
  })

  local lsp = section()
  lsp.add_segment(client)

  return lsp
end
