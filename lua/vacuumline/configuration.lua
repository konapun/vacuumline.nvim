local options = require('vacuumline.options')

local M = {}

function M.generate(opts)
  local long_opts = options.format(opts, {left = segments.left, right = segments.right})
  local short_opts = options.format(opts, {left = segments.short_left, right = segments.short_right})

  return {
    long = long_opts,
    short = short_opts
  }
end

return M
