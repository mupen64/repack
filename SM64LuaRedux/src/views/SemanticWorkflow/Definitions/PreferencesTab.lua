--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

---@class PreferencesTab : Tab The preferences tab. May be removed in the future.
local cls_preferences_tab = {}

__impl = cls_preferences_tab
dofile(views_path .. 'SemanticWorkflow/Implementations/PreferencesTab.lua')
__impl = nil

return cls_preferences_tab
