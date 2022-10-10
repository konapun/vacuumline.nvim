local vim = vim
local fileinfo = require('galaxyline.provider_fileinfo')
local mode = require('vacuumline.provider.mode')

local ModeIndicatorKey = 'ModeIndicator_' .. 'FIXME' -- FIXME
local galaxy_label = 'Galaxy' .. ModeIndicatorKey

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

  vim.api.nvim_command("hi " .. galaxy_label .. " guifg=" .. color)
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
end

local function vcs_icon()
end

local function vcs_branch()
end

local function vcs_diff_added()
end

local function vcs_diff_modified()
end

local function vcs_diff_removed()
end

return {
  diagnostic_warn = diagnostic_warn,
  diagnostic_error = diagnostic_error,
  diagnostic_info = diagnostic_info,
  file_icon = file_icon,
  file_name = file_name,
  file_size = file_size,
  file_format = file_format,
  file_position_line = file_position_line,
  file_position_column = file_position_column,
  lsp_client = lsp_client,
  mode_color = mode_color,
  mode_label = mode_label,
  mode_icon = mode_icon,
  scroll_percent = scroll_percent,
  scroll_bar = scroll_bar,
  search_results = search_results,
  vcs_icon = vcs_icon,
  vcs_branch = vcs_branch,
  vcs_diff_added = vcs_diff_added,
  vcs_diff_modified = vcs_diff_modified,
  vcs_diff_removed = vcs_diff_removed,
}
