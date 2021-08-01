local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.scroll
  local next = segment[config.next]

  local PerCentKey = 'PerCent_' .. mode
  local ScrollBarKey = 'ScrollBar_' .. mode
  local short_highlight = {color.foreground.line, color.background.line}

  local Scroll = {
    {
      [PerCentKey] = {
        provider = 'LinePercent',
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {config.background, next.background}
      }
    },
    {
      [ScrollBarKey] = {
        provider = 'ScrollBar',
        highlight = mode == 'short' and short_highlight or {config.accent, config.background}
      }
    }
  }

  return Scroll
end

return generate
