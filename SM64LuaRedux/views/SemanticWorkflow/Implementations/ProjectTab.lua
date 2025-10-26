--
-- Copyright (c) 2025, Mupen64 maintainers.
--
-- SPDX-License-Identifier: GPL-2.0-or-later
--

---@type ProjectTab
---@diagnostic disable-next-line: assign-type-mismatch
local __impl = __impl

__impl.name = 'Project'
__impl.help_key = 'PROJECT_TAB'

---@type Project
local Project = dofile(views_path .. 'SemanticWorkflow/Definitions/Project.lua')

---@type Gui
local Gui = dofile(views_path .. 'SemanticWorkflow/Definitions/Gui.lua')

local UID <const> = dofile(views_path .. 'SemanticWorkflow/UID.lua')[__impl.name]

function __impl.allocate_uids(enum_next)
    return {
        NewProject = enum_next(),
        OpenProject = enum_next(),
        SaveProject = enum_next(),
        PurgeProject = enum_next(),
        DisableProjectSheets = enum_next(),
        ProjectSheetBase = enum_next(1024), -- TODO: allocate an exact amount, assuming a scroll bar for too many sheets in one project
        AddSheet = enum_next(),
        ConfirmationYes = enum_next(),
        ConfirmationNo = enum_next(),
    }
end

local function create_confirm_dialog(prompt, on_confirmed)
    return function()
        local top = 15 - Gui.MEDIUM_CONTROL_HEIGHT

        local theme = Styles.theme()

        BreitbandGraphics.draw_text2({
            rectangle = grid_rect(0, top - 8, 8, 8),
            text = prompt,
            align_x = BreitbandGraphics.alignment.center,
            align_y = BreitbandGraphics.alignment['end'],
            color = theme.button.text[1],
            font_size = theme.font_size * 1.2 * Drawing.scale,
            font_name = theme.font_name,
        })

        if ugui.button({
                uid = UID.ConfirmationYes,
                rectangle = grid_rect(4, top, 2, Gui.MEDIUM_CONTROL_HEIGHT),
                text = Locales.str('YES'),
            }) then
            on_confirmed()
            SemanticWorkflowDialog = nil
        end
        if ugui.button({
                uid = UID.ConfirmationNo,
                rectangle = grid_rect(2, top, 2, Gui.MEDIUM_CONTROL_HEIGHT),
                text = Locales.str('NO'),
            }) then
            SemanticWorkflowDialog = nil
        end
    end
end

local function render_confirm_deletion_prompt(sheet_index)
    return create_confirm_dialog(
        Locales.str('SEMANTIC_WORKFLOW_PROJECT_CONFIRM_SHEET_DELETION_1')
        .. SemanticWorkflowProject.meta.sheets[sheet_index].name
        .. Locales.str('SEMANTIC_WORKFLOW_PROJECT_CONFIRM_SHEET_DELETION_2'),
        function() SemanticWorkflowProject:remove_sheet(sheet_index) end
    )
end

local RenderConfirmPurgeDialog = create_confirm_dialog(
    Locales.str('SEMANTIC_WORKFLOW_PROJECT_CONFIRM_PURGE'),
    function()
        local ignored_files = {}
        local project_folder = SemanticWorkflowProject:project_folder()
        for _, sheet_meta in ipairs(SemanticWorkflowProject.meta.sheets) do
            ignored_files[sheet_meta.name .. '.sws'] = true
            ignored_files[sheet_meta.name .. '.sws.savestate'] = true
        end
        for file in io.popen('dir \"' .. project_folder .. '\" /b'):lines() do
            if ignored_files[file] == nil and (file:match('(.)sws$') ~= nil or file:match('(.)sws(.)savestate$') ~= nil) then
                assert(os.remove(project_folder .. file))
                print('removed ' .. file)
            end
        end
    end
)

