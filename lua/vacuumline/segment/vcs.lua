local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local vim = vim

local function section_condition()
  return condition.buffer_not_empty() and condition.hide_in_width()
end

local function generate(opts, mode)
  local segment = opts.segments
  local config = segment.vcs

  local VCS = {
    {
      GitIcon = {
        provider = function() return ' ' end,
        condition = section_condition,
        highlight = {config.foreground, config.background}, -- FIXME: use a different color for foreground
      }
    },
    {
      GitBranch = {
        provider = function() return vcs.get_git_branch() .. ' ' end,
        condition = section_condition,
        highlight = {config.foreground, config.background},
      }
    },
    {
      DiffAdd = {
        provider = 'DiffAdd',
        condition = section_condition,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: use green instead for foreground
      }
    },
    {
      DiffModified = {
        provider = 'DiffModified',
        condition = section_condition,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: Use yellow instead for foreground
      }
    },
    {
      DiffRemove = {
        provider = 'DiffRemove',
        condition = section_condition,
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
