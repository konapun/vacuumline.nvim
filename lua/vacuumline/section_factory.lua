return {
  mode = function(config)
    local mode = require('vacuumline.section.mode')
    return mode(config.mode)
  end,
  file = function(config)
    local file = require('vacuumline.section.file')
    return file(config.file)
  end,
  vcs = function(config)
    local vcs = require('vacuumline.section.vcs')
    return vcs(config.vcs)
  end,
  lsp = function(config)
    local lsp = require('vacuumline.section.lsp')
    return lsp(config.lsp)
  end,
  search = function(config)
    local search = require('vacuumline.section.search')
    return search(config.search)
  end,
  lines = function(config)
    local lines = require('vacuumline.section.lines')
    return lines(config.lines)
  end,
  diagnostics = function(config)
    local diagnostics = require('vacuumline.section.diagnostics')
    return diagnostics(config.diagnostics)
  end,
  scroll = function(config)
    local scroll = require('vacuumline.section.scroll')
    return scroll(config.scroll)
  end,
}
