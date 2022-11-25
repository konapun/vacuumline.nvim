local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.provider')
local conditions = require('vacuumline.condition')
local formatters = require('vacuumline.formatter')

return function(config)
  local vcs_icon = segment({
    id = 'vcs_icon',
    provider = providers.vcs.icon,
    formatter = formatters.pad,
    color = {
      foreground = config.foreground,
      background = config.background,
      style = 'bold',
    },
  })

  local vcs_branch = segment({
    id = 'vcs_branch',
    provider = providers.vcs.branch,
    formatter = formatters.pad_after,
    color = {
      foreground = config.foreground,
      background = config.background,
      style = 'bold',
    },
  })

  local diff_add = segment({
    id = 'diff_add',
    provider = providers.vcs.diff.added,
    icon = ' ',
    color = {
      foreground = config.foreground,
      background = config.background,
    },
  })

  local diff_modified = segment({
    id = 'diff_modified',
    provider = providers.vcs.diff.modified,
    icon = ' ',
    color = {
      foreground = config.foreground,
      background = config.background,
    },
  })

  local diff_remove = segment({
    id = 'diff_remove',
    provider = providers.vcs.diff.removed,
    icon = ' ',
    color = {
      foreground = config.foreground,
      background = config.background,
    },
    separator = {
      symbol = config.separator,
      foreground = config.background,
      background = config.next_background,
    },
  })

  -- TODO: Add separator separately so that individual segments can be hidden

  return section({ vcs_icon, vcs_branch, diff_add, diff_modified, diff_remove }, {
    conditions = { conditions.standard_not_empty, conditions.check_vcs }
  })
end
