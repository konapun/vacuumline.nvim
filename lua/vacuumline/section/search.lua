local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')

return function(theme)
  -- search results
  local search_results = segment({
    id = 'search_results',
    provider = providers.search.results,
    color = {
      foreground = theme.foreground,
      background = theme.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.background,
      background = theme.foreground,
    }
  })

  return section({ search_results })
end
