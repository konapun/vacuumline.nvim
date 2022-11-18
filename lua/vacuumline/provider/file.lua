local vim = vim

local function file_icon()
  -- TODO
end

local function file_name()
  -- TODO
end

local function file_size()
  -- TODO
end

local function file_format()
  -- TODO
end

local function file_position_line()
  return vim.fn.line('.')
end

local function file_position_column()
  return vim.fn.col('.')
end

local function file_position()
  return file_position_line() .. ':' .. file_position_column()
end

local function scroll_percent()
  -- TODO
end

local function scrollbar_instance()
  -- TODO
end

return {
  icon = file_icon,
  name = file_name,
  size = file_size,
  format = file_format,
  position_line = file_position_line,
  position_column = file_position_column,
  position = file_position,
  scroll_percent = scroll_percent,
  scrollbar_instance = scrollbar_instance
}
