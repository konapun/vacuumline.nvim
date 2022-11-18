local galaxyline = require('galaxyline')
local statusline = require('vacuumline.backend.galaxyline.statusline')
local winbar = require('vacuumline.winbar.null')

return function(config)
  local api = {
    statusline = statusline(galaxyline, config),
    winbar = winbar
  }

  return {
    setup = function(build)
      build(api)
    end
  }
end
