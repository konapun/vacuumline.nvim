local get_segment_maker = require('vacuumline.backend.lualine.segment')

return function(sections)
  local make_segment = get_segment_maker()

  return {
    -- TODO: status is either active or inactive
    append_left = function(status, segment)
      local component = make_segment(segment, status)

      table.insert(sections.lualine_c, component)
    end,
    append_right = function(status, segment)
      local component = make_segment(segment, status)

      table.insert(sections.lualine_x, component)
    end,
  }
end
