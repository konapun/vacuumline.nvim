local get_statusline = require('vacuumline.statusline')
local get_winbar = require('vacuumline.winbar')
local section = require('vacuumline.section')

return function(factory)
  local function build_statusline(statusline)
    local sections = statusline.sections
    local statusline_factory = factory.statusline

    for _, active_section in ipairs(sections.left.active) do
      statusline_factory.append_left(active_section, section.Active)
    end
    for _, inactive_section in ipairs(sections.left.inactive) do
      statusline_factory.append_left(inactive_section, section.Inactive)
    end
    for _, active_section  in ipairs(sections.right.active) do
      statusline_factory.append_right(active_section, section.Active)
    end
    for _, inactive_section in ipairs(sections.right.inactive) do
      statusline_factory.append_right(inactive_section, section.Inactive)
    end
  end

  local function build_winbar(winbar)
    local sections = winbar.sections
    local winbar_factory = factory.winbar

    for _, active_section in ipairs(sections.left.active) do
      winbar_factory.append_left(active_section, section.Active)
    end
    for _, inactive_section in ipairs(sections.left.inactive) do
      winbar_factory.append_left(inactive_section, section.Inactive)
    end
    for _, active_section in ipairs(sections.right.active) do
      winbar_factory.append_right(active_section, section.Active)
    end
    for _, inactive_section in ipairs(sections.right.inactive) do
      winbar_factory.append_right(inactive_section, section.Inactive)
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

