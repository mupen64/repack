--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

MiniVisualizer = {}

local ugui = MainUgui

local UID = UIDProvider.allocate_once('MiniVisualizer', function(enum_next)
    return {
        Background = enum_next(),
        Joystick = enum_next(),
        A = enum_next(),
        B = enum_next(),
        Z = enum_next(),
        S = enum_next(),
        R = enum_next(),
        Action = enum_next(),
        JoystickX = enum_next(),
        JoystickY = enum_next(),
    }
end)

MiniVisualizer.draw = function()
    if not Settings.mini_visualizer then
        return
    end
    local function rectangle(x, y, width, height)
        local cell = Settings.grid_size
        local gap = Settings.grid_gap
        return {
            x = x * cell + gap,
            y = y * cell + gap - 24 / ugui.internal.scale,
            width = width * cell - gap * 2,
            height = height * cell - gap * 2,
        }
    end

    ugui.panel({
        uid = UID.Background,
        rectangle = rectangle(3, 14, 5, 2),
        draw = function(control)
            ugui.standard_styler.draw_raised_frame(control, ugui.visual_states.normal)
        end,
    })

    ugui.joystick({
        uid = UID.Joystick,
        rectangle = rectangle(0, 14, 3, 3),
        position = {
            x = Joypad.input.X,
            y = -Joypad.input.Y,
        },
        mag = 0,
    })
    ugui.toggle_button({
        uid = UID.A,
        rectangle = rectangle(3, 16, 1, 1),
        text = 'A',
        is_checked = Joypad.input.A,
    })
    ugui.toggle_button({
        uid = UID.B,
        rectangle = rectangle(4, 16, 1, 1),
        text = 'B',
        is_checked = Joypad.input.B,
    })
    ugui.toggle_button({
        uid = UID.Z,
        rectangle = rectangle(5, 16, 1, 1),
        text = 'Z',
        is_checked = Joypad.input.Z,
    })
    ugui.toggle_button({
        uid = UID.S,
        rectangle = rectangle(6, 16, 1, 1),
        text = 'S',
        is_checked = Joypad.input.start,
    })
    ugui.toggle_button({
        uid = UID.R,
        rectangle = rectangle(7, 16, 1, 1),
        text = 'R',
        is_checked = Joypad.input.R,
    })
    local foreground_color = ugui.standard_styler.params.button.text[ugui.visual_states.normal]
    local theme = Styles.theme()
    ugui.label({
        uid = UID.Action,
        rectangle = rectangle(3, 15, 5, 1),
        text = VarWatch_compute_value('action').value,
        color = foreground_color,
        font_size = theme.font_size,
        font_name = 'Consolas',
        align_x = ugui.alignment.center,
        align_y = ugui.alignment.center,
    })
    ugui.label({
        uid = UID.JoystickX,
        rectangle = rectangle(3, 14, 2.5, 1),
        text = 'X: ' .. Joypad.input.X,
        color = foreground_color,
        font_size = theme.font_size * 1.25,
        font_name = 'Consolas',
        align_x = ugui.alignment.center,
        align_y = ugui.alignment.center,
    })
    ugui.label({
        uid = UID.JoystickY,
        rectangle = rectangle(5.5, 14, 2.5, 1),
        text = 'Y: ' .. Joypad.input.Y,
        color = foreground_color,
        font_size = theme.font_size * 1.25,
        font_name = 'Consolas',
        align_x = ugui.alignment.center,
        align_y = ugui.alignment.center,
    })
end
