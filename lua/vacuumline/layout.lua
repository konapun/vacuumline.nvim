local vim = vim

--[[
local layout = make_layout()
layout.allocate(mode, {
  priority = layout_priority.MAX,
  minimum: 10
})
--]]
return function()
  local registry = {} -- track sections under layout management

  local function allocate(section, config)
    registry[section.id] = {
      priority = config.priority or 10,
      minimum = config.minimum or 0,
      width = 0
    }
  end

  -- calculate and store width for all allocated sections
  local function update()
    local available_space = vim.fn.winwidth(0)
    for _, section in ipairs(registry) do
      section.width = math.max(section.minimum, available_space / section.priority)
    end
  end

  local function get_width(section)
    return registry[section.id].width
  end

  return {
    allocate = allocate,
    update = update,
    get_width = get_width
  }
end

