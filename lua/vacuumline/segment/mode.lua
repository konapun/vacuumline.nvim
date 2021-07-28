local vim = vim

local function generate(opts)
  local config = opts.mode -- TODO: config needs to be built after sorting is done in order to choose the correct color for blending the next section, also needs to ensure keys/values exist
  local mode_map = config.map

  local Mode = {
    ModeIndicator = {
      provider = function()
        local mode_config = mode_map[vim.fn.mode()]

        vim.api.nvim_command("hi GalaxyModeIndicator guifg=" .. mode_config.background)
        return '▋'
      end,
      highlight = {config.background, config.background}
    },
    ModeLabel = {
      provider = function()
        return mode_map[vim.fn.mode()].label
      end,
      highlight = {config.background, config.foreground, 'bold'},
      separator = config.separator,
      separator_highlight = {config.background, config.foreground} -- TODO: foreground should be background of next segment
    }
  }

  return Mode
end

return generate

