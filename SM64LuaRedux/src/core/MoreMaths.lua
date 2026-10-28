--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

MoreMaths = {}


---Rounds the given number to the specified number of decimal places.
---@param val number # The number to round.
---@param places integer # The number of decimal places to round to.
---@return number # The rounded number.
---@nodiscard
function MoreMaths.round(val, places)
    if val == math.floor(val) or places == 0 then
        return math.floor(val)
    end
    local mult = 10 ^ (places or 0)
    return math.floor(val * mult + 0.5) / mult
end
