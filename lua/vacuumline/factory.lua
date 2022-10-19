-- initialize the statusline factory from a given backend
local function statusline(backend)
  local sl = backend.get_statusline()

  return {
    append_left = function(segment, status)
      return sl.append_left(segment, status)
    end,
    append_right = function(segment, status)
      return sl.append_right(segment, status)
    end,
  }
end

-- initialize the winbar factory from a given backend
local function winbar(backend)
  local wb = backend.get_winbar()

  return {
    append_left = function(segment, status)
      return wb.append_left(segment, status)
    end,
    append_right = function(segment, status)
      return wb.append_right(segment, status)
    end,
  }
end

-- providers
local function diagnostics(backend)
  return {
    warn = function() end,
    error = function() end,
    info = function() end,
  }
end
local function file(backend)
  return {
    icon = function() end,
    name = function() end,
    size = function() end,
    format = function() end,
    position = {
      line = function() end,
      column = function() end,
    }
  }
end
local function lsp(backend)
  return {
    client = function() end,
  }
end
local function mode(backend)
  return {
    color = function() end,
    label = function() end,
    icon = function() end,
  }
end
local function scroll(backend)
  return {
    percent = function() end,
    scrollbar = function() end,
  }
end
local function search(backend)
  return {
    results = function() end,
  }
end
local function vcs(backend)
  return {
    icon = function() end,
    branch = function() end,
    diff = {
      added = function() end,
      modified = function() end,
      removed = function() end,
    }
  }
end

-- initialize the provider factory from a given backend
local function provider(backend)
  return {
    diagnostics = diagnostics(backend),
    file = file(backend),
    lsp = lsp(backend),
    mode = mode(backend),
    scroll = scroll(backend),
    search = search(backend),
    vcs = vcs(backend),
  }
end

-- Create a factory for a given backend
return function(backend)
  return {
    -- statusline provides backend-specific functionality for manipulating the statusline
    statusline = statusline(backend),
    -- winbar provides backend-specific functionality for manipulating the winbar
    winbar = winbar(backend),
    -- provider provides backend-specific providers for use within sections
    provider = provider(backend),
  }
end

