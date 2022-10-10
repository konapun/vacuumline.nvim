-- null winbar implementation for backends which don't support nvim0.8's winbar
return {
  append_left = function(segment, status)
    -- noop
  end,
  append_right = function(segment, status)
    -- noop
  end,
}
