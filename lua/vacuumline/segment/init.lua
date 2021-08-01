local mode = require('vacuumline.segment.mode')
local file = require('vacuumline.segment.file')
local vcs = require('vacuumline.segment.vcs')
local scroll = require('vacuumline.segment.scroll')
local lines = require('vacuumline.segment.lines')
local diagnostics = require('vacuumline.segment.diagnostics')
local blank = require('vacuumline.segment.blank')
local search = require('vacuumline.segment.search')
local lsp = require('vacuumline.segment.lsp')

local M = {}

M.left = {
  {key = 'mode', generator = mode},
  {key = 'file', generator = file},
  {key = 'vcs', generator = vcs}
}

M.right = {
  {key = 'lsp', generator = lsp},
  {key = 'search', generator = search},
  {key = 'lines', generator = lines},
  {key = 'blank', generator = blank},
  {key = 'diagnostics', generator = diagnostics},
  {key = 'scroll', generator = scroll}
}

--[[
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = separator.left_segment,
    separator_highlight = {palette.purple,palette.background},
    highlight = {palette.background,palette.purple}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = separator.right_segment,
    separator_highlight = {palette.purple,palette.background},
    highlight = {palette.background,palette.purple}
  }
]]

M.short_left = {
  {key = 'file', generator = file}
}

M.short_right = {
  {key = 'lines', generator = lines},
  {key = 'blank', generator = blank},
  {key = 'diagnostics', generator = diagnostics},
  {key = 'scroll', generator = scroll}
}

return M
