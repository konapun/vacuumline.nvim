--[[
This code is adapted from https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_diagnostic.lua
--]]
local vim, lsp, api, diagnostic = vim, vim.lsp, vim.api, vim.diagnostic

-- coc diagnostic
local function get_coc_diagnostic(diag_type)
  local has_info, info = pcall(vim.api.nvim_buf_get_var, 0, 'coc_diagnostic_info')
  if not has_info then return end
  if info[diag_type] > 0 then
    return info[diag_type]
  end
  return ''
end

-- nvim-lspconfig
-- see https://github.com/neovim/nvim-lspconfig
local function get_nvim_lsp_diagnostic(diag_type)
  if next(lsp.buf_get_clients(0)) == nil then return '' end
  local active_clients = lsp.get_active_clients()

  if active_clients then
    local count = #diagnostic.get(vim.api.nvim_get_current_buf(), { severity = diag_type })
    if count ~= 0 then return count .. ' ' end
  end
end

local function get_diagnostic_error()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_diagnostic('error')
  elseif not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.ERROR)
  end
  return ''
end

local function get_diagnostic_warn()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_diagnostic('warning')
  elseif not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.WARN)
  end
  return ''
end

local function get_diagnostic_hint()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_diagnostic('hint')
  elseif not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.HINT)
  end
  return ''
end

local function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_diagnostic('information')
  elseif not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.INFO)
  end
  return ''
end

return {
  get_diagnostic_hint = get_diagnostic_hint,
  get_diagnostic_info = get_diagnostic_info,
  get_diagnostic_warn = get_diagnostic_warn,
  get_diagnostic_error = get_diagnostic_error,
}
