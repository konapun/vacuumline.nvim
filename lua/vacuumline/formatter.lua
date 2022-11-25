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

local function pad(fn)
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

return {
  pad = pad,
  pad_after = pad_after
}
