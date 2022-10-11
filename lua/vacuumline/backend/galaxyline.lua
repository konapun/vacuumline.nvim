local galaxyline = require('galaxyline')
local statusline = require('backend.galaxyline.statusline')
local winbar = require('winbar.null')

return function(config)
  return {
    get_statusline = statusline(galaxyline),
    get_winbar = winbar,
  }
end
