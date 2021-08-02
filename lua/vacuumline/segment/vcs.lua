local condition = require('vacuumline.condition')
local vcs = require('galaxyline.provider_vcs')
local vim = vim

local function section_condition()
  return condition.standard() and condition.buffer_not_empty() and condition.hide_in_width()
end

local function generate(opts, mode)
  local segment = opts.segments
  local config = segment.vcs

  local GitIconKey = 'GitIcon_' .. mode
  local GitBranchKey = 'GitBranch_' .. mode
  local DiffAddKey = 'DiffAdd_' .. mode
  local DiffModifiedKey = 'DiffModified_' .. mode
  local DiffRemoveKey = 'DiffRemove_' .. mode
  local VcsEndKey = 'VcsEnd_' .. mode

  local VCS = {
    {
      [GitIconKey] = {
        provider = function() return ' ' end,
        condition = section_condition,
        highlight = {config.foreground, config.background}, -- FIXME: use a different color for foreground
      }
    },
    {
      [GitBranchKey] = {
        provider = function()
          local branch = vcs.get_git_branch()
          if (branch) then
            return branch .. ' '
          end
        end,
        condition = section_condition,
        highlight = {config.foreground, config.background},
      }
    },
    {
      [DiffAddKey] = {
        provider = 'DiffAdd',
        condition = section_condition,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: use green instead for foreground
      }
    },
    {
      [DiffModifiedKey] = {
        provider = 'DiffModified',
        condition = section_condition,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: Use yellow instead for foreground
      }
    },
    {
      [DiffRemoveKey] = {
        provider = 'DiffRemove',
        condition = section_condition,
        icon = ' ',
        highlight = {config.foreground, config.background} -- TODO: use red instead for foreground
      }
    },
    {
      [VcsEndKey] = {
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
