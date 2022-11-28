local function spaces(n)
  return string.rep(' ', n)
end

local function make_padding(spaces_before, spaces_after)
  spaces_before = spaces_before or 0
  spaces_after = spaces_after or 0

  return function(value)
    return spaces(spaces_before) .. value .. spaces(spaces_after)

  end
end

local function combine(...)
  local formatters = {...}

  return function(value)
    for _, formatter in ipairs(formatters) do
      value = formatter(value)
    end

    return value
  end
end

local function truncate(fn)
  return function()
    local value = fn()

    return value:sub(1, 8) -- FIXME
  end
end

local function pad_before(fn)
  return function()
    local padder = make_padding(1)
    local value = fn()

    return padder(value)
  end
end

local function pad_after(fn)
  return function()
    local padder = make_padding(0, 1)
    local value = fn()

    return padder(value)
  end
end

local function pad(fn)
  return function()
    local padder = make_padding(1, 1)
    local value = fn()

    return padder(value)
  end
end

return {
  combine = combine,
  truncate = truncate,
  pad_before = pad_before,
  pad_after = pad_after,
  pad = pad
}
