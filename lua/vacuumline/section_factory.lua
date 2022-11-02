return function(config)
  return {
    mode = function()
      local mode = require('vacuumline.section.mode')
      return mode(config.mode)
    end,
    file = function()
      local file = require('vacuumline.section.file')
      return file(config.file)
    end,
    vcs = function()
      local vcs = require('vacuumline.section.vcs')
      return vcs(config.vcs)
    end,
    lsp = function()
      local lsp = require('vacuumline.section.lsp')
      return lsp(config.lsp)
    end,
    search = function()
      local search = require('vacuumline.section.search')
      return search(config.search)
    end,
    lines = function()
      local lines = require('vacuumline.section.lines')
      return lines(config.lines)
    end,
    diagnostics = function()
      local diagnostics = require('vacuumline.section.diagnostics')
      return diagnostics(config.diagnostics)
    end,
    scroll = function()
      local scroll = require('vacuumline.section.scroll')
      return scroll(config.scroll)
    end,
  }
end
