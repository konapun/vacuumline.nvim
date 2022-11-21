--[[
-- Example:
color = environment.watch(config, {'background', 'foreground'}).on_change(function(background, foreground)
  return {
    foreground = foreground,
    background = background,
  }
end)

TODO:
  1. Update vacuumline.lua to create environment which gets passed around
  2. Make section_factory an initializer function which takes the environment and creates a dispatcher/watcher which gets injected into vacuumline sections
  3. Sections which rely on updates from the environment use the watcher to respond to updates
     - mode color indicator
     - "next" property from options
--]]

local function make_watcher(table, props)
  local function on_change()
    -- TODO
  end

  return {
    on_change = on_change
  }
end

-- Create a new environment
return function()
  local environment = {}
  local dispatch = get_dispatch()

  local function set(key, value)
    environment[key] = value
    dispatch(key, value)
  end

  local function get(key)
    return environment[key]
  end

  local function watch(table, props)
    return make_watcher(table, props)
  end

  return {
    set = set,
    get = get,
    watch = watch
  }
end
