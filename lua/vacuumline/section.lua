-- section: create a new section which holds segments
return function(segments, settings)
  settings = settings or {}
  local conditions = settings.conditions or {}

  for _, segment in ipairs(segments) do
    for _, condition in ipairs(conditions) do
      segment.add_condition(condition)
    end
  end

  return {
    segments = segments,
  }
end
