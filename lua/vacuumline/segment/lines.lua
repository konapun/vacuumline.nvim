local fileinfo = require('galaxyline.provider_fileinfo')

local function generate(opts)
  local config = opts.lines
  local next = opts[config.next]

  local Lines = {
    {
      FileFormat = {
        provider = function() return fileinfo.get_file_format() .. ' ' end,
        highlight = {config.foreground, config.background},
        separator = config.separator,
        separator_highlight = {config.background, next.background}
      }
    },
    {
      LineInfo = {
        provider = 'LineColumn',
        highlight = {config.foreground, config.background},
        separator = config.half_separator,
        separator_highlight = {config.foreground, config.background},
      }
    }
  }

  return Lines
end

return generate
