Active = 'active'
Inactive = 'inactive'

-- section: create a new section which holds segments
return function()
  local segments = {}

  return {
    segments = segments,
    add_segment = function(segment)
      table.insert(segments, segment)
    end,
  }
end
