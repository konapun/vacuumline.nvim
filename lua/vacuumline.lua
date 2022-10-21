local get_factory = require('vacuumline.factory')
local get_builder = require('vacuumline.builder')
local get_options = require('vacuumline.options')

local function setup(opts)
  local options = get_options(opts)
  local factory = get_factory(options.backend(options)) -- TODO: Do options actually need to be passed? Figure this out when implementing lualine backend
  local build = get_builder(factory)

  build(options)
end

return {
  setup = setup,
}
