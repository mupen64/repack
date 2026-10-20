--
-- Copyright (c) 2026, Mupen64 maintainers.
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

local UID = UIDProvider.allocate_once('GhostTab', function(enum_next)
    return {
        TabControl = enum_next(UIDProvider.unknown),
        Overlay = enum_next(),
        OverlayColor = enum_next(),
        TabPanels = enum_next(3),
    }
end)

GhostVarWatch = dofile(views_path .. 'GhostTab/GhostVarWatch.lua')

local playback_tab = dofile(views_path .. 'GhostTab/Playback.lua')
local tabs = {
    dofile(views_path .. 'GhostTab/Recording.lua'),
    playback_tab,
    dofile(views_path .. 'GhostTab/Settings.lua'),
}

local previous_tab_index = Settings.ghost_tab_index or 1
local tab_transition_x = 10
local tab_out_transition = ugui.transition.fly({ x = -10, y = 0, duration = Settings.animations == 'fast' and 0.1 or nil })

---Draws the selected playback ghost's data over the game.
---Called every frame from SM64Lua.lua so it stays up outside the Ghost tab.
---@param left_shift number # the amount to shift the overlay by (used so it doesn't overlap the semantic workflow)
function GhostTab_draw_ghost_overlay(left_shift)
    if not Settings.ghost_overlay_data then
        return
    end
    if not left_shift then
        left_shift = 0
    end
    local item_height = ugui.standard_styler.params.listbox_item.height
    local name, color = playback_tab.selected_name_and_color()

    -- the name is the list's first row so it shares the list's frame and opacity; when there's a
    -- hat color, spaces leave room for a swatch drawn over the start of that row
    local swatch_size = item_height - 4
    if color then
        name = '     ' .. name
    end
    local items = playback_tab.varwatch_items()
    table.insert(items, 1, name)

    -- sized to fit the items (+1px border each side), keeping the bottom where the semantic workflow's ends
    local rectangle = grid_rect(-6 - left_shift, 9, 6, 7)
    local height = #items * item_height + 2
    rectangle.y = rectangle.y + rectangle.height - height
    rectangle.height = height
    ugui.listbox({
        uid = UID.Overlay,
        rectangle = rectangle,
        selected_index = nil,
        items = items,
        styler_mixin = {
            color_filter = { r = 255, g = 255, b = 255, a = 110 },
        },
    })

    -- hat color swatch (Mario ghosts only), vertically centred in the first row where the row's text starts
    if color then
        ugui.panel({
            uid = UID.OverlayColor,
            rectangle = { x = rectangle.x + 3, y = rectangle.y + 0.5 + (item_height - swatch_size) / 2, width = swatch_size, height = swatch_size },
            fill = color,
        })
    end
end

return {
    name = function() return Locales.msg.GHOST_TAB_NAME end,
    draw = function()
        local data = ugui.tabcontrol({
            uid = UID.TabControl,
            rectangle = grid_rect(0, 0, 8, 15),
            items = lualinq.select(tabs, function(v) return v.name() end),
            selected_index = Settings.ghost_tab_index or 1,
        })
        Settings.ghost_tab_index = data.selected_index
        if Settings.ghost_tab_index ~= previous_tab_index then
            tab_transition_x = Settings.ghost_tab_index > previous_tab_index and 10 or -10
            tab_out_transition.tick = ugui.transition.fly({ x = -tab_transition_x, y = 0, duration = Settings.animations == 'fast' and 0.1 or nil }).tick
            previous_tab_index = Settings.ghost_tab_index
        end
        tab_out_transition.duration = Settings.animations == 'fast' and 0.1 or 0.25

        ugui.panel({
            uid = UID.TabPanels + Settings.ghost_tab_index - 1,
            rectangle = { x = 0, y = 0, width = Drawing.size.width, height = Drawing.size.height },
            in_transition = ugui.transition.fly({ x = tab_transition_x, y = 0, duration = Settings.animations == 'fast' and 0.1 or nil }),
            out_transition = tab_out_transition,
        }, function()
            tabs[Settings.ghost_tab_index].draw()
        end)
    end,
}
