return function(theme)
  return {
    mode = function()
      local mode = require('vacuumline.section.mode')
      return mode(theme)
    end,
    file = function()
      local file = require('vacuumline.section.file')
      return file(theme)
    end,
    vcs = function()
      local vcs = require('vacuumline.section.vcs')
      return vcs(theme)
    end,
    lsp = function()
      local lsp = require('vacuumline.section.lsp')
      return lsp(theme)
    end,
    search = function()
      local search = require('vacuumline.section.search')
      return search(theme)
    end,
    format = function()
      local format = require('vacuumline.section.format')
      return format(theme)
    end,
    diagnostics = function()
      local diagnostics = require('vacuumline.section.diagnostics')
      return diagnostics(theme)
    end,
    scroll = function()
      local scroll = require('vacuumline.section.scroll')
      return scroll(theme)
    end,
  }
end
