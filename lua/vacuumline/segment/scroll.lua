local inspect = require('inspect')

local function generate(opts)
  local config = opts.scroll
  local next = opts[config.next]

  local Scroll = {
    {
      PerCent = {
        provider = 'LinePercent',
        highlight = {config.foreground, config.background},
        separator = config.separator,
        separator_highlight = {config.background, next.background}
      }
    },
    {
      ScrollBar = {
        provider = 'ScrollBar',
        hightlight = {config.accent, config.background}
      }
    }
  }

  return Scroll
end

return generate
