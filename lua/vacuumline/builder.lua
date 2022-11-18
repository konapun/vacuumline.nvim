local get_statusline = require('vacuumline.statusline')
local get_winbar = require('vacuumline.winbar')

local active = 'active'
local inactive = 'inactive'

local function build_statusline(statusline, statusline_factory)
  local sections = statusline.sections

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

local function build_winbar(winbar, winbar_factory)
  local sections = winbar.sections

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

return function(factory)
  -- build the configuration for passing to the backend
  local function build(config)
    local statusline = get_statusline(config)
    local winbar = get_winbar(config)

    factory.setup(function(api)
      build_statusline(statusline, api.statusline)
      build_winbar(winbar, api.winbar)
    end)
  end

  return build
end
