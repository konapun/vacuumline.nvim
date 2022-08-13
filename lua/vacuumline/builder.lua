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
function M.build(provider_factory, opts)
  local long_opts = options.format(opts, {left = segments.left, right = segments.right})
  local short_opts = options.format(opts, {left = segments.short_left, right = segments.short_right})

  local gls = gl.section
  -- TODO: Break into components
  build_side(gls, 'left', segments.left, long_opts)
  build_side(gls, 'right', segments.right, long_opts)
  build_side(gls, 'short_line_left', segments.short_left, short_opts)
  build_side(gls, 'short_line_right', segments.short_right, short_opts)
end

return M
