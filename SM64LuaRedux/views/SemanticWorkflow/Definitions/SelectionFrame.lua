--
-- Copyright (c) 2025, Mupen64 maintainers.
--
-- SPDX-License-Identifier: GPL-2.0-or-later
--

---@class SelectionFrame Describes a single selected frame in a single selected section in a sheet.
---@field public section_index integer The 1-based section index in the respective sheet.
---@field public frame_index integer The 1-based frame index in this seletion's section.
local cls_selection_frame = {}
