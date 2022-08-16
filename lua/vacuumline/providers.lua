--[[
Instantiate providers for a given backend
--]]
local M = {}
M.__index = M

function M.new(backend)
  local self = setmetatable({}, M)
  self.backend = backend
  return self
end

return M
