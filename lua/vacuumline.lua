local configuration = require('vacuumline.configuration')
local builder = require('vacuumline.builder')
local providers = require('vacuumline.provider_factory')

--[[
Ideas:
- config is generated in first step (as generalization)
- builder just builds config, calling a generalized API which abstracts differences in backends
--]]
local M = {}

function M.setup(opts)
  local backend = opts.backend or require('vacuumline.backend.galaxyline')
  local provider_factory = providers(backend)

  local config = configuration.generate(opts)
  return builder(provider_factory).build(config)
end

return M
