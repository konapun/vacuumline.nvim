local mode = require('vacuumline.segment.mode')
local file = require('vacuumline.segment.file')
local vcs = require('vacuumline.segment.vcs')
local scroll = require('vacuumline.segment.scroll')
local lines = require('vacuumline.segment.lines')
local diagnostics = require('vacuumline.segment.diagnostics')
local search = require('vacuumline.segment.search')
local lsp = require('vacuumline.segment.lsp')

local M = {}

-- TODO: use "base" segment to make it easier to loop through segments with multiple sections
-- from left to right
M.left = {
  {key = 'mode', generator = mode},
  {key = 'file', generator = file},
  {key = 'vcs', generator = vcs}
}

-- FIXME: do right to left for .next pointer
-- from left to right
M.right = {
  {key = 'lsp', generator = lsp},
  {key = 'search', generator = search},
  {key = 'diagnostics', generator = diagnostics},
  {key = 'lines', generator = lines},
  {key = 'scroll', generator = scroll}
}

return M
