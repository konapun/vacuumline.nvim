local vim = vim

--[[
Mode utilities that enable vacuumline to have custom displays for terminal mode, etc
--]]

local M = {}

-- Register event handlers
function M.activate()
  local api = vim.api

  api.nvim_command("autocmd BufEnter * :lua require('vacuumline.event-processor').handle_buf_enter()")
end

function M.handle_buf_enter()
  -- TODO check the current buffer type so the vacuumline can be updated (editor, terminal, etc)
  local buftype = vim.bo[0].buftype or 'normal'

  print('TYPE: ' .. buftype)
end

return M
