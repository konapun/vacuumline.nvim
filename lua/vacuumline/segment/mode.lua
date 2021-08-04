local condition = require('galaxyline.condition')
local vim = vim

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.mode
  local next = segment[config.next]
  local mode_map = config.map

  local ModeIndicatorKey = 'ModeIndicator_' .. mode
  local ModeLabelKey = 'ModeLabel' .. mode

  local galaxy_label = 'Galaxy' .. ModeIndicatorKey

  local Mode = {
    {
      [ModeIndicatorKey] = {
        provider = function()
          local mode_config = mode_map[vim.fn.mode()]
          local mode_background = mode_config and mode_config.background or '#ff0000'

          vim.api.nvim_command("hi " .. galaxy_label .. " guifg=" .. mode_background)
          return '▋'
        end,
        highlight = {config.background, config.background}
      }
    },
    {
      [ModeLabelKey] = {
        provider = function()
          -- TODO: terminal modes [term>normal]
          local mode_config = mode_map[vim.fn.mode()]
          local mode_label = mode_config and mode_config.label or ' '

          return mode_label
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

