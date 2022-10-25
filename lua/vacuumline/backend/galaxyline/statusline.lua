local statusline = require('vacuumline.statusline')
local make_segment = require('vacuumline.backend.galaxyline.segment')

local side = {
  left = {
    key = 'left',
    index = 1,
  },
  left_short = {
    key = 'short_line_left',
    index = 1,
  },
  right = {
    key = 'right',
    index = 1,
  },
  right_short = {
    key = 'short_line_right',
    index = 1,
  },
}

return function(galaxyline)
  galaxyline.short_line_list = {'LuaTree', 'vista', 'dbui'}

  local function add_segment(s, segment)
    galaxyline.section[s.key][s.index] = segment
    s.index = s.index + 1
  end

  return {
    append_left = function(status, segment)
      local gl_segment = make_segment(segment, status)

      local s = status == 'active' and side.left or side.left_short
      add_segment(s, gl_segment)
    end,
    append_right = function(status, segment)
      local gl_segment = make_segment(segment, status)

      local s = status == 'active' and side.right or side.right_short
      add_segment(s, gl_segment)
    end,
  }
end
