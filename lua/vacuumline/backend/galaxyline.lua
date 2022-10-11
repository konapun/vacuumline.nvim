local galaxyline = require('galaxyline')
local statusline = require('backend.galaxyline.statusline')
local winbar = require('winbar.null')

galaxyline.short_line_list = {'LuaTree', 'vista', 'dbui'}

return function(config)
  return {
    get_statusline = statusline(galaxyline),
    get_winbar = winbar,
    make_segment = function(segment)
      -- TODO
      return segment
    end,
  }
end
