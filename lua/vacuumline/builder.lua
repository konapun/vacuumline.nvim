local sections = require('vacuumline.section')
local options = require('vacuumline.options')
local M = {}


local function build_side(gls, side, sections, opts)
  -- TODO: filter out sections that aren't enabled
  local index = 1
  for _, section_group in ipairs(sections) do
    local group = {section_group}
    if type(section_group) == 'table' then -- group contains multiple sections
      group = section_group
    end

    for _, section in ipairs(group) do
      gls[side][index] = section(opts)
    end
  end
end

-- Attach sections to galaxyline
function M.build(gl, opts)
  local built_opts = options.format(opts, sections)
  local gls = gl.section

  build_side(gls, 'left', sections.left, built_opts)
  build_side(gls, 'right', sections.right, built_opts)
end

return M
