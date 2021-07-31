local mode = require('vacuumline.segment.mode')
local file = require('vacuumline.segment.file')
local vcs = require('vacuumline.segment.vcs')
local scroll = require('vacuumline.segment.scroll')
local lines = require('vacuumline.segment.lines')
local diagnostics = require('vacuumline.segment.diagnostics')
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
  {key = 'diagnostics', generator = diagnostics},
  {key = 'scroll', generator = scroll}
}

return M
