local condition = require('vacuumline.condition')

local function generate(opts)
  local config = opts.file

  local File = {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, config.foreground}, -- FIXME: different color
    },
    FileName = {
      provider = {'FileName', 'FileSize'},
      condition = condition.buffer_not_empty,
      highlight = {config.foreground, config.background},
      separator = config.separator,
      separator_highlight = {config.background, config.foreground} -- TODO: foreground should be background of next segment (config.next.background)
    }
  }

  return  File
end

return generate
