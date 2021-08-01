local fileinfo = require('galaxyline.provider_fileinfo')

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.lines
  local next = segment[config.next]


  local FileFormatKey = 'FileFormat_' .. mode
  local LineInfoKey = 'LineInfo_' .. mode
  local short_highlight = {color.foreground.line, color.background.line}

  local Lines = {
    {
      [FileFormatKey] = {
        provider = function() return fileinfo.get_file_format() .. ' ' end,
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background},
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {config.background, next.background}
      }
    },
    {
      [LineInfoKey] = {
        provider = 'LineColumn',
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background},
        separator = mode ~= 'short' and config.section_separator,
        separator_highlight = {config.foreground, config.background},
      }
    }
  }

  return Lines
end

return generate
