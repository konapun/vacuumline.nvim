local condition = require('vacuumline.condition')
local vcs = require('galaxyline.provider_vcs')
local vim = vim

local checkwidth = function()
  if not condition.buffer_not_empty() then
    return false
  end

  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local function generate(opts, mode)
  local segment = opts.segments
  local config = segment.vcs

  local VCS = {
    {
      GitIcon = {
        provider = function() return ' ' end,
        condition = condition.buffer_not_empty,
        highlight = {config.foreground, config.background}, -- FIXME: use a different color for foreground
      }
    },
    {
      GitBranch = {
        provider = function() return vcs.get_git_branch() .. ' ' end,
        condition = condition.buffer_not_empty,
        highlight = {config.foreground, config.background},
      }
    },
    {
      DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: use green instead for foreground
      }
    },
    {
      DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: Use yellow instead for foreground
      }
    },
    {
      DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: use red instead for foreground
      }
    },
    {
      VcsEnd = {
        provider = function() return config.separator end,
        condition = condition.buffer_not_empty,
        separator = config.separator,
        separator_highlight = {config.background, config.vacuumline_background},
        highlight = {config.background, config.background}
      }
    }
  }

  return VCS
end

return generate
