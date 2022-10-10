
return function(sections)
  local function ins_left(component)
    table.insert(sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(sections.lualine_x, component)
  end

  return {
    append_left = function(segment, status)
    end,
    append_right = function(segment, status)
    end,
  }
end
