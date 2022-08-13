local noopProvider = require('vacuumline.provider.noop')

--[[
This is a special segment used as a color control:

For instance, the Diagnostics segment is self-colored but I want the next segment to alternate
color from the previous segment so Blank is used
--]]
local function generate(opts, mode)
  local BlankKey = 'Blank_' .. mode

  local Blank = {
    {
      [BlankKey] = {
        provider = noopProvider
      }
    }
  }

  return Blank
end

return generate
