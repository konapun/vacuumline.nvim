-- TODO: Rather than making segment handle active/inactive/etc, have a standard config for each and pass as options to segment generator

local get_statusline = require('vacuumline.statusline')
local get_winbar = require('vacuumline.winbar')

return function(factory)
  -- build the configuration for passing to the backend
  local function build(config)
    local statusline = get_statusline(config.theme)
    local winbar = get_winbar(config.theme)
    -- TODO
  end

  return build
end

