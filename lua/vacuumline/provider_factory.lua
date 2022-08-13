--[[
Instantiate providers for a given backend
--]]
local M = {}
M.__index = M

function M.new(provider)
  local self = setmetatable({}, M)
  self.provider = provider
  return self
end

return M
