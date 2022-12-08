local vim = vim
local internal_provider = require('vacuumline.provider')
local noop = require('vacuumline.provider.noop')
local diagnostics = require('vacuumline.provider.diagnostics')
local file = require('vacuumline.provider.file')
local lsp = require('vacuumline.provider.lsp')
local get_mode = require('vacuumline.provider.mode')
local search = require('vacuumline.provider.search')
local vcs = require('vacuumline.provider.vcs')

return function(config)
  local mode = get_mode(config.active.segments.mode.map)

  local function diagnostic_hint()
    return diagnostics.hint() or ' '
  end

  local function diagnostic_warn()
    return diagnostics.warn() or ' '

  end

  local function diagnostic_error()
    return diagnostics.error() or ' '
  end

  local function diagnostic_info()
    return diagnostics.info() or ' '
  end

  local function file_icon()
    return file.icon()
  end

  local function file_name()
    return file.name()
  end

  local function file_size()
    return file.size()
  end

  local function file_format()
    return file.format()
  end

  local function file_position()
    return file.position()
  end

  local function scroll_percent()
    -- return file.scroll_percent()
    return '5' -- FIXME:
  end

  local function scroll_bar()
    return file.scrollbar_instance()
  end

  local function lsp_client()
    return lsp.client()
  end

  local function mode_color()
    -- FIXME
    local color = mode.color()
    return '▋'
  end

  local function mode_label()
    return mode.label()
  end

  local function mode_icon()
    return mode.icon()
  end

  local function search_results()
    return search() or ' '
  end

  local function vcs_icon()
    return vcs.icon()
  end

  local function vcs_branch()
    return vcs.branch()
  end

  local function vcs_diff_added()
    return vcs.diff_added() or ' '

  end

  local function vcs_diff_modified()
    return vcs.diff_modified() or ' '

  end

  local function vcs_diff_removed()
    return vcs.diff_removed() or ' '
  end

  -- return a mapping from internal provider names to galaxyline provider functions
  return {
    -- noop
    [internal_provider.noop] = noop,

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
