local segment = require('vacuumline.segment')
local section = require('vacuumline.section')
local providers = require('vacuumline.providers')

return function(theme)
  local vcs_icon = segment({
    id = 'vcs_icon',
    provider = providers.vcs.icon,
    color = {
      foreground = theme.foreground,
      background = theme.background,
      style = 'bold',
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.foreground,
      background = theme.background,
    },
  })

  local vcs_branch = segment({
    id = 'vcs_branch',
    provider = providers.vcs.branch,
    color = {
      foreground = theme.foreground,
      background = theme.background,
      style = 'bold',
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.foreground,
      background = theme.background,
    },
  })

  local diff_add = segment({
    id = 'diff_add',
    provider = providers.vcs.diff.add,
    color = {
      foreground = theme.diff.add.foreground,
      background = theme.diff.add.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diff.add.background,
      background = theme.diff.add.background,
    },
  })

  local diff_modified = segment({
    id = 'diff_modified',
    provider = providers.vcs.diff.modified,
    color = {
      foreground = theme.diff.modified.foreground,
      background = theme.diff.modified.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diff.modified.background,
      background = theme.diff.modified.background,
    },
  })

  local diff_remove = segment({
    id = 'diff_remove',
    provider = providers.vcs.diff.remove,
    color = {
      foreground = theme.diff.remove.foreground,
      background = theme.diff.remove.background,
    },
    separator = {
      symbol = theme.separator,
      foreground = theme.diff.remove.background,
      background = theme.diff.remove.background,
    },
  })

  local vcs = section()
  vcs.add_segment(vcs_icon)
  vcs.add_segment(vcs_branch)
  vcs.add_segment(diff_add)
  vcs.add_segment(diff_modified)
  vcs.add_segment(diff_remove)

  return vcs
end
