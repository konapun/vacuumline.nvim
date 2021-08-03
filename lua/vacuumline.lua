local gl = require('galaxyline')
local event_processor = require('galaxyline.event-processor')
local builder = require('vacuumline.builder')
local vim = vim

gl.short_line_list = {'LuaTree', 'vista', 'dbui'}

local M = {}

function M.setup(opts)
  builder.build(gl, opts)
  event_processor.activate()
end

return M
