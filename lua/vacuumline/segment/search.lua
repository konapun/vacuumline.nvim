local vim = vim

local function generate(opts)
  local config = opts.search
  local next = opts[config.next]

  local Search = {
    {
      SearchResults = {
        provider = function()
          local search_term = vim.fn.getreg('/')
          local search_count = vim.fn.searchcount({recompute = 1, maxcount = -1})
          local active = vim.v.hlsearch == 1 and search_count.total > 0

          if active then
            return '/' .. search_term .. '[' .. search_count.current .. '/' .. search_count.total .. ']'
          end
        end,
        highlight = {config.foreground, config.background},
        separator = config.separator,
        separator_highlight = {config.background, next.background}
      }
    }
  }

  return Search
end

return generate
