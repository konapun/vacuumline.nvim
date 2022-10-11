-- adapt an internal segment into a galaxyline segment
return function(segment, status)
  local segment_key = "FIXME"

  return {
    [segment_key] = {
      provider = segment.provider,
      condition = segment.condition,
      highlight = { segment.foreground, segment.background },
      separator = segment.separator,
      separator_highlight = { segment.separator_forground, segment.separator_background },
    }
  }
end
