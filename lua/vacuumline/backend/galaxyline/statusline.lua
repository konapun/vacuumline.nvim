local galaxyline = require('galaxyline')
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

return {
  append_left = function(segment, status)
    local gl_segment = make_segment(segment, status)

    local s = status == 'active' and side.left or side.left_short
    galaxyline.section[s.key][s.index] = gl_segment
    s.index = s.index + 1
  end,
  append_right = function(segment, status)
    local gl_segment = make_segment(segment, status)

    local s = status == 'active' and side.right or side.right_short
    galaxyline.section[s.key][s.index] = gl_segment
    s.index = s.index + 1
  end,
}
