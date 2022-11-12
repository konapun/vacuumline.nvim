local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(config)
  -- scroll percent
  local scroll_percent = segment({
    id = 'scroll_percent',
    provider = providers.scroll.percent,
    color = {
      foreground = config.foreground,
      background = config.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.background,
      background = config.next.background,
    }
  })

  local scroll_bar = segment({
    id = 'scroll_bar',
    provider = providers.scroll.bar,
    color = {
      foreground = config.accent,
      background = config.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.background,
      background = config.background,
    }
  })

  local scroll = section()
  scroll.add_segment(scroll_percent)
  scroll.add_segment(scroll_bar)

  return scroll
end
