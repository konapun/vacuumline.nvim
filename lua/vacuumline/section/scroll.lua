local condition = require('vacuumline.condition')

local format_min_width = 50

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.scroll
  local next = segment[config.next]

  local PerCentKey = 'PerCent_' .. mode
  local ScrollBarKey = 'ScrollBar_' .. mode
  local short_highlight = {color.foreground.line, color.background.line}

  local Scroll = {
    {
      [PerCentKey] = {
        provider = 'LinePercent',
        condition = condition.gen_check_width(format_min_width),
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {config.background, function()
          if condition.is_terminal() then -- FIXME: this segment shouldn't have to know about this; should be able to dynamically determine this
            return segment[next.next].background
          end

          return next.background
        end}
      }
    },
    {
      [ScrollBarKey] = {
        provider = 'ScrollBar',
        condition = condition.standard,
        highlight = mode == 'short' and short_highlight or {
          config.accent, function()
            if condition.check_width(format_min_width) then
              return config.background
            end
            return next.background
          end
        }
      }
    }
  }

  return Scroll
end

return generate
