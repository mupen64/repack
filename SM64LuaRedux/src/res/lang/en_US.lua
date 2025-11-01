--
-- Copyright (c) 2025, Mupen64 maintainers.
--
-- SPDX-License-Identifier: GPL-2.0-or-later
--

---@type Locale
return {
    name = 'English (US)',
    -- General
    GENERIC_ON = 'On',
    GENERIC_OFF = 'Off',
    GENERIC_START = 'Start',
    GENERIC_STOP = 'Stop',
    GENERIC_RESET = 'Reset',
    GENERIC_NIL = 'nil',
    -- Tab names
    TAS_TAB_NAME = 'TAS',
    SEMANTIC_WORKFLOW_TAB_NAME = 'Semantic Workflow',
    SETTINGS_TAB_NAME = 'Settings',
    TOOLS_TAB_NAME = 'Tools',
    TIMER_TAB_NAME = 'Timer',
    PRESET = 'Preset ',
    -- Preset Context Menu
    PRESET_CONTEXT_MENU_DELETE_ALL = 'Delete All',
    -- TAS Tab
    DISABLED = 'Disabled',
    MATCH_YAW = 'Match Yaw',
    REVERSE_ANGLE = 'Reverse Angle',
    MATCH_ANGLE = 'Match Angle',
    D99_ALWAYS = 'Always',
    D99 = '.99',
    DYAW = 'D-Yaw',
    ATAN_STRAIN = 'Arctan Strain',
    ATAN_STRAIN_REV = 'I',
    MAG_RESET = 'R',
    MAG_HI = 'H',
    SPDKICK = 'Spdkick',
    FRAMEWALK = 'Framewalk',
    SWIM = 'Swim',
    -- Semantic Workflow Tab
    YES = 'Yes',
    NO = 'No',
    SEMANTIC_WORKFLOW_HELP_HEADER_TITLE = 'Semantic Workflow Help',
    SEMANTIC_WORKFLOW_HELP_SHOW_TOOL_TIP = 'Show Help',
    SEMANTIC_WORKFLOW_HELP_EXIT_TOOL_TIP = 'Exit',
    SEMANTIC_WORKFLOW_HELP_PREV_PAGE = 'back',
    SEMANTIC_WORKFLOW_HELP_NEXT_PAGE = 'next',
    SEMANTIC_WORKFLOW_SHEET_NO_SELECTED = 'No semantic workflow sheet selected.\nSelect one to proceed.',
    SEMANTIC_WORKFLOW_SHEET_DELETE_CONFIRMATION =
    '[Confirm deletion]\n\nAre you sure you want to delete \"%s\"?\nThis action cannot be undone.',
    SEMANTIC_WORKFLOW_FRAMELIST_START = 'Start: ',
    SEMANTIC_WORKFLOW_FRAMELIST_NAME = 'Name',
    SEMANTIC_WORKFLOW_FRAMELIST_SECTION = '#Section',
    SEMANTIC_WORKFLOW_FRAMELIST_STICK = 'Joystick',
    SEMANTIC_WORKFLOW_FRAMELIST_UNTIL = 'Until',
    SEMANTIC_WORKFLOW_TOOL_COPY_ENTIRE_STATE = 'Copy entire state',
    SEMANTIC_WORKFLOW_CONTROL_MANUAL = 'Manual',
    SEMANTIC_WORKFLOW_CONTROL_MATCH_YAW = 'Yaw',
    SEMANTIC_WORKFLOW_CONTROL_MATCH_ANGLE = 'Angle',
    SEMANTIC_WORKFLOW_CONTROL_REVERSE_ANGLE = 'Reverse',
    SEMANTIC_WORKFLOW_CONTROL_DYAW = 'DYaw',
    SEMANTIC_WORKFLOW_CONTROL_ATAN_RETIME = 'Retime...',
    SEMANTIC_WORKFLOW_CONTROL_ATAN_SELECT_START = 'Select start...',
    SEMANTIC_WORKFLOW_CONTROL_ATAN_SELECT_END = 'Select end...',
    SEMANTIC_WORKFLOW_CONTROL_ATAN = 'Enable',
    SEMANTIC_WORKFLOW_CONTROL_ATAN_REVERSE = 'Invert',
    SEMANTIC_WORKFLOW_CONTROL_HIGH_MAG = 'High Mag',
    SEMANTIC_WORKFLOW_CONTROL_SPDKICK = 'Spdk',
    SEMANTIC_WORKFLOW_PROJECT_FILE_VERSION = 'File version: ',
    SEMANTIC_WORKFLOW_PROJECT_NO_SHEETS_AVAILABLE = 'No semantic workflow sheets available.\nCreate one to proceed.',
    SEMANTIC_WORKFLOW_PROJECT_NEW = 'New',
    SEMANTIC_WORKFLOW_PROJECT_NEW_TOOL_TIP = 'Create a new project in a new location',
    SEMANTIC_WORKFLOW_PROJECT_OPEN = 'Open',
    SEMANTIC_WORKFLOW_PROJECT_OPEN_TOOL_TIP = 'Open an existing project',
    SEMANTIC_WORKFLOW_PROJECT_SAVE = 'Save',
    SEMANTIC_WORKFLOW_PROJECT_SAVE_TOOL_TIP = 'Save the current project (no confirmation!)',
    SEMANTIC_WORKFLOW_PROJECT_PURGE = 'Purge',
    SEMANTIC_WORKFLOW_PROJECT_PURGE_TOOL_TIP = 'Remove files that do not belong to this project',
    SEMANTIC_WORKFLOW_PROJECT_CONFIRM_PURGE =
    [[
[Confirm project purge]

Are you sure you want to purge unused sheets from the project directory?
Unrelated files (not ending with .sws or .sws.savestate) will not be touched.
This action cannot be undone.
]],
    SEMANTIC_WORKFLOW_PROJECT_CONFIRM_SHEET_DELETION_1 = '[Confirm deletion]\n\nAre you sure you want to delete \"',
    SEMANTIC_WORKFLOW_PROJECT_CONFIRM_SHEET_DELETION_2 = '\"?\nThis action cannot be undone.',
    SEMANTIC_WORKFLOW_PROJECT_DISABLE_TOOL_TIP = 'Unselect sheet',
    SEMANTIC_WORKFLOW_PROJECT_SELECT_TOOL_TIP = 'Select and run sheet',
    SEMANTIC_WORKFLOW_PROJECT_ADD_SHEET = 'Add Sheet...',
    SEMANTIC_WORKFLOW_PROJECT_REBASE_SHEET_TOOL_TIP = 'Set start to now',
    SEMANTIC_WORKFLOW_PROJECT_REPLACE_INPUTS_TOOL_TIP = 'Replace inputs',
    SEMANTIC_WORKFLOW_PROJECT_PLAY_WITHOUT_ST_TOOL_TIP = 'Play without loading .st',
    SEMANTIC_WORKFLOW_PROJECT_DELETE_SHEET_TOOL_TIP = 'Delete',
    SEMANTIC_WORKFLOW_PROJECT_ADD_SHEET_TOOL_TIP = 'Add',
    SEMANTIC_WORKFLOW_PROJECT_MOVE_SHEET_UP_TOOL_TIP = 'Move up',
    SEMANTIC_WORKFLOW_PROJECT_MOVE_SHEET_DOWN_TOOL_TIP = 'Move down',
    SEMANTIC_WORKFLOW_INPUTS_EXPAND_SECTION = 'Expand',
    SEMANTIC_WORKFLOW_INPUTS_COLLAPSE_SECTION = 'Collapse',
    SEMANTIC_WORKFLOW_INPUTS_INSERT_SECTION = '+Section',
    SEMANTIC_WORKFLOW_INPUTS_INSERT_SECTION_TOOL_TIP = 'Insert section after selected',
    SEMANTIC_WORKFLOW_INPUTS_DELETE_SECTION = '-Section',
    SEMANTIC_WORKFLOW_INPUTS_DELETE_SECTION_TOOL_TIP = 'Delete selected section',
    SEMANTIC_WORKFLOW_INPUTS_TIMEOUT = 'Timeout:',
    SEMANTIC_WORKFLOW_INPUTS_TIMEOUT_TOOL_TIP = 'End section after at most N frames',
    SEMANTIC_WORKFLOW_INPUTS_END_ACTION = 'End action:',
    SEMANTIC_WORKFLOW_INPUTS_END_ACTION_TOOL_TIP = 'End section when Mario enters this action',
    SEMANTIC_WORKFLOW_INPUTS_END_ACTION_TYPE_TO_SEARCH_TOOL_TIP = 'Type to filter actions',
    SEMANTIC_WORKFLOW_INPUTS_INSERT_INPUT = '+Input',
    SEMANTIC_WORKFLOW_INPUTS_INSERT_INPUT_TOOL_TIP = 'Insert frame after selected',
    SEMANTIC_WORKFLOW_INPUTS_DELETE_INPUT = '-Input',
    SEMANTIC_WORKFLOW_INPUTS_DELETE_INPUT_TOOL_TIP = 'Delete selected frame',
    SEMANTIC_WORKFLOW_PREFERENCES_EDIT_ENTIRE_STATE = 'Edit entire state',
    SEMANTIC_WORKFLOW_PREFERENCES_FAST_FORWARD = 'Fast Forward',
    SEMANTIC_WORKFLOW_PREFERENCES_DEFAULT_SECTION_TIMEOUT = 'Default section timeout:',
    -- Settings Tab
    SETTINGS_VISUALS_TAB_NAME = 'Visuals',
    SETTINGS_INTERACTION_TAB_NAME = 'Interaction',
    SETTINGS_VARWATCH_TAB_NAME = 'Varwatch',
    SETTINGS_MEMORY_TAB_NAME = 'Memory',
    SETTINGS_VISUALS_STYLE = 'Style',
    SETTINGS_VISUALS_LOCALE = 'Locale',
    SETTINGS_VISUALS_NOTIFICATIONS = 'Notifications',
    SETTINGS_VISUALS_NOTIFICATIONS_BUBBLE = 'Bubble',
    SETTINGS_VISUALS_NOTIFICATIONS_CONSOLE = 'Console',
    SETTINGS_VISUALS_FF_FPS = 'FPS during Fast-Forward',
    SETTINGS_VISUALS_FF_FPS_TOOLTIP = 'The FPS to render at when fast-forwarding. Decrease to increase performance.',
    SETTINGS_VISUALS_UPDATE_EVERY_VI = 'Update every VI',
    SETTINGS_VISUALS_UPDATE_EVERY_VI_TOOLTIP =
    'Updates the UI every VI, improving mupen capture sync. Reduces performance.',
    SETTINGS_INTERACTION_MANUAL_ON_JOYSTICK_INTERACT = "Enable manual mode on joystick interact",
    SETTINGS_VARWATCH_DISABLED = '(disabled)',
    SETTINGS_VARWATCH_HIDE = 'Hide',
    SETTINGS_VARWATCH_ANGLE_FORMAT = 'Angle formatting',
    SETTINGS_VARWATCH_ANGLE_FORMAT_SHORT = 'Short',
    SETTINGS_VARWATCH_ANGLE_FORMAT_DEGREE = 'Degree',
    SETTINGS_VARWATCH_DECIMAL_POINTS = 'Decimal points',
    SETTINGS_VARWATCH_SPD_EFFICIENCY = 'Speed Efficiency Visualization',
    SETTINGS_VARWATCH_SPD_EFFICIENCY_PERCENTAGE = 'Percentage',
    SETTINGS_VARWATCH_SPD_EFFICIENCY_FRACTION = 'Fraction',
    SETTINGS_MEMORY_FILE_SELECT = 'Select map file...',
    SETTINGS_MEMORY_DETECT_NOW = 'Autodetect now',
    SETTINGS_MEMORY_DETECT_ON_START = 'Autodetect on start',
    SETTINGS_HOTKEYS_NOTHING = '(nothing)',
    SETTINGS_HOTKEYS_CONFIRMATION = 'Press Enter to confirm',
    SETTINGS_HOTKEYS_CLEAR = 'Clear',
    SETTINGS_HOTKEYS_RESET = 'Reset',
    SETTINGS_HOTKEYS_ASSIGN = 'Assign',
    SETTINGS_HOTKEYS_ACTIVATION = 'Hotkey Activation',
    SETTINGS_HOTKEYS_ACTIVATION_ALWAYS = 'Always',
    SETTINGS_HOTKEYS_ACTIVATION_WHEN_NO_FOCUS = 'When no control in focus',
    -- Tools Tab
    TOOLS_RNG = 'RNG',
    TOOLS_RNG_LOCK = 'Lock to',
    TOOLS_RNG_USE_INDEX = 'Use Index',
    TOOLS_DUMPING = 'Dumping',
    TOOLS_GHOST = 'Ghost',
    TOOLS_GHOST_START = 'Start Recording',
    TOOLS_GHOST_STOP = 'Stop Recording',
    TOOLS_GHOST_START_RECORDING_FAILED = 'Failed to start ghost recording.',
    TOOLS_GHOST_STOP_RECORDING_FAILED = 'Failed to stop ghost recording.',
    TOOLS_EXPERIMENTS = 'Experiments',
    TOOLS_MOVED_DIST = 'Moved Dist',
    TOOLS_MINI_OVERLAY = 'Input Overlay',
    TOOLS_AUTO_FIRSTIES = 'Auto-firsties',
    TOOLS_WORLD_VISUALIZER = 'World Visualizer',
    -- Timer Tab
    TIMER_START = 'Start',
    TIMER_STOP = 'Stop',
    TIMER_RESET = 'Reset',
    TIMER_MANUAL = 'Manual',
    TIMER_AUTO = 'Auto',
    -- Varwatch
    VARWATCH_FACING_YAW = 'Facing Yaw: %s (O: %s)',
    VARWATCH_INTENDED_YAW = 'Intended Yaw: %s (O: %s)',
    VARWATCH_H_SPEED = 'H Spd: %s (S: %s)',
    VARWATCH_H_SLIDING = 'H Sliding Spd: %s',
    VARWATCH_Y_SPEED = 'Y Spd: %s',
    VARWATCH_SPD_EFFICIENCY_PERCENTAGE = 'Spd Efficiency: %s',
    VARWATCH_SPD_EFFICIENCY_FRACTION = 'Spd Efficiency: %d/4',
    VARWATCH_POS_X = 'X: %s',
    VARWATCH_POS_Y = 'Y: %s',
    VARWATCH_POS_Z = 'Z: %s',
    VARWATCH_PITCH = 'Pitch: %s',
    VARWATCH_YAW_VEL = 'Yaw Vel: %s',
    VARWATCH_PITCH_VEL = 'Pitch Vel: %s',
    VARWATCH_XZ_MOVEMENT = 'XZ Movement: %s',
    VARWATCH_ACTION = 'Action: ',
    VARWATCH_UNKNOWN_ACTION = 'Unknown action ',
    VARWATCH_RNG = 'RNG: ',
    VARWATCH_RNG_INDEX = 'Index: ',
    VARWATCH_GLOBAL_TIMER = 'Global Timer: %s',
    VARWATCH_DIST_MOVED = 'Dist Moved: %s',
    -- Memory addresses
    ADDRESS_USA = 'USA',
    ADDRESS_JAPAN = 'Japan',
    ADDRESS_SHINDOU = 'Shindou',
    ADDRESS_PAL = 'Europe',
    -- putting this at the bottom as to not clutter
    SEMANTIC_WORKFLOW_HELP_EXPLANATIONS = {
        PROJECT_TAB = {
            HEADING = 'Semantic Workflow Projects',
            PAGES = {
                {
                    HEADING = 'About',
                    TEXT =
                    [[
This page lets you play back a sequence of TAS inputs starting from a specific state with immediate effect.

The purpose of this is to quickly iterate over the effects of small changes "in the past" in order to more efficiently iterate over different implementations of the same strategy.

By managing so-called "Semantic Workflow Projects", it is possible to author entire runs in terms of semantics consisting of just a few sections.

This tool is separated into several tab pages that you can select at the top. Once you have started work on a Semantic Workflow Project, a dedicated help page will be available for each tab just like for this one.

Click the "next" arrow at the top to learn more about how to get started.
]],
                },
                {
                    HEADING = 'Getting Started',
                    TEXT =
                    [[
The main entity you will be working with is the "Sheet".
A Sheet describes a sequence of inputs, that, starting from a specific point, will (attempt to) perform a certain sequence of actions that make up a segment of a complete run.
Sheets are divided further into sections, with each section ending when either a certain number of frames has passed, or a certain other condition is met.

This page allows you to manage several related Sheets in a so called "Semantic Workflow Project".
Semantic Workflow Projects are really just a collection of Sheets that are saved in a directory next to the semantic workflow project file (*.swp).
You can create, save and load projects using the respective buttons at the top.

The "New" button will ask for a location for the new project. It is recommended that you create a new empty directory for the new project, as having multiple projects in the same directory could have them unintendedly interfere with each other.
The "Save" button will always save over the currently loaded project file without confirmation, unless you haven't opened or created any project yet.
]],
                },
                {
                    HEADING = 'Recording .m64 files',
                    TEXT =
                    [[
Once you are satisfied with your work, you will probably want to record it into a .m64 file.
To do this, open a .m64 file in mupen as normal and let it play until a state that matches the savestate of the first sheet you want to play back semantically.
Then enter read/write mode so that frames can be recorded.
You may also achieve this by simply starting a new recording from the savestate of the first sheet.

Then, hit the right pointing arrows ("Play without loading .st") for each sheet in order. (Make sure to let them play to the end before hitting the next one)
This, of course, assumes that the Sheets are "stitched together" correctly, i.e. that each Sheet you click starts where the previous Sheet ends (i.e. where its preview frame ends up being).

Do not play back .m64 movies while authoring Sheets, as this will produce unpredictable inputs.
When playing back a .m64 file, make sure that no sheet is selected in the Project's Sheet list.
]],
                },
                {
                    HEADING = 'Using git',
                    TEXT =
                    [[
The Semantic Workflow Project file and its associated Sheet files follow a human readable file format.
In order to keep track of the work done on a TAS, I recommend initializing a local git repository in the the directory where the .swp file is located.
This way, you can save your project and make a commit whenever you have made significant progress, and manage different branches to compare strategies.
This helps with keeping track of progress, preventing loss of work, and keeping things organized.

To make a commit, simply hit "Save" and commit all changes.
After checking out a commit or branch, you will need to "Open" the .swp file again to load everything from your drive into memory.

You may even find it beneficial to manage other files with git, too, such as ghosts, recorded .m64 files, STROOP tracker configurations or Strat write-ups!
]],
                },
                {
                    HEADING = 'File versions',
                    TEXT =
                    [[
The .sws and .swp files follow semantic versioning; that is, a <MAJOR>.<MINOR>.<PATCH> format.
Compare the running script version (top right next to the help button) with the file version as seen in the Project tab to understand what's happening:

MAJOR versions may be both upwards and downwards incompatible with each other.
Upgrade or downgrade the script accordingly.

MINOR versions may be upwards incompatible,
for example when the higher MINOR file version introduces a new feature not yet supported by the lower script version.

PATCH versions should be both upwards and downwards compatible within the same MINOR version, as they are meant for bugfixes only.
However, as is the nature of bugs, this may sometimes not be done quite right ¯\_(ツ)_/¯
]],
                },
            },
        },
        INPUTS_TAB = {
            HEADING = 'Input editor',
            PAGES = {
                {
                    HEADING = 'Overview',
                    TEXT =
                    [[
Click the "#Section" column in the Section List to select the "preview frame" (highlighted in red).
You can expand and collapse sections that have more than one initial input frame.
Click the middle column in the Section List to select the "active frame" (highlighted in green), which is used for editing (more on that on the next help page).

Whenever you make changes to any inputs (e.g. change any button inputs), the game is going to be replayed to the preview frame from the start of the Sheet with the new inputs.

The "+Section" and "-Section" buttons add and remove a section at the currently selected section respectively.
A sheet must always have at least one section.

The "+Input" and "-Input" buttons add and remove a frame at the selected frame in the selected section respectively.
This is useful to initiate a new action such as a long jump, for example after landing from a previous rollout.

The controls at the bottom behave similarly to the standard "TAS" view you may be familiar with, just in a more condensed layout.
]],
                },
                {
                    HEADING = 'Editing',
                    TEXT =
                    [[
You can select a range of joystick inputs to edit by left clicking and dragging over the mini-joysticks in the desired range. Hold the CTRL key to not reset the selection when left clicking.
The selected range will follow the active frame highlighted by a green border.
Its values will be displayed in the joystick controls at the bottom, and when you make any changes, those values will copied to the selected range.

If the 'Edit entire state' toggle in the preferences page is off, only the changes made to the active frame (rather than all its values) will be copied to the selected range.

When the active frame and the preview frame are the same, the highlight will become a yellow-ish green.

To edit button inputs, simply click and drag over the small circles on the right.
This is not affected by and does not affect your selection or active frame.
]],
                },
                {
                    HEADING = 'Arctan straining',
                    TEXT =
                    [[
Arctan straining works similarly to how it does in the TAS tab.
Clicking the 'Enable' button will enable arctan straining for the selected input frames, but will not set the 'start' and 'N' variables.
To do so, click the 'Retime...' button, then select the desired start frame (inclusive), followed by the desired end frame (exclusive).
You can still manually adjust the parameters as needed afterwards.
]],
                },
            },
        },
        PREFERENCES_TAB = {
            HEADING = 'Preferences',
            PAGES = {
                {
                    HEADING = 'Overview',
                    TEXT =
                    [[
This page displays and edits settings that are not stored in a Semantic Workflow Project, and instead persist in your local settings instead.
Each setting may get an individual help page here in the future. For now, here is a brief list of what each setting does:

- Edit entire state: Copy the entire joystick state of the active frame to the selected range in the "Inputs" page. When turned off, only the changed values will be copied to the selected range.

- Fast Forward: Play the game back at maximum speed when re-running a sheet (e.g. when making changes). When turned off, the game will play back in real time instead.

- Default section timeout: The number of frames after which a newly created section will time out by default.
]],
                },
            },
        },
    },
    ACTIONS = {
        [0x00000000] = 'uninitialized',
        [0x0C400201] = 'idle',
        [0x0C400202] = 'start sleeping',
        [0x0C000203] = 'sleeping',
        [0x0C000204] = 'waking up',
        [0x0C400205] = 'panting',
        [0x08000206] = 'hold panting (unused)',
        [0x08000207] = 'hold idle',
        [0x08000208] = 'hold heavy idle',
        [0x0C400209] = 'standing against wall',
        [0x0C40020A] = 'coughing',
        [0x0C40020B] = 'shivering',
        [0x0002020D] = 'in quicksand',
        [0x0002020E] = 'unknown 2020E',
        [0x0C008220] = 'crouching',
        [0x0C008221] = 'start crouching',
        [0x0C008222] = 'stop crouching',
        [0x0C008223] = 'start crawling',
        [0x0C008224] = 'stop crawling',
        [0x08000225] = 'slide kick slide stop',
        [0x00020226] = 'shockwave bounce',
        [0x0C000227] = 'first person',
        [0x0800022F] = 'backflip land stop',
        [0x0C000230] = 'jump land stop',
        [0x0C000231] = 'double jump land stop',
        [0x0C000232] = 'freefall land stop',
        [0x0C000233] = 'side flip land stop',
        [0x08000234] = 'hold jump land stop',
        [0x08000235] = 'hold freefall land stop',
        [0x80000A36] = 'air throw land',
        [0x18800238] = 'twirl land',
        [0x08000239] = 'lava boost land',
        [0x0800023A] = 'triple jump land stop',
        [0x0800023B] = 'long jump land stop',
        [0x0080023C] = 'ground pound land',
        [0x0C00023D] = 'braking stop',
        [0x0C00023E] = 'butt slide stop',
        [0x0800043F] = 'hold butt slide stop',
        [0x04000440] = 'walking',
        [0x00000442] = 'hold walking',
        [0x00000443] = 'turning around',
        [0x00000444] = 'finish turning around',
        [0x04000445] = 'braking',
        [0x20810446] = 'riding shell ground',
        [0x00000447] = 'hold heavy walking',
        [0x04008448] = 'crawling',
        [0x00020449] = 'burning ground',
        [0x0400044A] = 'decelerating',
        [0x0000044B] = 'hold decelerating',
        [0x00000050] = 'begin sliding',
        [0x00000051] = 'hold begin sliding',
        [0x00840452] = 'butt slide',
        [0x008C0453] = 'stomach slide',
        [0x00840454] = 'hold butt slide',
        [0x008C0455] = 'hold stomach slide',
        [0x00880456] = 'dive slide',
        [0x00800457] = 'move punching',
        [0x04808459] = 'crouch slide',
        [0x0080045A] = 'slide kick slide',
        [0x00020460] = 'hard backward ground kb',
        [0x00020461] = 'hard forward ground kb',
        [0x00020462] = 'backward ground kb',
        [0x00020463] = 'forward ground kb',
        [0x00020464] = 'soft backward ground kb',
        [0x00020465] = 'soft forward ground kb',
        [0x00020466] = 'ground bonk',
        [0x00020467] = 'death exit land',
        [0x04000470] = 'jump land',
        [0x04000471] = 'freefall land',
        [0x04000472] = 'double jump land',
        [0x04000473] = 'side flip land',
        [0x00000474] = 'hold jump land',
        [0x00000475] = 'hold freefall land',
        [0x00000476] = 'quicksand jump land',
        [0x00000477] = 'hold quicksand jump land',
        [0x04000478] = 'triple jump land',
        [0x00000479] = 'long jump land',
        [0x0400047A] = 'backflip land',
        [0x03000880] = 'jump',
        [0x03000881] = 'double jump',
        [0x01000882] = 'triple jump',
        [0x01000883] = 'backflip',
        [0x03000885] = 'steep jump',
        [0x03000886] = 'wall kick air',
        [0x01000887] = 'side flip',
        [0x03000888] = 'long jump',
        [0x01000889] = 'water jump',
        [0x0188088A] = 'dive',
        [0x0100088C] = 'freefall',
        [0x0300088D] = 'top of pole jump',
        [0x0300088E] = 'butt slide air',
        [0x03000894] = 'flying triple jump',
        [0x00880898] = 'shot from cannon',
        [0x10880899] = 'flying',
        [0x0281089A] = 'riding shell jump',
        [0x0081089B] = 'riding shell fall',
        [0x1008089C] = 'vertical wind',
        [0x030008A0] = 'hold jump',
        [0x010008A1] = 'hold freefall',
        [0x010008A2] = 'hold butt slide air',
        [0x010008A3] = 'hold water jump',
        [0x108008A4] = 'twirling',
        [0x010008A6] = 'forward rollout',
        [0x000008A7] = 'air hit wall',
        [0x000004A8] = 'riding hoot',
        [0x008008A9] = 'ground pound',
        [0x018008AA] = 'slide kick',
        [0x830008AB] = 'air throw',
        [0x018008AC] = 'jump kick',
        [0x010008AD] = 'backward rollout',
        [0x000008AE] = 'crazy box bounce',
        [0x030008AF] = 'special triple jump',
        [0x010208B0] = 'backward air kb',
        [0x010208B1] = 'forward air kb',
        [0x010208B2] = 'hard forward air kb',
        [0x010208B3] = 'hard backward air kb',
        [0x010208B4] = 'burning jump',
        [0x010208B5] = 'burning fall',
        [0x010208B6] = 'soft bonk',
        [0x010208B7] = 'lava boost',
        [0x010208B8] = 'getting blown',
        [0x010208BD] = 'thrown forward',
        [0x010208BE] = 'thrown backward',
        [0x380022C0] = 'water idle',
        [0x380022C1] = 'hold water idle',
        [0x300022C2] = 'water action end',
        [0x300022C3] = 'hold water action end',
        [0x300032C4] = 'drowning',
        [0x300222C5] = 'backward water kb',
        [0x300222C6] = 'forward water kb',
        [0x300032C7] = 'water death',
        [0x300222C8] = 'water shocked',
        [0x300024D0] = 'breaststroke',
        [0x300024D1] = 'swimming end',
        [0x300024D2] = 'flutter kick',
        [0x300024D3] = 'hold breaststroke',
        [0x300024D4] = 'hold swimming end',
        [0x300024D5] = 'hold flutter kick',
        [0x300024D6] = 'water shell swimming',
        [0x300024E0] = 'water throw',
        [0x300024E1] = 'water punch',
        [0x300022E2] = 'water plunge',
        [0x300222E3] = 'caught in whirlpool',
        [0x080042F0] = 'metal water standing',
        [0x080042F1] = 'hold metal water standing',
        [0x000044F2] = 'metal water walking',
        [0x000044F3] = 'hold metal water walking',
        [0x000042F4] = 'metal water falling',
        [0x000042F5] = 'hold metal water falling',
        [0x000042F6] = 'metal water fall land',
        [0x000042F7] = 'hold metal water fall land',
        [0x000044F8] = 'metal water jump',
        [0x000044F9] = 'hold metal water jump',
        [0x000044FA] = 'metal water jump land',
        [0x000044FB] = 'hold metal water jump land',
        [0x00001300] = 'disappeared',
        [0x04001301] = 'intro cutscene',
        [0x00001302] = 'star dance exit',
        [0x00001303] = 'star dance water',
        [0x00001904] = 'fall after star grab',
        [0x20001305] = 'reading automatic dialog',
        [0x20001306] = 'reading npc dialog',
        [0x00001307] = 'star dance no exit',
        [0x00001308] = 'reading sign',
        [0x00001909] = 'grand star cutscene',
        [0x0000130A] = 'waiting for dialog',
        [0x0000130F] = 'debug free move',
        [0x00021311] = 'standing death',
        [0x00021312] = 'quicksand death',
        [0x00021313] = 'electrocution',
        [0x00021314] = 'suffocation',
        [0x00021315] = 'death on stomach',
        [0x00021316] = 'death on back',
        [0x00021317] = 'eaten by bubba',
        [0x00001918] = 'peach cutscene',
        [0x00001319] = 'credits',
        [0x0000131A] = 'waving',
        [0x00001320] = 'pulling door',
        [0x00001321] = 'pushing door',
        [0x00001322] = 'warp door spawn',
        [0x00001923] = 'emerge from pipe',
        [0x00001924] = 'spawn spin airborne',
        [0x00001325] = 'spawn spin landing',
        [0x00001926] = 'exit airborne',
        [0x00001327] = 'exit land save dialog',
        [0x00001928] = 'death exit',
        [0x00001929] = 'death exit (unused)',
        [0x0000192A] = 'falling death exit',
        [0x0000192B] = 'special exit airborne',
        [0x0000192C] = 'special death exit',
        [0x0000192D] = 'falling exit airborne',
        [0x0000132E] = 'unlocking key door',
        [0x0000132F] = 'unlocking star door',
        [0x00001331] = 'entering star door',
        [0x00001932] = 'spawn no spin airborne',
        [0x00001333] = 'spawn no spin landing',
        [0x00001934] = 'bbh enter jump',
        [0x00001535] = 'bbh enter spin',
        [0x00001336] = 'teleport fade out',
        [0x00001337] = 'teleport fade in',
        [0x00020338] = 'shocked',
        [0x00020339] = 'squished',
        [0x0002033A] = 'head stuck in ground',
        [0x0002033B] = 'butt stuck in ground',
        [0x0002033C] = 'feet stuck in ground',
        [0x0000133D] = 'putting on cap',
        [0x08100340] = 'holding pole',
        [0x00100341] = 'grab pole slow',
        [0x00100342] = 'grab pole fast',
        [0x00100343] = 'climbing pole',
        [0x00100344] = 'top of pole transition',
        [0x00100345] = 'top of pole',
        [0x08200348] = 'start hanging',
        [0x00200349] = 'hanging',
        [0x0020054A] = 'hang moving',
        [0x0800034B] = 'ledge grab',
        [0x0000054C] = 'ledge climb slow 1',
        [0x0000054D] = 'ledge climb slow 2',
        [0x0000054E] = 'ledge climb down',
        [0x0000054F] = 'ledge climb fast',
        [0x00020370] = 'grabbed',
        [0x00001371] = 'in cannon',
        [0x10020372] = 'tornado twirling',
        [0x00800380] = 'punching',
        [0x00000383] = 'picking up',
        [0x00000385] = 'dive picking up',
        [0x00000386] = 'stomach slide stop',
        [0x00000387] = 'placing down',
        [0x80000588] = 'throwing',
        [0x80000589] = 'heavy throw',
        [0x00000390] = 'picking up bowser',
        [0x00000391] = 'holding bowser',
        [0x00000392] = 'releasing bowser',
    },
}
