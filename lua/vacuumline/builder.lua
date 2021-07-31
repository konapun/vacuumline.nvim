local segments = require('vacuumline.segment')
local options = require('vacuumline.options')
local inspect = require('inspect')

local M = {}

local function build_side(gls, side, segments, opts)
  local index = 1
  for _, config in ipairs(segments) do
    local sections = config.generator(opts)

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
end

return M
