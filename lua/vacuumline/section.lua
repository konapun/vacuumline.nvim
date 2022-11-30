-- section: create a new section which holds segments
return function(segments, settings)
  settings = settings or {}
  local conditions = settings.conditions or {}

  for _, segment in ipairs(segments) do
    for _, condition in ipairs(conditions) do
      segment.add_condition(condition)
    end
  end

  local function get_size()
    local size = 0
    for _, segment in ipairs(segments) do
      size = size + segment.get_size()
    end
    return size
  end

  return {
    segments = segments,
    get_size = get_size
  }
end
