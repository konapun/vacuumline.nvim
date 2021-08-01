local segments = require('vacuumline.segment')
local options = require('vacuumline.options')

local M = {}

local function build_side(gls, side, segments, opts)
  local index = 1
  local mode = string.find(side, 'short') == 1 and 'short' or 'normal'

  for _, config in ipairs(segments) do
    local sections = config.generator(opts, mode)

    for _, section in ipairs(sections) do
      gls[side][index] = section
      index = index + 1
    end
  end
end

-- Attach segments to galaxyline
function M.build(gl, opts)
  local built_opts = options.format(opts, segments)

  local gls = gl.section
  build_side(gls, 'left', segments.left, built_opts)
  build_side(gls, 'right', segments.right, built_opts)
  build_side(gls, 'short_line_left', segments.short_left, built_opts)
  build_side(gls, 'short_line_right', segments.short_right, built_opts)
end

return M
