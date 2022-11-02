-- These are to be used internally by segments and will be transformed by the specific backend
return {
  null = 'null', -- TODO: Maybe not needed? (galaxyline may be able to handle what's needed if lualine doesn't need this)
  diagnostics = {
    hint = 'diagnostic_hint',
    warn = 'diagnostic_warn',
    error = 'diagnostic_error',
    info = 'diagnostic_info',
  },
  file = {
    icon = 'file_icon',
    name = 'file_name',
    size = 'file_size',
    format = 'file_format',
    position = 'file_position',
  },
  mode = {
    color = 'mode_color',
    label = 'mode_label',
    icon = 'mode_icon',
  },
  lsp = {
    client = 'lsp_client',
  },
  scroll = {
    percent = 'scroll_percent',
    bar = 'scroll_bar',
  },
  search = {
    results = 'search_results',
  },
  vcs = {
    icon = 'vcs_icon',
    branch = 'vcs_branch',
    diff = {
      added = 'vcs_diff_added',
      modified = 'vcs_diff_modified',
      removed = 'vcs_diff_removed',
    }
  }
}