local vim = vim

-- Perform a full merge over variadic tables
local function merge(...)
  local result = {}
  for _, table in ipairs({...}) do
    for key, value in pairs(table) do
      if type(value) == 'table' then
        if type(result[key] or false) == 'table' then
          merge(result[key], value)
        else
          result[key] = value
        end
      else
        result[key] = value
      end
    end
  end
  return result
end

-- Inspect the contents of a variable
local function inspect(o)
  return vim.inspect(o)
end

return {
  merge = merge,
  inspect = inspect,
}
