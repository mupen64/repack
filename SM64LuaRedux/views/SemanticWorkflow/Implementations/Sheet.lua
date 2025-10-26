--
-- Copyright (c) 2025, Mupen64 maintainers.
--
-- SPDX-License-Identifier: GPL-2.0-or-later
--

---@diagnostic disable:invisible

---@type Sheet
---@diagnostic disable-next-line:assign-type-mismatch
local __impl = __impl

---@type Section
local Section = dofile(views_path .. 'SemanticWorkflow/Definitions/Section.lua')

function __impl.new(name, create_savestate)
    local global_timer = Memory.current.mario_global_timer

    local new_instance = {
        version = SEMANTIC_WORKFLOW_FILE_VERSION,
        preview_frame = { section_index = 1, frame_index = 1 },
        active_frame = { section_index = 1, frame_index = 1 },
        sections = { Section.new(0x0C400201, Settings.semantic_workflow.default_section_timeout) }, -- end action is "idle"
        name = name,
        _savestate = nil,
        busy = false,
        _update_pending = false,
        _rebasing = false,
        _section_index = 1,
        _frame_counter = 1,
        evaluate_frame = __impl.evaluate_frame,
        run_to_preview = __impl.run_to_preview,
        rebase = __impl.rebase,
        save = __impl.save,
        load = __impl.load,
    }
    if create_savestate then
        savestate.do_memory('', 'save', function(result, data) new_instance._savestate = data end)
    end

    return new_instance
end

function __impl:evaluate_frame()
    local section = self.sections[self._section_index]
    if section == nil then return nil end

    local current_action = Memory.current.mario_action
    if self._frame_counter >= section.timeout or current_action == section.end_action then
        self._section_index = self._section_index + 1
        self._frame_counter = 0
    end
    if self._section_index > self.preview_frame.section_index
        or (self._section_index == self.preview_frame.section_index
            and self.preview_frame.frame_index
            and self._frame_counter >= self.preview_frame.frame_index - 1
        ) then
        emu.pause(false)
        emu.set_ff(false)
        self.busy = false
    end

    self._frame_counter = self._frame_counter + 1
    section = self.sections[self._section_index]
    return section and section.inputs[math.min(self._frame_counter, #section.inputs)] or nil
end

function __impl:run_to_preview(load_state)
    if self.busy then
        self._update_pending = true
        return
    end
    if #self.sections == 0 then return end
    self.busy = true
    self._update_pending = false

    if load_state == nil and true or load_state then
        savestate.do_memory(self._savestate, 'load', function()
            emu.pause(true)
            emu.set_ff(Settings.semantic_workflow.fast_foward)
        end)
    else
        emu.pause(true)
        emu.set_ff(Settings.semantic_workflow.fast_foward)
    end

    self._section_index = 1
    self._frame_counter = 1
end

function __impl:save(file)
    self.version = SEMANTIC_WORKFLOW_FILE_VERSION
    WriteAll(file .. '.savestate', self._savestate)
    WriteAll(
        file,
        json.encode({
            version = self.version,
            sections = self.sections,
            name = self.name,
            active_frame = self.active_frame,
            preview_frame = self.preview_frame,
        })
    )
end

function __impl:load(file)
    local contents = json.decode(ReadAll(file));
    if contents ~= nil then
        self._savestate = ReadAll(file .. '.savestate')
        CloneInto(self, contents)
    end
end

function __impl:rebase()
    savestate.do_memory('', 'save', function(result, data)
        self._savestate = data
        self:run_to_preview()
    end)
end
