local vim = vim

-- Generate a new condition which is the AND of all passed conditions
local function combine(...)
  local conditions = {...}

  return function()
    for _, condition in ipairs(conditions) do
      if not condition() then
        return false
      end
    end

    return true
  end
end

local function buffer_not_empty()
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local function has_focus()
  -- FIXME
  -- return vim.g.statusline_winid == vim.fn.win_getid()
  return true
end

-- test window width against a priority
local function shrink_with_priority(priority)
  return function()
    -- return vim.fn.winwidth(0) / 2 > priority
    print('Winwidth:', vim.fn.winwidth(0))
    return true
  end
end

local function check_width(width)
  return function()
    return check_width(width)
  end
end

local function is_terminal(window)
  window = window or 0
  return vim.bo[window].buftype == 'terminal'
end

local function not_terminal(window)
  return not is_terminal(window)
end

local function check_vcs()
  local filepath = vim.fn.expand('%:p:h')
  local gitdir = vim.fn.finddir('.git', filepath .. ';')

  return gitdir and #gitdir > 0 and #gitdir < #filepath
end

return {
  combine = combine,
  has_focus = has_focus,
  buffer_not_empty = buffer_not_empty,
  shrink_with_priority = shrink_with_priority,
  check_width = check_width,
  is_terminal = is_terminal,
  not_terminal = not_terminal,
  check_vcs = check_vcs
}
