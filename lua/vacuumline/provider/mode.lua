local vim = vim

local function get_mode_map(theme)
  return {
    n = { label = 'NORMAL', icon = theme.n.label, background = theme.n.background }, -- NORMAL
    i = { label = 'INSERT', icon = theme.i.label, background = theme.i.background }, -- INSERT
    c = { label = 'COMMAND', icon = theme.c.label, background = theme.c.background }, -- COMMAND
    v = { label = 'VISUAL', icon = theme.v.label, background = theme.v.background }, -- VISUAL
    V = { label = 'VISUAL L', icon = theme.V.label, background = theme.V.background }, -- VISUAL LINE
    t = { label = 'TERMINAL', icon = theme.t.label, background = theme.t.label }, -- TERMINAL
  }
end

return function(theme)
  local mode_map = get_mode_map(theme)

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
