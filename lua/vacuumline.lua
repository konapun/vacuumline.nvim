local get_factory = require('vacuumline.factory')
local get_builder = require('vacuumline.builder')
local options = require('vacuumline.options')

local function setup(conf)
  local config = options.format_options(conf)
  local factory = get_factory(config.backend(conf))
  local build = get_builder(factory)

  build(config)
end

return {
  setup = setup,
}
