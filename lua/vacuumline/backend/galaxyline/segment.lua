-- adapt an internal segment into a galaxyline segment
return function(segment, status)
  local segment_key = segment.id .. '_' .. status

  local color = segment.color
  local separator = segment.separator
  return {
    [segment_key] = {
      provider = segment.provider,
      condition = segment.condition,
      icon = segment.icon, -- FIXME: This probably isn't needed since it can be part of the provider
      highlight = { color.foreground, color.background },
      separator = separator.symbol,
      separator_highlight = { separator.foreground, separator.background },
    }
  }
end
