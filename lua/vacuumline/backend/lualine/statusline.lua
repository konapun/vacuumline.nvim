local get_segment_maker = require('vacuumline.backend.lualine.segment')

return function(config)
  local make_segment = get_segment_maker(config)

  local function ins_left(component)
    table.insert(sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(sections.lualine_x, component)
  end

  return {
    append_left = function(status, segment)
      print('APPENDING LEFT')
      -- TODO
    end,
    append_right = function(status, segment)
      print('APPENDING RIGHT')
      -- TODO
    end,
  }
end
