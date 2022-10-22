local vim = vim
local internal_provider = require('vacuumline.provider')
local fileinfo = require('galaxyline.provider_fileinfo')
local vcs = require('galaxyline.provider_vcs')
local mode = require('vacuumline.provider.mode')
local search = require('vacuumline.provider.search')

local function diagnostic_hint()
  return 'DiagnosticHint' -- galaxyline builtin
end

local function diagnostic_warn()
  return 'DiagnosticWarn' -- galaxyline builtin
end

local function diagnostic_error()
    return 'DiagnosticError' -- galaxyline builtin
end

local function diagnostic_info()
  return 'DiagnosticInfo' -- galaxyline builtin
end

local function file_icon()
  return 'FileIcon' -- galaxyline builtin
end

local function file_name()
  return fileinfo.get_current_file_name()
end

local function file_size()
  return fileinfo.get_file_size()
end

local function file_format()
  return fileinfo.get_file_format()
end

local function file_position_line()
  return 'LineColumn' -- FIXME
end

local function file_position_column()
  return 'LineColumn' -- FIXME
end

local function lsp_client()
  return 'GetLspClient' -- galaxyline builtin
end

local function mode_color()
  local color = mode.mode_color()

  vim.api.nvim_command("hi GalaxyViMode guifg=" .. color)
  return '▋'
end

local function mode_label()
  return mode.mode_label
end

local function mode_icon()
  return mode.mode_icon
end

local function scroll_percent()
  return 'LinePercent' -- galaxyline builtin
end

local function scroll_bar()
  return 'ScrollBar' -- galaxyline builtin
end

local function search_results()
  return search()
end

local function vcs_icon()
  return ' '
end

local function vcs_branch()
  return vcs.get_git_branch()
end

local function vcs_diff_added()
  -- TODO:  icon = ' ', -- This can probably be added to the section?
  return 'DiffAdd'
end

local function vcs_diff_modified()
  -- TODO:  icon = ' ',
  return 'DiffModified'
end

local function vcs_diff_removed()
  -- TODO:  icon = ' ',
  return 'DiffRemove'
end

-- return a mapping from internal provider names to galaxyline provider functions
return {
  [internal_provider.null] = function() end,

  -- diagnostics
  [internal_provider.diagnostics.hint] = diagnostic_hint,
  [internal_provider.diagnostics.warn] = diagnostic_warn,
  [internal_provider.diagnostics.error] = diagnostic_error,
  [internal_provider.diagnostics.info] = diagnostic_info,

  -- file
  [internal_provider.file.icon] = file_icon,
  [internal_provider.file.name] = file_name,
  [internal_provider.file.size] = file_size,
  [internal_provider.file.format] = file_format,
  [internal_provider.file.position.line] = file_position_line,
  [internal_provider.file.position.column] = file_position_column,

  -- mode
  [internal_provider.mode.color] = mode_color,
  [internal_provider.mode.label] = mode_label,
  [internal_provider.mode.icon] = mode_icon,

  -- lsp
  [internal_provider.lsp.client] = lsp_client,

  -- scroll
  [internal_provider.scroll.percent] = scroll_percent,
  [internal_provider.scroll.bar] = scroll_bar,

  -- search
  [internal_provider.search.results] = search_results,

  -- vcs
  [internal_provider.vcs.icon] = vcs_icon,
  [internal_provider.vcs.branch] = vcs_branch,
  [internal_provider.vcs.diff.added] = vcs_diff_added,
  [internal_provider.vcs.diff.modified] = vcs_diff_modified,
  [internal_provider.vcs.diff.removed] = vcs_diff_removed,
}

