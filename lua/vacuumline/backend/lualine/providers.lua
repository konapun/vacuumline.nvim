local vim = vim
local internal_provider = require('vacuumline.provider')
local get_mode = require('vacuumline.provider.mode')
local search = require('vacuumline.provider.search')

return function(config)
  -- local mode = get_mode(config)

  local function diagnostic_hint()
    return 'diagnostic hint' -- TODO
  end

  local function diagnostic_warn()
    return 'diagnostic warn' -- TODO
  end

  local function diagnostic_error()
    return 'diagnostic error' -- TODO
  end

  local function diagnostic_info()
    return 'diagnostic info' -- TODO
  end

  local function file_icon()
    return 'file icon' -- TODO
  end

  local function file_name()
    return 'file name' -- TODO
  end

  local function file_size()
    return 'file size' -- TODO
  end

  local function file_format()
    return 'file format' -- TODO
  end

  local function file_position()
    return 'file position' -- TODO
  end

  local function lsp_client()
    return 'lsp client' -- TODO
  end

  local function mode_color()
    return 'mode color' -- TODO
  end

  local function mode_label()
    return 'mode label' -- TODO
  end

  local function mode_icon()
    return 'mode icon' -- TODO
  end

  local function scroll_percent()
    return 'scroll percent' -- TODO
  end

  local function scroll_bar()
    return 'scroll bar' -- TODO
  end

  local function search_results()
    return search()
  end

  local function vcs_icon()
    return ' '
  end

  local function vcs_branch()
    return 'vcs branch' -- TODO
  end

  local function vcs_diff_added()
    return 'vcs diff added' -- TODO
  end

  local function vcs_diff_modified()
    return 'vcs diff modified' -- TODO
  end

  local function vcs_diff_removed()
    return 'vcs diff removed' -- TODO
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
