--[[
Watch buftype of current buffer to determine which segments to show:

Use a decorator whose provider checks the current mode
and

segment init gives buftype segments
builder uses the buftype segments to add to galaxyline

ideas:
- update segments to display differently for different modes (already does this for normal and short - add terminal)
- add all segments to galaxyline and then determine whether or not they show using the decorated provider
--]]

local function decorate_segment(segment)
  return function(opts, mode)
    -- TODO
  end
end
