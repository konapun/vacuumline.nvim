local condition = require('vacuumline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.file
  local next = segment[config.next]

  local FileIconKey = 'FileIcon_' .. mode
  local FileNameKey = 'FileName_' .. mode
  local short_highlight = {color.foreground.line, color.background.line}

  local File = {
    {
      [FileIconKey] = {
        provider = 'FileIcon',
        condition = condition.standard_not_empty,
        highlight = mode == 'short' and short_highlight or {fileinfo.get_file_icon_color, config.background},
      }
    },
    {
      [FileNameKey] = {
        provider = function()
          local name = fileinfo.get_current_file_name()
          local size = fileinfo.get_file_size()

          if mode ~= 'short' and not condition.hide_in_width() then -- truncated filename
            local len = string.len(name)
            local n_chars = math.ceil(vim.fn.winwidth(0) / 10) + 1

            return '...' .. string.sub(name, len - n_chars)
          end
          return name .. size
        end,
        condition = condition.standard_not_empty,
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {config.background, next.background}
      }
    }
  }

  return File
end

return generate
