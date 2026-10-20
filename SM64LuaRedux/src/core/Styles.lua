--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

Styles = {}

local style_dir_names = {
    'windows-11',
    'windows-11-dark',
    'windows-10',
    'windows-10-dark',
    'windows-3-pink',
    'windows-7',
    'windows-xp',
    'input-direction',
    'crackhex',
    'neptune',
    'fl-studio',
    'steam',
}

---@type string[]
local style_names = {}

---@type unknown TODO: Type!
local current_style = {}
local current_style_index
local cached_system_theme

local standard_styler_params_clone = ugui.internal.deep_clone(ugui.standard_styler.params)

---Gets the definition and image paths for the style with the specified name.
---@param name string
---@return { def_path: string, img_path: string }
local function get_style_paths(name)
    return {
        def_path = styles_path .. name .. '\\' .. 'style.lua',
        img_path = styles_path .. name .. '\\' .. 'style.png',
    }
end

for i = 1, #style_dir_names, 1 do
    local paths = get_style_paths(style_dir_names[i])

    local style = dofile(paths.def_path)
    style_names[i] = style.name
end

local function resolved_style_index()
    if Settings.active_style_index == 0 then
        return cached_system_theme == 'dark' and Settings.dark_style_index or Settings.light_style_index
    end
    return Settings.active_style_index
end

Styles.update_style = function()
    local index = resolved_style_index()
    local paths = get_style_paths(style_dir_names[index])

    local style = dofile(paths.def_path)
    style.theme.path = paths.img_path
    style.theme = deep_merge(ugui.internal.deep_clone(standard_styler_params_clone), style.theme)

    current_style = style
    current_style_index = index

    local theme = style.theme

    local mod_theme = ugui.internal.deep_clone(theme)


    ugui.standard_styler.params = mod_theme
    ugui.standard_styler.params.tabcontrol.rail_size = grid_rect(0, 0, 0, 1).height
    ugui.standard_styler.params.tabcontrol.draw_frame = false
    ugui.standard_styler.params.tabcontrol.gap_x = Settings.grid_gap
    ugui.standard_styler.params.tabcontrol.gap_y = Settings.grid_gap

    local prev_draw_icon = ugui.standard_styler.draw_icon
    ugui.apply_nineslice(mod_theme)
    ugui.standard_styler.draw_icon = prev_draw_icon
end

Styles.refresh_system_style = function()
    local system_theme = emu.get_pref('theme')
    if system_theme == cached_system_theme then
        return
    end
    cached_system_theme = system_theme

    if Settings.active_style_index == 0 and resolved_style_index() ~= current_style_index then
        Styles.update_style()
    end
end

Styles.theme = function()
    return current_style.theme
end

Styles.theme_names = function()
    return style_names
end

Styles.style_options = function()
    local options = { 'System' }
    for i = 1, #style_names do
        options[#options + 1] = style_names[i]
    end
    return options
end
