local get_factory = require('backend.factory')
local get_builder = require('vacuumline.builder')
local get_options = require('vacuumline.options')

local function setup(opts)
  local options = get_options(opts)
  local factory = get_factory(options.backend)
  local build = get_builder(factory)

  build(opts)
end

return {
  setup = setup,
}
