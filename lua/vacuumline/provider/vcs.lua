local function get_icon()
    return '' -- TODO: other VCS
end

local function get_branch()
  -- TODO
end

local function diff_added()
  -- TODO
end

local function diff_modified()
  -- TODO
end

local function diff_removed()
  -- TODO
end

return {
  icon = get_icon,
  branch = get_branch,
  diff_added = diff_added,
  diff_modified = diff_modified,
  diff_removed = diff_removed,
}
