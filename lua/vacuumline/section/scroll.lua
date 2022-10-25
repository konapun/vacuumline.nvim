local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(theme)
  -- scroll percent
  local scroll_percent = segment({
    id = 'scroll_percent',
    provider = providers.scroll.percent,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background,
    }
  })

  local scroll_bar = segment({
    id = 'scroll_bar',
    provider = providers.scroll.bar,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.background,
    }
  })

  local scroll = section()
  scroll.add_segment(scroll_percent)
  scroll.add_segment(scroll_bar)

  return scroll
end
