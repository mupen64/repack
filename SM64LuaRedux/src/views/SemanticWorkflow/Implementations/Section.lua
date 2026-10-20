--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

---@type Section
---@diagnostic disable-next-line:assign-type-mismatch
local __impl = __impl

---@type SectionInputs
local SectionInputs = dofile(views_path .. 'SemanticWorkflow/Definitions/SectionInputs.lua')

function __impl.new(name)
    local tmp = {}
    CloneInto(tmp, Joypad.input)
    return {
        inputs = { SectionInputs.new() },
        collapsed = false,
        name = name
    }
end
