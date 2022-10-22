local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.providers')

return function(theme)
  -- search results
  local search_results = segment({
    id = 'search_results',
    provider = providers.search.results,
    color = {
      foreground = theme.search.foreground,
      background = theme.search.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.search.background,
      background = theme.search.background,
    }
  })

  local search = section()
  search.add_segment(search_results)

  return search
end
