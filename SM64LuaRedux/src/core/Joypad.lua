--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

Joypad = {
	---@type JoypadInputs
	input = {},
}

---Updates the Joypad input state.
function Joypad.update()
	Joypad.input = joypad.get(Settings.controller_index)
end

---Sends the current Joypad input state to the emulator.
function Joypad.send()
	joypad.set(Settings.controller_index, Joypad.input)
end
