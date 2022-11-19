local vim = vim
local internal_provider = require('vacuumline.provider')
local extension = require('galaxyline.provider_extensions')
local diagnostic = require('galaxyline.provider_diagnostic')
local fileinfo = require('galaxyline.provider_fileinfo')
local lsp = require('galaxyline.provider_lsp')
local vcs = require('galaxyline.provider_vcs')
local get_mode = require('vacuumline.provider.mode')
local search = require('vacuumline.provider.search')
local file = require('vacuumline.provider.file')

return function(config)
  local mode = get_mode(config.active.segments.mode.map)

  local function diagnostic_hint()
    return diagnostic.get_diagnostic_hint()
  end

  local function diagnostic_warn()
    return diagnostic.get_diagnostic_warn()
  end

  local function diagnostic_error()
    return diagnostic.get_diagnostic_error()
  end

  local function diagnostic_info()
    return diagnostic.get_diagnostic_info()
  end

  local function file_icon()
    return fileinfo.get_file_icon()
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

  local function file_position()
    return file.position()
  end

  local function scroll_percent()
    return fileinfo.current_line_percent()
  end

  local function scroll_bar()
    return extension.scrollbar_instance()
  end

  local function lsp_client()
    return lsp.get_lsp_client()
  end

  local function mode_color()
    local color = mode.color()
    local id = "mode_color_indicator_active" -- FIXME: Is there a better way to do this?

    vim.api.nvim_command("hi Galaxy"..id.." guifg=" .. color)
    return '▋'
  end

  local function mode_label()
    return mode.label()
  end

  local function mode_icon()
    return mode.icon()
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
    return vcs.diff_add()
  end

  local function vcs_diff_modified()
    return vcs.diff_modified()
  end

  local function vcs_diff_removed()
    return vcs.diff_remove()
  end

  -- return a mapping from internal provider names to galaxyline provider functions
  return {
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
    [internal_provider.file.position] = file_position,

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
end
