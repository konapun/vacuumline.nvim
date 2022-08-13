local builder = require('vacuumline.builder')
local providers = require('vacuumline.provider_factory')

local M = {}

function M.setup(opts)
  local backend = opts.backend or require('vacuumline.backend.galaxyline')
  local provider_factory = providers(backend)

  return builder.build(provider_factory, opts)
end

return M
