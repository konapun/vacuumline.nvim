-- initialize the statusline factory from a given backend
local function statusline(backend)
  local sl = backend.statusline

  return {
    append_left = function(status, segment)
      return sl.append_left(status, segment)
    end,
    append_right = function(status, segment)
      return sl.append_right(status, segment)
    end,
  }
end

-- initialize the winbar factory from a given backend
local function winbar(backend)
  local wb = backend.winbar

  return {
    append_left = function(status, segment)
      return wb.append_left(status, segment)
    end,
    append_right = function(status, segment)
      return wb.append_right(status, segment)
    end,
  }
end

-- Create a factory for a given backend
return function(backend)
  return {
    -- statusline provides backend-specific functionality for manipulating the statusline
    statusline = statusline(backend),
    -- winbar provides backend-specific functionality for manipulating the winbar
    winbar = winbar(backend),
  }
end

