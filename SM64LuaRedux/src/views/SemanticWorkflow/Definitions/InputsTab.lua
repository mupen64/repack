--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

---@class InputsTab : Tab The inputs tab.
local cls_inputs_tab = {}

__impl = cls_inputs_tab
dofile(Redux.VIEWS_PATH .. 'SemanticWorkflow/Implementations/InputsTab.lua')
__impl = nil

return cls_inputs_tab
