local galaxyline = require('galaxyline')
local statusline = require('vacuumline.backend.galaxyline.statusline')
local winbar = require('vacuumline.winbar.null')

return function()
  return {
    statusline = statusline(galaxyline),
    winbar = winbar,
  }
end
