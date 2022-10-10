local statusline = require('backend.galaxyline.statusline')
local winbar = require('winbar.null')

local function build_galaxyline(config)
  return {
    -- TODO
  }
end

return function(config)
  local galaxyline = build_galaxyline(config)

  return {
    get_statusline = statusline(galaxyline),
    get_winbar = winbar,
  }
end
