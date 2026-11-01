--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

MiniVisualizer = {}

MiniVisualizer.draw = function()
    if not Settings.mini_visualizer then
        return
    end

    local size = emu.main_window():size()
    local scale = math.max(0.01, MoreMaths.round(size.y / 600, 2))
    local current_painter = painter.current()
    local previous_painter = ugui.internal.painter
    ugui.internal.painter = current_painter
    current_painter:save()
    current_painter:translate(0, -24)
    current_painter:scale(scale, scale)

    local function rectangle(x, y, width, height)
        local cell = Settings.grid_size
        local gap = Settings.grid_gap
        return {
            x = x * cell + gap,
            y = y * cell + gap,
            width = width * cell - gap * 2,
            height = height * cell - gap * 2,
        }
    end

    local styler = ugui.standard_styler
    local normal = ugui.visual_states.normal
    local theme = Styles.theme()
    local foreground_color = styler.params.button.text[normal]
    local function label(rect, text, font_size, font_name, color)
        styler.draw_rich_text({
            rectangle = rect,
            text = text,
            color = color or foreground_color,
            font_size = font_size,
            font_name = font_name,
            align_x = ugui.alignment.center,
            align_y = ugui.alignment.center,
            plaintext = true,
        })
    end

    styler.draw_raised_frame({ _render_rect = rectangle(3, 14, 5, 2) }, normal)
    local joystick = {
        _render_rect = rectangle(0, 14, 3, 3),
        position = { x = Joypad.input.X, y = -Joypad.input.Y },
        mag = 0,
    }
    styler.draw_raised_frame(joystick, normal)
    styler.draw_joystick(joystick, normal)

    local buttons = {
        { text = 'A', checked = Joypad.input.A },
        { text = 'B', checked = Joypad.input.B },
        { text = 'Z', checked = Joypad.input.Z },
        { text = 'S', checked = Joypad.input.start },
        { text = 'R', checked = Joypad.input.R },
    }
    for i, button in ipairs(buttons) do
        local rect = rectangle(i + 2, 16, 1, 1)
        local state = button.checked and ugui.visual_states.active or normal
        styler.draw_raised_frame({ _render_rect = rect }, state)
        label(rect, button.text, nil, nil, styler.params.button.text[state])
    end

    label(rectangle(3, 15, 5, 1), VarWatch_compute_value('action').value, theme.font_size, 'Consolas')
    label(rectangle(3, 14, 2.5, 1), 'X: ' .. Joypad.input.X, theme.font_size * 1.25, 'Consolas')
    label(rectangle(5.5, 14, 2.5, 1), 'Y: ' .. Joypad.input.Y, theme.font_size * 1.25, 'Consolas')

    current_painter:restore()
    ugui.internal.painter = previous_painter
end
