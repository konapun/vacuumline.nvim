local vim = vim

local function file_position_line()
  return vim.fn.line('.')
end

local function file_position_column()
  return vim.fn.col('.')
end

local function file_position()
  return file_position_line() .. ':' .. file_position_column()
end

return {
  file_position_line = file_position_line,
  file_position_column = file_position_column,
  file_position = file_position,
}
