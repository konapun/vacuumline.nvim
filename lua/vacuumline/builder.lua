local sections = require('vacuumline.section')
local options = require('vacuumline.options')
local M = {}

local function build_side(gl, side, sections, opts)
  -- TODO: filter out sections that aren't enabled
  for _, section_group in ipairs(sections[side]) do
    local group = {section_group}
    if section_group[1] ~= nil then -- group contains multiple sections
      group = section_group
    end

    for index, section in ipairs(group) do
      gl[side][index] = section(opts)
    end
  end
end

-- Attach sections to galaxyline
function M.build(gl, opts)
  local built_opts = options.format(opts, sections)

  build_side(gl, 'left', sections.left, built_opts)
  build_side('right', sections.right, built_opts)
end

return M
