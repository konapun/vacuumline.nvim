local statusline = {}

local function make_segment(segment, status)
  local segment_key = "FIXME"
  return {
    [segment_key] = {
      provider = segment.provider,
      condition = segment.condition,
      highlight = {segment.foreground, segment.background},
      separator = segment.separator,
      separator_highlight = {segment.separator_forground, segment.separator_background},
    }
  }
end

return {
  append_left = function(segment, status)
    local gl_segment = make_segment(segment, status)
    -- TODO
  end,
  append_right = function(segment, status)
    local gl_segment = make_segment(segment, status)
    -- TODO
  end,
}
