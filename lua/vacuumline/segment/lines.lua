local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('vacuumline.condition')

local format_collapse_width = 60
local format_hide_width = 40

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.lines
  local next = segment[config.next]

  local short_highlight = {color.foreground.line, color.background.line}

  local FileFormatKey = 'FileFormat_' .. mode
  local LineInfoKey = 'LineInfo_' .. mode
  local LineEndKey = 'LineEnd_' .. mode

  local Lines = {
    {
      [LineEndKey] = {
        provider = function() end,
        separator = mode ~= 'short' and config.separator,
        separator_highlight = {config.background, next.background}
      }
    },
    {
      [FileFormatKey] = {
        provider = function() return fileinfo.get_file_format() .. ' ' end,
        condition = condition.gen_check_width(format_collapse_width),
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background}
      }
    },
    {
      [LineInfoKey] = {
        provider = 'LineColumn',
        condition = condition.gen_check_width(format_hide_width),
        highlight = mode == 'short' and short_highlight or {config.foreground, config.background},
        separator = mode ~= 'short' and config.section_separator,
        separator_highlight = {config.foreground, config.background}
      }
    }
  }

  return Lines
end

return generate
