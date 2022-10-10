return function(theme)
  return {
    mode = function()
      local mode = require('vacuumline.segment.mode')
      return mode(theme)
    end,
    file = function()
      local file = require('vacuumline.segment.file')
      return file(theme)
    end,
    vcs = function()
      local vcs = require('vacuumline.segment.vcs')
      return vcs(theme)
    end,
    lsp = function()
      local lsp = require('vacuumline.segment.lsp')
      return lsp(theme)
    end,
    search = function()
      local search = require('vacuumline.segment.search')
      return search(theme)
    end,
    format = function()
      local format = require('vacuumline.segment.format')
      return format(theme)
    end,
    diagnostics = function()
      local diagnostics = require('vacuumline.segment.diagnostics')
      return diagnostics(theme)
    end,
    scroll = function()
      local scroll = require('vacuumline.segment.scroll')
      return scroll(theme)
    end,
  }
end
