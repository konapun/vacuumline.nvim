local get_statusline = require('vacuumline.statusline')
local get_winbar = require('vacuumline.winbar')
local section = require('vacuumline.section')
local options = require('vacuumline.options')

return function(factory)
  local function build_statusline(statusline)
    -- TODO: options.format_segments to get in-order colors, access to `next`, etc
    local sections = statusline.sections
    local statusline_factory = factory.statusline

    for _, active_section in ipairs(sections.left.active) do -- TODO: make fn to do this
      for _, segment in ipairs(active_section.segments) do
        statusline_factory.append_left(section.Active, segment)
      end
    end
    for _, inactive_section in ipairs(sections.left.inactive) do
      for _, segment in ipairs(inactive_section.segments) do
        statusline_factory.append_left(section.Inactive, segment)
      end
    end
    for _, active_section  in ipairs(sections.right.active) do
      for _, segment in ipairs(active_section.segments) do
        statusline_factory.append_right(section.Active, segment)
      end
    end
    for _, inactive_section in ipairs(sections.right.inactive) do
      for _, segment in ipairs(inactive_section.segments) do
        statusline_factory.append_right(section.Inactive, segment)
      end
    end
  end

  local function build_winbar(winbar)
    local sections = winbar.sections
    local winbar_factory = factory.winbar

    for _, active_section in ipairs(sections.left.active) do
      for _, segment in ipairs(active_section.segments) do
        winbar_factory.append_left(section.Active, segment)
      end
    end
    for _, inactive_section in ipairs(sections.left.inactive) do
      for _, segment in ipairs(inactive_section.segments) do
        winbar_factory.append_left(section.Inactive, segment)
      end
    end
    for _, active_section in ipairs(sections.right.active) do
      for _, segment in ipairs(active_section.segments) do
        winbar_factory.append_right(section.Active, segment)
      end
    end
    for _, inactive_section in ipairs(sections.right.inactive) do
      for _, segment in ipairs(inactive_section.segments) do
        winbar_factory.append_right(section.Inactive, segment)
      end
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
