local get_statusline = require('vacuumline.statusline')
local get_winbar = require('vacuumline.winbar')

return function(factory)
  local function build_statusline(statusline)
    local segments = statusline.segments
    local statusline_factory = factory.statusline

    for _, segment in ipairs(segments.left.active) do
      statusline_factory.append_left(segment, 'active') -- FIXME: this will hit the actual backend's statusline API. Is this what we want? Probably not since the segment itself hasn't been adapted. Where should this happen?
    end
    for _, segment in ipairs(segments.left.inactive) do
      statusline_factory.append_left(segment, 'inactive') -- FIXME: same
    end
    for _, segment in ipairs(segments.right.active) do
      statusline_factory.append_right(segment, 'active') -- FIXME: same
    end
    for _, segment in ipairs(segments.right.inactive) do
      statusline_factory.append_right(segment, 'inactive') -- FIXME: same
    end
  end

  local function build_winbar(winbar)
    local segments = winbar.segments
    local winbar_factory = factory.winbar

    for _, segment in ipairs(segments.left.active) do
      winbar_factory.append_left(segment, 'active')
    end
    for _, segment in ipairs(segments.left.inactive) do
      winbar_factory.append_left(segment, 'inactive')
    end
    for _, segment in ipairs(segments.right.active) do
      winbar_factory.append_right(segment, 'active')
    end
    for _, segment in ipairs(segments.right.inactive) do
      winbar_factory.append_right(segment, 'inactive')
    end
  end

  -- build the configuration for passing to the backend
  local function build(config)
    local statusline = get_statusline(config.theme)
    local winbar = get_winbar(config.theme)

    build_statusline(statusline)
    build_winbar(winbar)
  end

  return build
end

