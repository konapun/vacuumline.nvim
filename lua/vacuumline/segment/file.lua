local condition = require('vacuumline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')

local function generate(opts)
  local config = opts.file
  local next = opts[config.next]

  local File = {
    {
      FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {fileinfo.get_file_icon_color, config.background},
      }
    },
    {
      FileName = {
        provider = {'FileName', 'FileSize'},
        condition = condition.buffer_not_empty,
        highlight = {config.foreground, config.background},
        separator = config.separator,
        separator_highlight = {config.background, next.background}
      }
    }
  }

  return File
end

return generate
