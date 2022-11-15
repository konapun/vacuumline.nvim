local get_factory = require('vacuumline.factory')
local get_builder = require('vacuumline.builder')
local options = require('vacuumline.options')

local function setup(conf)
  print('ONE')
  local config = options.format_options(conf)
  print('TWO')
  local factory = get_factory(config.backend(conf))
  print('THREE')
  local build = get_builder(factory)
  print('FOUR')

  build(config)
end

return {
  setup = setup,
}
