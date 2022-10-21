
return function(sections)
  local function ins_left(component)
    table.insert(sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(sections.lualine_x, component)
  end

  return {
    append_left = function(status, segment)
      -- TODO
    end,
    append_right = function(status, segment)
      -- TODO
    end,
  }
end
