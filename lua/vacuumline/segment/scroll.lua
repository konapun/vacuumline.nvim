local function generate(opts)
  local config = opts.scroll

  local Scroll = {
    PerCent = {
      provider = 'LinePercent',
      highlight = {config.foreground, config.background},
      separator = config.separator,
      separator_highlight = {config.background, config.foreground}
    },
    ScrollBar = {
      provider = 'ScrollBar',
      hightlight = {config.accent, config.background}
    }
  }

  return Scroll
end

return generate