function __impl.render(draw)
    local theme = Styles.theme()
    if #SemanticWorkflowProject.meta.sheets == 0 then
        BreitbandGraphics.draw_text2({
            rectangle = grid_rect(0, 0, 8, 16),
            text = Locales.str('SEMANTIC_WORKFLOW_PROJECT_NO_SHEETS_AVAILABLE'),
            align_x = BreitbandGraphics.alignment.center,
            align_y = BreitbandGraphics.alignment.center,
            color = theme.button.text[1],
            font_size = theme.font_size * 1.2 * Drawing.scale,
            font_name = theme.font_name,
        })
    end

    local top = 1
    if SemanticWorkflowProject.project_location ~= nil then
        draw:small_text(
            grid_rect(0, top, 8, Gui.MEDIUM_CONTROL_HEIGHT),
            'start',
            SemanticWorkflowProject.project_location
            .. '\n' .. Locales.str('SEMANTIC_WORKFLOW_PROJECT_FILE_VERSION') .. SemanticWorkflowProject.meta.version
        )
    end
    if ugui.button({
            uid = UID.NewProject,
            rectangle = grid_rect(0, top + 1, 1.5, Gui.MEDIUM_CONTROL_HEIGHT),
            text = Locales.str('SEMANTIC_WORKFLOW_PROJECT_NEW'),
            tooltip = Locales.str('SEMANTIC_WORKFLOW_PROJECT_NEW_TOOL_TIP'),
        }) then
        local path = iohelper.filediag('*.swp', 1)
        if string.len(path) > 0 then
            SemanticWorkflowProject = Project.new()
            SemanticWorkflowProject.project_location = path
            SemanticWorkflowProject:save()
        end
    end
    if ugui.button({
            uid = UID.OpenProject,
            rectangle = grid_rect(1.5, top + 1, 1.5, Gui.MEDIUM_CONTROL_HEIGHT),
            text = Locales.str('SEMANTIC_WORKFLOW_PROJECT_OPEN'),
            tooltip = Locales.str('SEMANTIC_WORKFLOW_PROJECT_OPEN_TOOL_TIP'),
        }) then
        local path = iohelper.filediag('*.swp', 0)
        if string.len(path) > 0 then
            SemanticWorkflowProject = Project.new()
            SemanticWorkflowProject:load(path)
        end
    end
    if ugui.button({
            uid = UID.SaveProject,
            rectangle = grid_rect(3, top + 1, 1.5, Gui.MEDIUM_CONTROL_HEIGHT),
            text = Locales.str('SEMANTIC_WORKFLOW_PROJECT_SAVE'),
            tooltip = Locales.str('SEMANTIC_WORKFLOW_PROJECT_SAVE_TOOL_TIP'),
        }) then
        if SemanticWorkflowProject.project_location == nil then
            local path = iohelper.filediag('*.swp', 0)
            if string.len(path) == 0 then
                goto skipSave
            end
            SemanticWorkflowProject.project_location = path
        end
        SemanticWorkflowProject:save()
    end
    ::skipSave::

    if ugui.button({
            uid = UID.PurgeProject,
            rectangle = grid_rect(4.5, top + 1, 1.5, Gui.MEDIUM_CONTROL_HEIGHT),
            text = Locales.str('SEMANTIC_WORKFLOW_PROJECT_PURGE'),
            tooltip = Locales.str('SEMANTIC_WORKFLOW_PROJECT_PURGE_TOOL_TIP'),
            is_enabled = SemanticWorkflowProject.project_location ~= nil,
        }) then
        SemanticWorkflowDialog = RenderConfirmPurgeDialog
    end

    local available_sheets = {}
    for i = 1, #SemanticWorkflowProject.meta.sheets, 1 do
        available_sheets[i] = SemanticWorkflowProject.meta.sheets[i].name
    end
    available_sheets[#available_sheets + 1] = Locales.str('SEMANTIC_WORKFLOW_PROJECT_ADD_SHEET')

    top = 3

    local uid = UID.ProjectSheetBase
    for i = 1, #available_sheets, 1 do
        local y = top + (i - 1) * Gui.MEDIUM_CONTROL_HEIGHT
        local is_checked = not SemanticWorkflowProject.disabled and i == SemanticWorkflowProject.meta.selection_index
        local tooltip = Locales.str(
            is_checked
            and 'SEMANTIC_WORKFLOW_PROJECT_DISABLE_TOOL_TIP'
            or 'SEMANTIC_WORKFLOW_PROJECT_SELECT_TOOL_TIP'
        )

        if ugui.toggle_button({
                uid = uid,
                rectangle = grid_rect(0, y, 3, Gui.MEDIUM_CONTROL_HEIGHT),
                text = available_sheets[i],
                tooltip = i <= #SemanticWorkflowProject.meta.sheets and tooltip or nil,
                is_checked = is_checked,
            }) then
            if i == #SemanticWorkflowProject.meta.sheets + 1 then -- add new sheet
                SemanticWorkflowProject:add_sheet()
                SemanticWorkflowProject:select(#SemanticWorkflowProject.meta.sheets)
            elseif SemanticWorkflowProject.disabled or i ~= SemanticWorkflowProject.meta.selection_index then -- select sheet
                SemanticWorkflowProject:select(i)
            end
        elseif is_checked then
            SemanticWorkflowProject.disabled = true
        end
        uid = uid + 1

        -- prevent rendering options for the "add..." button
        if i > #SemanticWorkflowProject.meta.sheets then break end

        local x = 3
        local function draw_utility_button(text, tooltip, enabled, width)
            width = width or 0.5
            local result = ugui.button({
                uid = uid,
                rectangle = grid_rect(x, y, width, Gui.MEDIUM_CONTROL_HEIGHT),
                text = text,
                tooltip = tooltip,
                is_enabled = enabled,
            })
            uid = uid + 1
            x = x + width
            return result
        end

        if (draw_utility_button('^', Locales.str('SEMANTIC_WORKFLOW_PROJECT_MOVE_SHEET_UP_TOOL_TIP'), i > 1)) then
            SemanticWorkflowProject:move_sheet(i, -1)
        end

        if (draw_utility_button('v', Locales.str('SEMANTIC_WORKFLOW_PROJECT_MOVE_SHEET_DOWN_TOOL_TIP'), i < #SemanticWorkflowProject.meta.sheets)) then
            SemanticWorkflowProject:move_sheet(i, 1)
        end

        if (draw_utility_button('-', Locales.str('SEMANTIC_WORKFLOW_PROJECT_DELETE_SHEET_TOOL_TIP'))) then
            SemanticWorkflowDialog = render_confirm_deletion_prompt(i)
        end

        if (draw_utility_button('.st', Locales.str('SEMANTIC_WORKFLOW_PROJECT_REBASE_SHEET_TOOL_TIP'), true, 0.75)) then
            SemanticWorkflowProject:rebase(i)
        end

        if (draw_utility_button('.sws', Locales.str('SEMANTIC_WORKFLOW_PROJECT_REPLACE_INPUTS_TOOL_TIP'), true, 0.75)) then
            local path = iohelper.filediag('*.sws', 0)
            if string.len(path) > 0 then
                SemanticWorkflowProject.all[SemanticWorkflowProject.meta.sheets[i].name]:load(path, false)
            end
        end

        if (draw_utility_button('>', Locales.str('SEMANTIC_WORKFLOW_PROJECT_PLAY_WITHOUT_ST_TOOL_TIP'))) then
            SemanticWorkflowProject:select(i, false)
        end
        ::continue::
    end
end
