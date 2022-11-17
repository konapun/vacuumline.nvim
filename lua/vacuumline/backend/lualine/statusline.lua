local get_segment_maker = require('vacuumline.backend.lualine.segment')

return function(lualine)
  local make_segment = get_segment_maker()

  return {
    append_left = function(status, segment)
      local component = make_segment(segment, status)
      local section_class = status == 'active' and lualine.sections or lualine.inactive_sections

      table.insert(section_class.lualine_c, component)
    end,
    append_right = function(status, segment)
      local component = make_segment(segment, status)
      local section_class = status == 'active' and lualine.sections or lualine.inactive_sections

      table.insert(section_class.lualine_x, component)
    end,
  }
end
