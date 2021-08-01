local condition = require('vacuumline.condition')
local vim = vim

local function generate(opts, mode)
  local segment = opts.segments
  local config = segment.search
  local next = segment[config.next]

  local SearchResultsKey = 'SearchResults_' .. mode

  local Search = {
    {
      [SearchResultsKey] = {
        provider = function()
          local search_term = vim.fn.getreg('/')
          local search_count = vim.fn.searchcount({recompute = 1, maxcount = -1})
          local active = vim.v.hlsearch == 1 and search_count.total > 0

          if active then
            return '/' .. search_term .. '[' .. search_count.current .. '/' .. search_count.total .. ']'
          end
        end,
        condition = condition.standard,
        highlight = {config.foreground, config.background},
        separator = config.separator,
        separator_highlight = {config.background, next.background}
      }
    }
  }

  return Search
end

return generate
