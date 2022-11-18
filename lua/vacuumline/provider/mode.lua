local vim = vim

local function get_mode_map(overrides)
  -- TODO: Override icon from options?
  return {
    n = { label = 'NORMAL', icon = ' ', background = overrides.mode_normal.foreground }, -- NORMAL
    i = { label = 'INSERT', icon = ' ', background = overrides.mode_insert.foreground }, -- INSERT
    c = { label = 'COMMAND', icon = ' ', background = overrides.mode_command.foreground }, -- COMMAND
    v = { label = 'VISUAL', icon = ' ', background = overrides.mode_visual.foreground }, -- VISUAL
    V = { label = 'VISUAL L', icon = ' ', background = overrides.mode_visual_line.foreground }, -- VISUAL LINE
    t = { label = 'TERMINAL', icon = ' ', background = overrides.mode_terminal.foreground }, -- TERMINAL
  }
end

return function(config)
  local mode_map = get_mode_map(config.theme)

  local function mode_color()
    local mode_config = mode_map[vim.fn.mode()]
    local mode_background = mode_config and mode_config.background or '#ff0000'

    return mode_background
  end

  local function mode_label()
    local mode = vim.fn.mode()
    local mode_config = mode_map[mode]
    local label = mode_config and mode_config.label or mode

    return label
  end

  local function mode_icon()
    local mode = vim.fn.mode()
    local mode_config = mode_map[mode]
    local label = mode_config and mode_config.icon or ''

    return label
  end

  return {
    color = mode_color,
    label = mode_label,
    icon = mode_icon,
  }
end
