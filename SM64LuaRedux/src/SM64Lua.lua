--
-- Copyright (c) 2026, Mupen64 Organization (https://github.com/mupen64)
--
-- SPDX-License-Identifier: GPL-3.0-or-later
--

Redux = {
    _VERSION = 'next',
    _URL = 'https://codeberg.org/mupen64/SM64LuaRedux',
    _DESCRIPTION = 'Powerful SM64 TASing utility',
    _LICENSE = 'GPL-3',
}

Redux.FOLDER = debug.getinfo(1).source:sub(2):match('(.*\\)')
Redux.STYLES_PATH = Redux.FOLDER .. 'res\\styles\\'
Redux.LOCALES_PATH = Redux.FOLDER .. 'res\\lang\\'
Redux.VIEWS_PATH = Redux.FOLDER .. 'views\\'
Redux.CORE_PATH = Redux.FOLDER .. 'core\\'
Redux.VENDOR_PATH = Redux.FOLDER .. '..\\vendor\\'
Redux.PROCESSORS_PATH = Redux.FOLDER .. 'processors\\'

---@module 'breitbandgraphics-amalgamated'
BreitbandGraphics = dofile(Redux.VENDOR_PATH .. 'breitbandgraphics-amalgamated.lua')

---@module 'ugui-amalgamated'
ugui = dofile(Redux.VENDOR_PATH .. 'ugui-amalgamated.lua')

---@module 'linq'
lualinq = dofile(Redux.VENDOR_PATH .. 'linq.lua')

json = dofile(Redux.VENDOR_PATH .. 'json.lua')

dofile(Redux.STYLES_PATH .. 'base_style.lua')
dofile(Redux.CORE_PATH .. 'UIDProvider.lua')
dofile(Redux.CORE_PATH .. 'Helpers.lua')
dofile(Redux.CORE_PATH .. 'Settings.lua')
dofile(Redux.CORE_PATH .. 'Formatter.lua')
dofile(Redux.CORE_PATH .. 'Drawing.lua')
dofile(Redux.CORE_PATH .. 'Memory.lua')
dofile(Redux.CORE_PATH .. 'RNG.lua')
dofile(Redux.CORE_PATH .. 'Joypad.lua')
dofile(Redux.CORE_PATH .. 'Angles.lua')
dofile(Redux.CORE_PATH .. 'Engine.lua')
dofile(Redux.CORE_PATH .. 'MoreMaths.lua')
dofile(Redux.CORE_PATH .. 'WorldVisualizer.lua')
dofile(Redux.CORE_PATH .. 'MiniVisualizer.lua')
dofile(Redux.CORE_PATH .. 'Timer.lua')
dofile(Redux.CORE_PATH .. 'Ghosts.lua')
dofile(Redux.CORE_PATH .. 'VarWatch.lua')
dofile(Redux.CORE_PATH .. 'Styles.lua')
dofile(Redux.CORE_PATH .. 'Locales.lua')
dofile(Redux.CORE_PATH .. 'Presets.lua')
dofile(Redux.CORE_PATH .. 'Dumping.lua')
Validators = dofile(Redux.CORE_PATH .. 'Validators.lua')
dofile(Redux.CORE_PATH .. 'Actions.lua')
Addresses = dofile(Redux.CORE_PATH .. 'Addresses.lua')
Mapping = dofile(Redux.CORE_PATH .. 'Mapping.lua')

apply_math_shim()

Memory.initialize()
Joypad.update()
Drawing.size_up()
Presets.load()
Presets.apply(Presets.persistent.current_index)
Actions.register_all()

local views = {
    dofile(Redux.VIEWS_PATH .. 'TAS.lua'),
    dofile(Redux.VIEWS_PATH .. 'SemanticWorkflow/Main.lua'),
    dofile(Redux.VIEWS_PATH .. 'Settings.lua'),
    dofile(Redux.VIEWS_PATH .. 'Tools.lua'),
    dofile(Redux.VIEWS_PATH .. 'Timer.lua'),
    dofile(Redux.VIEWS_PATH .. 'Visualizer.lua'),
    dofile(Redux.VIEWS_PATH .. 'GhostTab/Main.lua'),
}

local semantic_workflow = dofile(Redux.PROCESSORS_PATH .. 'SemanticWorkflow.lua')
local processors = {
    semantic_workflow.transform,
    dofile(Redux.PROCESSORS_PATH .. 'Walk.lua'),
    dofile(Redux.PROCESSORS_PATH .. 'Swimming.lua'),
    dofile(Redux.PROCESSORS_PATH .. 'Wallkicker.lua'),
    dofile(Redux.PROCESSORS_PATH .. 'Framewalk.lua'),
    semantic_workflow.readback,
}


---@type UguiEnvironment
ugui_environment = {
    mouse_position = { x = 0, y = 0 },
    key_events = {},
    mouse_events = {},
}
---@type MouseEventArgs[]
local stored_mouse_events = {}

-- Flag keeping track of whether atinput has fired for one time
local first_input = true

local keys = input.get()
local defer_draw_queue = {}
local defer_before_navbar_queue = {}
local key_events = {}
local next_vi_signal = false
G_KEYS = {}

local UID = UIDProvider.allocate_once('SM64Lua', function(enum_next)
    return {
        TabIndex = enum_next(),
        PresetIndex = enum_next(),
        ViewPanels = enum_next(#views),
    }
end)

function defer_draw(fn)
    defer_draw_queue[#defer_draw_queue + 1] = fn
end

function defer_before_navbar(fn)
    defer_before_navbar_queue[#defer_before_navbar_queue + 1] = fn
end

local function execute_defer_draw_queue()
    for i = 1, #defer_draw_queue, 1 do
        defer_draw_queue[i]()
    end
    defer_draw_queue = {}
end

local function execute_defer_before_navbar_queue()
    for i = 1, #defer_before_navbar_queue, 1 do
        defer_before_navbar_queue[i]()
    end
    defer_before_navbar_queue = {}
end

is_keyboard_captured = false

-- HACK: Do not consume wheel input while a control owns the mouse or a numberbox owns the keyboard.
function can_scroll()
    if ugui.internal.mouse_captured_control ~= nil then
        return false
    end

    local keyboard_captured_control = ugui.internal.keyboard_captured_control
    return keyboard_captured_control == nil or
        ugui.internal.control_types[keyboard_captured_control] ~= 'numberbox'
end

-- HACK: We want to know if ugui is capturing keyboard input on a control that cares about inputs.
function get_is_keyboard_captured()
    if ugui.internal.keyboard_captured_control == nil then
        return false
    end

    local keyboard_captured_control = ugui.internal.find_node(ugui.internal.keyboard_captured_control)
    if not keyboard_captured_control then
        return false
    end

    if keyboard_captured_control.type == "textbox" or keyboard_captured_control.type == "numberbox" then
        return true
    end

    return false
end

local function at_input()
    -- TODO: Move this to Memory.lua
    if first_input then
        if Settings.autodetect_address then
            Settings.address_source_index = Memory.find_matching_address_source_index()
        end
        first_input = false
    end

    if Settings.override_rng then
        local address_source = Addresses[Settings.address_source_index]

        if Settings.override_rng_use_index then
            memory.writeword(address_source.rng_value, RNG.get_value(Settings.override_rng_value))
        else
            memory.writeword(address_source.rng_value, Settings.override_rng_value)
        end
    end

    Joypad.update()

    -- frame stage 2: let domain code loose on everything, then perform transformations or inspections (e.g.: swimming, rng override, ghost)
    -- TODO: make this into a priority callback system?
    Timer.update()

    for i = 1, #processors, 1 do
        Joypad.input = processors[i].process(Joypad.input)
    end

    Joypad.send()
    Ghosts.update()
    Dumping.update()
end

local function at_vi()
    local address_source = Addresses[Settings.address_source_index]
    local valid_count = memory.readdword(address_source.game_vblank_queue + 4 * 2)
    local first = memory.readdword(address_source.game_vblank_queue + 4 * 3)
    local msg_count = memory.readdword(address_source.game_vblank_queue + 4 * 4)
    if valid_count == 0 and first == 0 and msg_count == 1 then
        if next_vi_signal then
            Memory.update_previous()
            Memory.update()
            next_vi_signal = false
            return
        end
        next_vi_signal = true
    end
end

local function draw_navbar()
    if not Settings.navbar_visible then
        return
    end
    Settings.tab_index = ugui.carrousel_button({
        uid = UID.TabIndex,
        rectangle = grid_rect(0, 16, 5.5, 1),
        is_enabled = not Settings.hotkeys_assigning,
        items = lualinq.select(views, function(v) return v.name() end),
        selected_index = Settings.tab_index,
    })

    local preset_picker_rect = grid_rect(5.5, 16, 2.5, 1)

    local preset_items = lualinq.select(Presets.persistent.presets, function(_, i)
        return Locales.msg.PRESET .. i
    end)
    preset_items[#preset_items + 1] = Locales.msg.PRESET .. (#Presets.persistent.presets + 1)

    local preset_context_menu = {
        { text = Locales.msg.GENERIC_RESET },
        { text = Locales.msg.PRESET_CONTEXT_MENU_DELETE_ALL },
    }
    local preset_index, preset_meta = ugui.carrousel_button({
        uid = UID.PresetIndex,
        rectangle = preset_picker_rect,
        is_enabled = not Settings.hotkeys_assigning,
        items = preset_items,
        selected_index = Presets.persistent.current_index,
        context_menu = preset_context_menu,
    })

    local context_menu_result = preset_meta.context_menu_result
    if context_menu_result and context_menu_result.item == preset_context_menu[1] then
        action.invoke(ACTION_RESET_PRESET)
    elseif context_menu_result and context_menu_result.item == preset_context_menu[2] then
        action.invoke(ACTION_DELETE_ALL_PRESETS)
    end

    if preset_index ~= Presets.persistent.current_index then
        Presets.change_index(preset_index)
        Actions.notify_all_changed()
    end
end

local previous_tab_index = Settings.tab_index
local view_transition_x = -5
local view_out_transition = ugui.transition.fly({ x = 5, y = 0, duration = Settings.animations == 'fast' and 0.1 or nil })

local function atdrawd2d()
    ugui.PREFERS_REDUCED_MOTION = Settings.animations == 'disabled'
    view_out_transition.duration = Settings.animations == 'fast' and 0.1 or 0.25
    Styles.refresh_system_style()
    d2d.set_target_fps(emu.get_ff() and Settings.ff_fps or nil)

    if d2d and d2d.clear then
        d2d.clear(0, 0, 0, 0)
    end

    keys = input.get()
    G_KEYS = ugui.internal.deep_clone(keys)

    -- HACK: We turn off hotkeys while a control is capturing inputs
    action.lock_hotkeys(Settings.lock_hotkeys_when_control_active and is_keyboard_captured or false)

    VarWatch_update()

    ugui_environment = {
        mouse_position = {
            x = keys.xmouse,
            y = keys.ymouse,
        },
        mouse_events = stored_mouse_events,
        key_events = key_events,
        shift = keys.shift,
        window_size = {
            x = Drawing.size.width,
            y = Drawing.size.height - 23,
        },
        scale = Drawing.scale,
    }
    ugui.begin_frame(ugui_environment)

    WorldVisualizer.draw()
    MiniVisualizer.draw()
    GhostTab_draw_ghost_overlay(
        views[Settings.tab_index].name() == Locales.msg.SEMANTIC_WORKFLOW_TAB_NAME and 6 or 0
    )

    BreitbandGraphics.fill_rectangle({
        x = Drawing.initial_size.width,
        y = 0,
        width = Drawing.size.width - Drawing.initial_size.width,
        height = Drawing.size.height,
    }, Styles.theme().background_color)

    if not Settings.navbar_visible then
        local one_cell_height = grid_rect(0, 0, 0, 1.25).height
        Drawing.push_offset(0, one_cell_height / 2)
    end
    if Settings.tab_index ~= previous_tab_index then
        local forward_distance = (Settings.tab_index - previous_tab_index) % #views
        view_transition_x = forward_distance <= #views / 2 and 10 or -10
        view_out_transition.tick = ugui.transition.fly({ x = -view_transition_x, y = 0, duration = Settings.animations == 'fast' and 0.1 or nil }).tick
        previous_tab_index = Settings.tab_index
    end

    ugui.panel({
        uid = UID.ViewPanels + Settings.tab_index - 1,
        rectangle = { x = 0, y = 0, width = Drawing.size.width, height = Drawing.size.height },
        in_transition = ugui.transition.fly({ x = view_transition_x, y = 0, duration = Settings.animations == 'fast' and 0.1 or nil }),
        out_transition = view_out_transition,
    }, function()
        views[Settings.tab_index].draw()
        Drawing.pop_offset()
    end)

    execute_defer_before_navbar_queue()
    draw_navbar()

    is_keyboard_captured = get_is_keyboard_captured()
    ugui.end_frame()
    stored_mouse_events = {}
    key_events = {}

    execute_defer_draw_queue()
end

local function at_loadstate()
    -- Previous state is now messed up, since it's not the actual previous frame but some other game state
    -- What do we do at this point, leave it like this and let the engine calculate wrong diffs, or copy current state to previous one?
    Memory.update()
    Memory.update_previous()
end

emu.atloadstate(at_loadstate)
emu.atinput(at_input)
emu.atvi(at_vi)
emu.atdrawd2d(atdrawd2d)
emu.atstop(function()
    Presets.save()
    Drawing.size_down()
    BreitbandGraphics.free()
    ugui.free()
end)

emu.atmouse(function(args)
    stored_mouse_events[#stored_mouse_events + 1] = args
end)

emu.atkey(function(args)
    key_events[#key_events + 1] = args
end)
