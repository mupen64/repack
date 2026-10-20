--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

local AIR_HIT_WALL = 0x000008A7
return {
    process = function(input)
        if not Settings.auto_firsties then
            return input
        end

        if Memory.current.mario_action == AIR_HIT_WALL then
            input['A'] = true
        end
        return input
    end,
}
