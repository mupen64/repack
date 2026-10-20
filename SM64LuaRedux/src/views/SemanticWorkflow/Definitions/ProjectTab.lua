--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

---@class ProjectTab : Tab The project tab.
local cls_project_tab = {}

__impl = cls_project_tab
dofile(views_path .. 'SemanticWorkflow/Implementations/ProjectTab.lua')
__impl = nil

return cls_project_tab
