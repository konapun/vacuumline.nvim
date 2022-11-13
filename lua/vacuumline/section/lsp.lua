local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')
local conditions = require('vacuumline.condition')

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
      background = config.next_background,
    }
  })

  return section({ client }, {
    conditions = { conditions.standard_not_empty }
  })
end
