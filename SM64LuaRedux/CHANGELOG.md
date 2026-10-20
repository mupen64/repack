# 7.0.0

This release adds crazy ghost-related features, map file loading support, and even improves the accuracy of computed angles!

You can now record and playback ghosts (and object ghosts!) from the new Ghost tab. Huge thanks to [Xander](https://github.com/MikeXander) and [Frame](https://github.com/FramePerfection) for their mountains of work on this!

Even if you don't need the new functionality, your TASes will automatically become faster just by updating :P

### ✨ Features

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

### 🐞 Bugfixes

- Fixed malformed presets preventing startup
- Fixed .99 sometimes crossing the speed-drag threshold.
- Fixed arctan value labels overflowing their available space.
- Fixed the semantic workflow help text not wrapping.
