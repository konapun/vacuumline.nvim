local segments = require('vacuumline.segment')
local options = require('vacuumline.options')
local inspect = require('inspect')

local M = {}

local function build_side(gls, side, segments, opts)
  -- TODO: filter out segments that aren't enabled
  local index = 1
  for _, generate in ipairs(segments) do
    local segment = generate(opts)
    local sections = {segment}
    -- TODO: check if sections is an array

    for _, section in pairs(segment) do
      gls[side][index] = section
      index = index + 1
    end
  end
end

-- Attach segments to galaxyline
function M.build(gl, opts)
  local built_opts = options.format(opts, segments)
  print(inspect(built_opts))

  local gls = gl.section
  build_side(gls, 'left', segments.left, built_opts)
  build_side(gls, 'right', segments.right, built_opts)
end

return M
