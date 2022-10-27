local vim = vim

local function get_mode_map(overrides)
  local map = overrides -- TODO: apply overrides

  -- TODO: use colors from map
  return {
    n = { label = 'NORMAL', icon = ' ', background = '#00ff00' }, -- NORMAL
    i = { label = 'INSERT', icon = ' ', background = '#ffff00' }, -- INSERT
    c = { label = 'COMMAND', icon = ' ', background = '#00ffff' }, -- COMMAND
    v = { label = 'VISUAL', icon = ' ', background = '#ff00ff' }, -- VISUAL
    V = { label = 'VISUAL L', icon = ' ', background = '#0000ff' }, -- VISUAL LINE
    t = { label = 'TERMINAL', icon = ' ', background = '#ff0000' }, -- TERMINAL
  }
end

return function(config)
  local mode_map = get_mode_map({}) -- FIXME: pass config.segment.mode.map

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
    mode_color = mode_color,
    mode_label = mode_label,
    mode_icon = mode_icon,
  }
end
