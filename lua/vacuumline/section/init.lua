local mode = require('vacuumline.section.mode')
local file = require('vacuumline.section.file')
local vcs = require('vacuumline.section.vcs')
local scroll = require('vacuumline.section.scroll')
local lines = require('vacuumline.section.lines')
local diagnostics = require('vacuumline.section.diagnostics')
local search = require('vacuumline.section.search')
local lsp = require('vacuumline.section.lsp')

local M = {}

-- from left to right
M.left = {
  mode,
  file,
  vcs
}

-- from left to right
M.right = {
  lsp,
  search,
  diagnostics,
  lines,
  scroll
}

return M
