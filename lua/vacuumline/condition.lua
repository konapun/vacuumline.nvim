local vim = vim

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

local function hide_in_width()
  local squeeze_width = vim.fn.winwidth(0) / 2
  return squeeze_width > 50
end

local function check_width(width)
  return vim.fn.winwidth(0) > width
end

local function gen_check_width(width)
  return function()
    return check_width(width)
  end
end

-- Guarantees that mode will never be hidden
local function guarantee_mode()
  return check_width(10)
end

local function standard()
  return guarantee_mode()
end

-- Buffer not empty and guarantee mode
local function standard_not_empty()
  return buffer_not_empty() and guarantee_mode()
end

local function gen_standard_not_empty(width)
  return function()
    return standard_not_empty() and check_width(width)
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

local function has_focus()
  -- FIXME
  -- return vim.g.statusline_winid == vim.fn.win_getid()
  return true
end

return {
  combine = combine,
  has_focus = has_focus,
  buffer_not_empty = buffer_not_empty,
  hide_in_width = hide_in_width,
  check_width = check_width,
  gen_check_width = gen_check_width,
  guarantee_mode = guarantee_mode,
  standard = standard,
  standard_not_empty = standard_not_empty,
  gen_standard_not_empty = gen_standard_not_empty,
  is_terminal = is_terminal,
  not_terminal = not_terminal,
  check_vcs = check_vcs
}
