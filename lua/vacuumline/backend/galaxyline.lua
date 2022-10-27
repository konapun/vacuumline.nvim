local galaxyline = require('galaxyline')
local statusline = require('vacuumline.backend.galaxyline.statusline')
local winbar = require('vacuumline.winbar.null')

return function(config)
  return {
    statusline = statusline(galaxyline, config),
    winbar = winbar,
  }
end
