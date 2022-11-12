local segment = require('vacuumline.segment')
local noop = require('vacuumline.provider.noop')

return function(color)
  return segment({
    id = 'pad',
    privider = noop,
    color = {
      foreground = color,
      background = color
    }
  })
end
