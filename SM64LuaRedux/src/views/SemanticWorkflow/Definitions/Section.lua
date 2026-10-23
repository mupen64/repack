--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

---@class Section Describes a single section of a sheet.
---@field inputs SectionInputs[] The sequence of SectionInputs that make up this section.
---@field collapsed boolean Whether the inputs list should be hidden in the InputListGui.
---@field name string The display name of the section.
local cls_section = {}

---Constructs a new section with a single initial input.
---@param name string The display name for the section.
function cls_section.new(name) end

__impl = cls_section
dofile(Redux.VIEWS_PATH .. 'SemanticWorkflow/Implementations/Section.lua')
__impl = nil

return cls_section
