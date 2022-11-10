return {
  mode = function()
    local mode = require('vacuumline.section.mode')
    return {'mode', function(config) return mode(config.mode) end}
  end,
  file = function()
    local file = require('vacuumline.section.file')
    return {'file', function(config) return file(config.file) end}
  end,
  vcs = function()
    local vcs = require('vacuumline.section.vcs')
    return {'vcs', function(config) return vcs(config.vcs) end}
  end,
  lsp = function()
    local lsp = require('vacuumline.section.lsp')
    return {'lsp', function(config) return lsp(config.lsp) end}
  end,
  search = function()
    local search = require('vacuumline.section.search')
    return {'search', function(config) return search(config.search) end}
  end,
  lines = function()
    local lines = require('vacuumline.section.lines')
    return {'lines', function(config) return lines(config.lines) end}
  end,
  diagnostics = function()
    local diagnostics = require('vacuumline.section.diagnostics')
    return {'diagnostics', function(config) return diagnostics(config.diagnostics) end}
  end,
  scroll = function()
    local scroll = require('vacuumline.section.scroll')
    return {'scroll', function(config) return scroll(config.scroll) end}
  end,
}
