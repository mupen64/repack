# Unreleased

This is a development version.

## ✨ Features

- Changed notification system to use Mupen's native toasts.

## 🐞 Bugfixes

- Fixed increment angle action not wrapping the angle correctly

# 7.0.0

This release adds crazy ghost-related features, map file loading support, and even improves the accuracy of computed angles!

You can now record and playback ghosts (and object ghosts!) from the new Ghost tab. Huge thanks to [Xander](https://github.com/MikeXander) and [Frame](https://github.com/FramePerfection) for their mountains of work on this!

Even if you don't need the new functionality, your TASes will automatically become faster just by updating :P

## ✨ Features

- Added a Ghost tab with playback and recording functionality.
- Added support for loading addresses from `.map` files.
- Added Dustless Walk, which adjusts joystick magnitude to prevent walking dust particles.
- Added tooltips to many UI elements.
- Added more actions for changing settings on the fly.
- Added configurable light/dark style switching.
- Added UI animations.
- Added a HAU angle formatting option.
- Improved Speedkick to choose better angles.
- Improved UI color consistency across themes.
- Made the settings view into one unified scrolling page.

## 🐞 Bugfixes

- Fixed malformed presets preventing startup
- Fixed .99 sometimes crossing the speed-drag threshold.
- Fixed arctan value labels overflowing their available space.
- Fixed the semantic workflow help text not wrapping.

# 6.1.0

This release integrates sm64-viz into SM64 Lua Redux and improves the documentation with some nice screenshots.

Thanks to @hugou74130 for the great contributions!

## ✨ Features

- Integrate sm64-viz (#106)

## 📚 Documentation

- Add some screenshots (#123)

# 6.0.0

This release revamps a big part of the Semantic Workflow and fixes tons of bugs.

Thanks to new contributor @hugou74130 for massively pushing this project forward and @FramePerfection for continued great design and implementation work!

## ⚡ Performance

- Use `d2d.set_target_fps` for throttling during ff (#88)

## ✨ Features

- **SemanticWorkflow** Add loops (#114)
- **SemanticWorkflow** Use ultra fast forward mode for a cleaner viewing experience (#111)
- **SemanticWorkflow** Add an option to duplicate sheets (#74)
- **SemanticWorkflow** Use more and better icons (#94)
- **SemanticWorkflow** Better automatic sheet names (#78)
- **SemanticWorkflow** Match joystick gui to TAS tab (#71)
- **Locale** Add French locale (#72)
- **SemanticWorkflow** Base sheets (#53)

## 🐞 Bugfixes

- Poor text color contrast in dark mode (#107)
- **Presets** Memory source not updating when changing preset (#104)
- **Presets** Change preset index application method (#102)
- **SemanticWorkflow** Localized tab text not updating (#95)
- **SemanticWorkflow** Crash when renaming sheets (#96)
- **Memory** Incoherent or flickering values shown at certain times (#80)
- **VarWatch** Better speed efficiency fraction representation (#70)
- **SemanticWorkflow** Reject invalid file system characters in sheet names (#75)
- **SemanticWorkflow** Saving new projects now shows a save file dialog instead of an open file dialog (#76)
- **Ghost** Recording not working on non-US game versions (#67)

## 📚 Documentation

- Update doc naming scheme (#121)

# 5.3.1

This release updates to the latest version of ugui and adds a few convenience features.

## ✨ Features

- 'lock hotkeys when control is active' option (#63)
- **Actions** Parameterize set angle/mag actions (#59)

# 5.3.0

This release contains some nice QoL features and a visual rework of the tools page, as well as some pretty important bugfixes.

## ✨ Features

- **VarWatch** Always show speed efficiency fraction (#58)
- **TAS** Hide atan inverse button when atan disabled (#57)
- **Tools** Better tool organization (#56)

## 🐞 Bugfixes

- Hotkeys being locked too eagerly
- Preset context menu not reacting to interactions

# 5.2.1

This release fixes some focus-related issues.

## 🐞 Bugfixes

- Various focus-related issues
- Hotkeys triggering while keyboard focus is taken

# 5.2.0

This release implements Kieran's TAS page redesign and fixes some bugs related to the wallkicker and swimming modules.

Thanks to Kieran for the awesome contribution! 🤗

## ✨ Features

- New TAS page design (#52)

## 🐞 Bugfixes

- Wallkicker processor setting A button to invalid state
- Swimming processor setting swim button to invalid state

# 5.1.4

Summary

This release updates SM64 Lua Redux to use the latest version of [ugui](https://mupen64.com/ugui), fixing a focus-related bug.

# 5.1.3

This release updates SM64 Lua Redux to use the latest version of [ugui](https://mupen64.com/ugui), fixing a bug causing numberboxes to not work.

# 5.1.2

This release updates SM64 Lua Redux to use the latest version of [ugui](https://mupen64.com/ugui).

There should be no noticeable changes in functionality, so please report regressions if there are any.

# 5.1.1

This release fixes a critical bug which causes extreme slowdown.

## 🐞 Bugfixes

- Preset constantly being re-applied

# 5.1.0

This release adds infinite presets, changes the fast-forward skipping behaviour to be specified in FPS, and improves the input overlay.

## ✨ Features

- Infinite presets (#47)
- Specify fast-forward skipping in FPS
- **MiniVisualizer** Use raised frame sprite for joystick and action panel

## 🐞 Bugfixes

- **MiniVisualizer** Start button inputs not being recognized

# 5.0.1

This release fixes a bug with presets not being applied correctly.

## 🐞 Bugfixes

- Incorrect preset application

# 5.0.0

This release introduces integration with the Mupen64 Action API and cleans up the UI.

## ✨ Features

- Make enabling manual mode on joystick interaction optional
- Disallow setting manual mode in TAS view
- Action API integration (#43)
- **Settings** More tooltips in settings
- **Lookahead** Remove Lookahead in favor of semantic workflow
- **Timer2** Remove Timer2 tab due to supersession by sm64-viz
- **Grind** Remove auto-grind in favor of semantic workflow

## 📚 Documentation

- **Ghost** Document Ghost.update
- Fix wrong style mentioned in Customization.md
- Add Semantic Workflow stub which points to the in-script docs, update Settings.md
- Update Customization.md
- Add Experiments.md, remove Tools.md
- Move docs into main source tree, update to latest version

# 4.0.0

This release brings with it a new and incredibly powerful approach to TASing: the Semantic Workflow.

Thanks to @FramePerfection for designing and implementing the Semantic Workflow feature! 

Watch [Frame's Semantic Workflow tutorial](https://youtu.be/h5SwIaGlbIA) or use the help button in the Semantic Workflow tab for guidance surrounding the feature.

## ✨ Features

- Semantic Workflow (#33)

## ⚡ Performance

- **Styles** Lower style manager memory usage

## 🐞 Bugfixes

- **Timer2** Start button not reacting to inputs (#39)
- **Hotkeys** Repeat hotkeys being triggered when main window is unfocused

# 3.1.0

This update revamps the settings and preset UI, while adding some small things here and there and fixing lots of bugs.

## Features
- Dumping: Add movie start frame and movie path to dumps
- Hotkeys: Add ignore hotkey presses when control is focused setting
- Hotkeys: Add navbar visibility toggle hotkey
- Hotkeys: Add spdkick hotkey
- Hotkeys: Angle down/up hotkeys
- Hotkeys: Auto-repeating hotkeys
- Lib: Update and adapt to latest ugui, ugui-ext, and BreitbandGraphics
- Locale: Localization support
- MovedDist: Allow splitting moved distance into individual axes
- Notifications: Add on-screen notifications
- Presets: Add option to disable TAS state persistence
- Presets: Automatic cross-version preset fixing
- Settings: Add hotkey settings
- Settings: Add labels and tooltips to settings options
- Styles: InputDirection style
- Styles: Themed arrow icons
- Swimming: Auto-swim when holding objects
- Themes: Add Windows 11 Dark theme
- Themes: Add menu styling
- VarWatch: Add yaw_vel and pitch_vel
- VarWatch: Fraction Spd Efficiency formatting
- WorldVisualizer: Draw line between start and current position
- WorldVisualizer: Visualize moved dist start position

## Changes
- Experiments: Rename "Experiments" tab to "Tools"
- Experiments: Restructure UI into labeled sections, rename some buttons and improve interactions
- Formatter: Display large percentages as ∞%
- Hotkeys: Change spdkick into toggle_spdkick (thanks to ChouxZi3)
- Hotkeys: Ignore hotkeys while there is an active control
- Hotkeys: Make angle down/up hotkeys wrap at angle limits
- Hotkeys: Make angle up/down hotkeys snap to multiple of 16
- Memory: Optimize memory reading
- PianoRoll/JoystickGui: Use arrow icons for arrows
- PianoRoll: Show info text when no sheets are available or selected
- Presets: Add interim hack which allows persisting the movement mode
- Presets: Purge references to non-existent hotkeys in autofixed presets
- Presets: Serialize TASState contents with hack
- RNG: Merge RNG tab wiht Tools tab
- RNG: Move RNG to Experiments tab
- Settings: Change default style to Windows 11 V2
- Settings: Rename VarWatch tab to Varwatch
- Tabs: Move Tools tab after Settings tab
- VarWatch: Fix unnecessary performance hog at high core speed
- VarWatch: Show 0/4 when spd efficiency is under 0.01
- Views/TAS: Make joystick snap to 8,8
- Views/TAS: Use arrow icons for arrows
- Views/Timer2: Use arrow icons for arrows
- Views/Tools: Use arrow icons for arrows
- Views/VarWatchSettings: Move VarWatch-related settings into VarWatch tab
- Views/VarWatchSettings: Use arrow icons for arrows
- Views/VisualSettings: Use ugui tooltips
- WorldVisualizer: Rename "Object Visualizer" to "World Visualizer"

## Bugfixes
- Drawing: Drawing scale inaccuracy
- Drawing: grid() not respecting offset stack
- Engine: Speed efficiency 0 when it shouldn't be
- Hotkeys: Angle down hotkey wrapping around to 65536 instead of 65535
- Hotkeys: Unbound hotkeys being activated at every key press
- Main: Menu clashing with statusbar
- Memory: Incorrect previous values
- Memory: Memory values being delayed by 1 frame during lag sections
- PianoRoll: 1-row gap at the bottom
- PianoRoll: Crash due to negative size spinner
- PianoRoll: Joystick tips not being scaled down
- Presets: TAS State not being saved when script is stopped
- RNG: RNG override not working on non-US versions
- Styles: InputDirection style having incorrect button sources
- TAS: Joystick value text being invisible
- Timer: Automatic/Manual toggle not working as expected
- Views/HotkeySettings: Hotkey confirm text overlapping buttons

# 3.1.0-rc2

> [!WARNING]
> This update is a release candidate and may not be on-par with the final release's quality.

## Features
- Dumping: Add movie start frame and movie path to dumps
- Hotkeys: Add ignore hotkey presses when control is focused setting
- Hotkeys: Add spdkick hotkey
- Hotkeys: Angle down/up hotkeys
- Hotkeys: Auto-repeating hotkeys
- Lib: Update and adapt to latest ugui, ugui-ext, and BreitbandGraphics
- MovedDist: Allow splitting moved distance into individual axes
- Notifications: Add on-screen notifications
- Presets: Automatic cross-version preset fixing
- Settings: Add hotkey settings
- Settings: Add labels and tooltips to settings options
- Styles: Themed arrow icons
- Themes: Add Windows 11 Dark theme
- Themes: Add menu styling
- VarWatch: Add yaw_vel and pitch_vel
- VarWatch: Fraction Spd Efficiency formatting
- WorldVisualizer: Draw line between start and current position
- WorldVisualizer: Visualize moved dist start position

## Changes
- Experiments: Rename "Experiments" tab to "Tools"
- Experiments: Restructure UI into labeled sections, rename some buttons and improve interactions
- Hotkeys: Change spdkick into toggle_spdkick (thanks to ChouxZi3)
- Hotkeys: Ignore hotkeys while there is an active control
- Hotkeys: Make angle down/up hotkeys wrap at angle limits
- Hotkeys: Make angle up/down hotkeys snap to multiple of 16
- Memory: Optimize memory reading
- PianoRoll/JoystickGui: Use arrow icons for arrows
- PianoRoll: Show info text when no sheets are available or selected
- Presets: Add interim hack which allows persisting the movement mode
- Presets: Purge references to non-existent hotkeys in autofixed presets
- Presets: Serialize TASState contents with hack
- RNG: Merge RNG tab wiht Tools tab
- RNG: Move RNG to Experiments tab
- Settings: Change default style to Windows 11 V2
- Settings: Rename VarWatch tab to Varwatch
- Tabs: Move Tools tab after Settings tab
- VarWatch: Fix unnecessary performance hog at high core speed
- VarWatch: Show 0/4 when spd efficiency is under 0.01
- Views/TAS: Use arrow icons for arrows
- Views/Timer2: Use arrow icons for arrows
- Views/Tools: Use arrow icons for arrows
- Views/VarWatchSettings: Move VarWatch-related settings into VarWatch tab
- Views/VarWatchSettings: Use arrow icons for arrows
- Views/VisualSettings: Use ugui tooltips
- WorldVisualizer: Rename "Object Visualizer" to "World Visualizer"

## Bugfixes
- Drawing: Drawing scale inaccuracy
- Engine: Speed efficiency 0 when it shouldn't be
- Hotkeys: Angle down hotkey wrapping around to 65536 instead of 65535
- Hotkeys: Unbound hotkeys being activated at every key press
- Main: Menu clashing with statusbar
- PianoRoll: 1-row gap at the bottom
- PianoRoll: Crash due to negative size spinner
- PianoRoll: Joystick tips not being scaled down
- TAS: Joystick value text being invisible
- Views/HotkeySettings: Hotkey confirm text overlapping buttons

# 3.1.0-rc1

> [!WARNING]
> This update is a release candidate and may not be on-par with the final release's quality.

This update revamps the settings and preset UI, while adding some small things here and there and fixing lots of bugs.

## Features
- Dumping: Add movie start frame and movie path to dumps
- Hotkeys: Angle down/up hotkeys
- Hotkeys: Auto-repeating hotkeys
- Lib: Update and adapt to latest ugui, ugui-ext, and BreitbandGraphics
- MovedDist: Allow splitting moved distance into individual axes
- Notifications: Add on-screen notifications
- Settings: Add hotkey settings
- Settings: Add labels and tooltips to settings options
- Styles: Themed arrow icons
- Themes: Add Windows 11 Dark theme
- Themes: Add menu styling
- VarWatch: Add yaw_vel and pitch_vel
- WorldVisualizer: Visualize moved dist start position

## Changes
- Experiments: Rename "Experiments" tab to "Tools"
- Experiments: Restructure UI into labeled sections, rename some buttons and improve interactions
- Hotkeys: Ignore hotkeys while there is an active control
- Hotkeys: Make angle down/up hotkeys wrap at angle limits
- Hotkeys: Make angle up/down hotkeys snap to multiple of 16
- Memory: Optimize memory reading
- PianoRoll: Show info text when no sheets are available or selected
- RNG: Merge RNG tab wiht Tools tab
- RNG: Move RNG to Experiments tab
- Settings: Change default style to Windows 11 V2
- Settings: Rename VarWatch tab to Varwatch
- Tabs: Move Tools tab after Settings tab
- WorldVisualizer: Rename "Object Visualizer" to "World Visualizer"

## Bugfixes
- Drawing: Drawing scale inaccuracy
- Engine: Speed efficiency 0 when it shouldn't be
- Hotkeys: Angle down hotkey wrapping around to 65536 instead of 65535
- Hotkeys: Unbound hotkeys being activated at every key press
- Main: Menu clashing with statusbar
- PianoRoll: 1-row gap at the bottom
- PianoRoll: Crash due to negative size spinner
- PianoRoll: Joystick tips not being scaled down
- TAS: Joystick value text being invisible 

# 3.0.0

This update introduces the piano roll (courtesy of @FramePerfection), a new settings experience, and many bugfixes.

## What's Changed
* Use correct pitch variable by @crackhex in https://codeberg.org/mupen64/SM64LuaRedux/pull/24
* Add play mode and timestop variables, pitch and yaw vel, and correct variables for other versions by @crackhex in https://codeberg.org/mupen64/SM64LuaRedux/pull/25
* Add piano roll by @FramePerfection in https://codeberg.org/mupen64/SM64LuaRedux/pull/23

## New Contributors
* @crackhex made their first contribution in https://codeberg.org/mupen64/SM64LuaRedux/pull/24
* @FramePerfection made their first contribution in https://codeberg.org/mupen64/SM64LuaRedux/pull/23

# 2.0.1

# 2.0.0

## Noteworthy Changes
- Arctan improvements by @sm64expert 
- Full Japan, Shindou and Europe support by @sm64expert 
- Add Windows 11 v2 style
- Support 1.1.7+
- Fix processor step priority issues
- Fix numpad input in numberboxes
- Move C buttons to right side in timer tab
- Improve autodetect default settings

## What's Changed
* Arctan and .99 fix, support for Japan,Shindou and Europe by @sm64expert in https://codeberg.org/mupen64/SM64LuaRedux/pull/16

## New Contributors
* @sm64expert made their first contribution in https://codeberg.org/mupen64/SM64LuaRedux/pull/16

# 1.9.0

## Noteworthy Changes

- Added address switcher (Only USA and JP built in)
- Restructured input processing

# 1.8.1

Hotfix for mag circle-related bugs

# 1.8.0

## Noteworthy Changes

- Presets now persist across restarts
- Added hotkeys
- Add "wallkicker" (automatic firsties)
- Improved settings page layout

# 1.7.0

## Noteworthy changes

- Many bugfixes
- New themes
- Styling improvements
- 1.1.7 compatibility

# 1.6.0

# 1.5.0

# 1.4.0

# 1.3.0

# 1.2.0

# 1.1.0

## What's new?

- Fix Windows 10 dark listboxes having incorrect background color
- Clean up unused code, refactor movement mode selection
- Refactor input handling, fix combobox list layering
- Make more fields internal, refactor styler and renderer DI, simplify combobox list dropdown
- Add hittesting ignoring for topmost controls
- Fix topmost controls obeying ignored hittest regions

# 1.0.0
