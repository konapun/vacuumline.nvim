local condition = require('galaxyline.condition')
local vim = vim

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.mode
  local next = segment[config.next]
  local mode_map = config.map

  local Mode = {
    {
      ModeIndicator = {
        provider = function()
          local mode_config = mode_map[vim.fn.mode()]

          vim.api.nvim_command("hi GalaxyModeIndicator guifg=" .. mode_config.background)
          return '▋'
        end,
        highlight = {config.background, config.background}
      }
    },
    {
      ModeLabel = {
        provider = function()
          return mode_map[vim.fn.mode()].label
        end,
        highlight = {config.foreground, config.background, 'bold'},
        separator = config.separator,
        separator_highlight = {config.background, function() -- TODO: add ability to see if next segment is active
          if condition.buffer_not_empty() then
            return next.background
          end
          return color.background.line
        end}
      }
    }
  }

  return Mode
end

return generate

