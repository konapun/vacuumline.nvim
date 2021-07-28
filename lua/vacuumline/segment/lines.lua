local function generate(opts)
  local config = opts.lines

  local Lines = {
    FileFormat = {
      provider = 'FileFormat',
      highlight = {config.foreground, config.background},
      separator = config.separator,
      separator_highlight = {config.foreground, config.background}
    },
    LineInfo = {
      provider = 'LineColumn',
      highlight = {config.foreground, config.background},
      separator = config.half_separator,
      separator_highlight = {config.foreground, config.background},
    }
  }

  return Lines
end

return generate
