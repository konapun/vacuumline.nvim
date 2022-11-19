--[[
Parts of this code adapted from https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_fileinfo.lua
--]]

local vim = vim

local user_icons = {}

local function get_file_info()
  return vim.fn.expand('%:t'), vim.fn.expand('%:e')
end

local function buffer_is_readonly()
  if vim.bo.filetype == 'help' then
    return false
  end
  return vim.bo.readonly
end

local function format_file_size(file)
  local size = vim.fn.getfsize(file)
  if size == 0 or size == -1 or size == -2 then
    return ''
  end
  if size < 1024 then
    size = size .. 'b'
  elseif size < 1024 * 1024 then
    size = string.format('%.1f',size/1024) .. 'k'
  elseif size < 1024 * 1024 * 1024 then
    size = string.format('%.1f',size/1024/1024) .. 'm'
  else
    size = string.format('%.1f',size/1024/1024/1024) .. 'g'
  end
  return size .. ' '
end

local function file_with_icons(file, modified_icon, readonly_icon)
  if vim.fn.empty(file) == 1 then return '' end

  modified_icon = modified_icon or ''
  readonly_icon = readonly_icon or ''

  if buffer_is_readonly() then
    file = readonly_icon .. ' ' .. file
  end

  if vim.bo.modifiable and vim.bo.modified then
    file = file .. ' ' .. modified_icon
  end

  return ' ' .. file .. ' '
end

local function file_icon()
  local icon = nil
  local f_name, f_extension = get_file_info()
  if user_icons[vim.bo.filetype] ~= nil then
    icon = user_icons[vim.bo.filetype][2]
  elseif user_icons[f_extension] ~= nil then
    icon = user_icons[f_extension][2]
  end
  if icon == nil then
    local ok, devicons = pcall(require, 'nvim-web-devicons')
    if ok then
      icon = devicons.get_icon(f_name, f_extension, { default = true })
    elseif vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
      icon = vim.fn.WebDevIconsGetFileTypeSymbol()
    end
  end
  if icon == nil then
    icon = ''
  end
  return icon .. ' '
end

local function file_name(modified_icon, readonly_icon)
  local file = vim.fn.expand('%:t')
  return file_with_icons(file, modified_icon, readonly_icon)
end

local function file_size()
  local file = vim.fn.expand('%:p')
  if string.len(file) == 0 then return '' end
  return format_file_size(file)
end

local function file_format()
  return vim.bo.fileformat:upper()
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
  local current_line = vim.fn.line('.')
  local total_line = vim.fn.line('$')
  if current_line == 1 then
    return ' Top '
  elseif current_line == vim.fn.line('$') then
    return ' Bot '
  end
  local result,_ = math.modf((current_line/total_line)*100)
  return ' '.. result .. '% '
end

local function scrollbar_instance(scroll_bar_chars)
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local default_chars = {'__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██'}
  local chars = scroll_bar_chars or default_chars
  local index = 1

  if  current_line == 1 then
    index = 1
  elseif current_line == total_lines then
    index = #chars
  else
    local line_no_fraction = vim.fn.floor(current_line) / vim.fn.floor(total_lines)
    index = vim.fn.float2nr(line_no_fraction * #chars)
    if index == 0 then
      index = 1
    end
  end
  return chars[index]
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
