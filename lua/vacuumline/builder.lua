local get_statusline = require('vacuumline.statusline')
local get_winbar = require('vacuumline.winbar')
local options = require('vacuumline.options')

local active = 'active'
local inactive = 'inactive'

return function(factory)
  local function build_statusline(statusline)
    -- TODO: options.format_segments to get in-order colors, access to `next`, etc
    local sections = statusline.sections
    local statusline_factory = factory.statusline

    for _, section in ipairs(sections.left.active) do -- TODO: make fn to do this
      for _, segment in ipairs(section.segments) do
        statusline_factory.append_left(active, segment.definition)
      end
    end
    for _, section in ipairs(sections.left.inactive) do
      for _, segment in ipairs(section.segments) do
        statusline_factory.append_left(inactive, segment.definition)
      end
    end
    for _, section  in ipairs(sections.right.active) do
      for _, segment in ipairs(section.segments) do
        statusline_factory.append_right(active, segment.definition)
      end
    end
    for _, section in ipairs(sections.right.inactive) do
      for _, segment in ipairs(section.segments) do
        statusline_factory.append_right(inactive, segment.definition)
      end
    end
  end

  local function build_winbar(winbar)
    local sections = winbar.sections
    local winbar_factory = factory.winbar

    for _, section in ipairs(sections.left.active) do
      for _, segment in ipairs(section.segments) do
        winbar_factory.append_left(active, segment.definition)
      end
    end
    for _, section in ipairs(sections.left.inactive) do
      for _, segment in ipairs(section.segments) do
        winbar_factory.append_left(inactive, segment.definition)
      end
    end
    for _, section in ipairs(sections.right.active) do
      for _, segment in ipairs(section.segments) do
        winbar_factory.append_right(active, segment.definition)
      end
    end
    for _, section in ipairs(sections.right.inactive) do
      for _, segment in ipairs(section.segments) do
        winbar_factory.append_right(inactive, segment.definition)
      end
    end
  end

  -- build the configuration for passing to the backend
  local function build(config)
    local statusline = get_statusline(config) -- TODO: pass less? build a theme and pass it instead of the whole config?
    local winbar = get_winbar(config)

    build_statusline(statusline)
    build_winbar(winbar)
  end

  return build
end
