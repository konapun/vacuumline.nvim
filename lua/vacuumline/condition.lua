local condition = require('galaxyline.condition')
local vim = vim

local M = {}

-- galaxyline conditions
M.buffer_not_empty = condition.buffer_not_empty
M.hide_in_width = condition.hide_in_width

-- extensions

function M.check_width(width)
  return vim.fn.winwidth(0) > width
end

function M.gen_check_width(width)
  return function()
    return M.check_width(width)
  end
end

-- Guarantees that mode will never be hidden
function M.guarantee_mode()
  return M.check_width(10)
end

function M.standard()
  return M.guarantee_mode()
end

-- Buffer not empty and guarantee mode
function M.standard_not_empty()
  return M.buffer_not_empty() and M.guarantee_mode()
end

return M
