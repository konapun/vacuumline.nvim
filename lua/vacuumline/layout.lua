return function()
  local registry = {} -- keep

  local function allocate(section, space)
  end

  return {
    allocate = allocate
  }
end
