local gl = require('galaxyline')
local builder = require('vacuumline.builder')

local M = {}

gl.short_line_list = {'LuaTree', 'vista', 'dbui'}

function M.setup(opts)
  return builder.build(gl, opts)
end

return M
