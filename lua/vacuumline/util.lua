-- Perform a one dimensional merge over two tables
local function merge(t1, t2)
  local merged = {}
  for k, v in pairs(t1) do
    merged[k] = v
  end

  if t2 then
    for k, v in pairs(t2) do
      merged[k] = v
    end
  end

  return merged
end

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

return {
  merge = merge,
  dump = dump
}
