-- tome-modest-auto-accept/init.lua
-- For ToME version 1.7.2

long_name = "Modest Auto-accept target"
short_name = "modest-auto-accept" -- Determines the name of your addon's file.
for_module = "tome"
version = {1,7,2}
addon_version = {1,1,0}
weight = 99 -- The lower this value, the sooner your addon will load compared to other addons.
author = {'hukumitu.youhei@gmail.com'}
homepage = 'https://hkmtyh.com'
description = [[Base Game's Auto-accept target is too aggressive for me.
This Addon provides restricted version of Auto-accept target.
Auto-accept target if one of the followin is met
- there is only one seen creature
- you are hovering a creature by mouse

Prevent some Talents from Auto-accept target.
- Demented/Controlled-horrors/Decayed Bloated Horror

This addon ignores Auto-accept target setting.
You can toggle Modest Auto-accept target by 'Toggle automatic accept target option' hotkey.
Disable means both of Modest Auto-accept and Base Game's Auto-accept are disabled regardless of 'Auto-accept target' setting.

Github: https://github.com/h-youhei/tome-modest-auto-accept

Weight: 99

SuperLoad:
- mod/class/Player.lua:getTarget()
- mod/class/Game.lua:setupCommands() to ]] -- the [[ ]] things are like quote marks that can span multiple lines
tags = {'auto-accept'} -- tags MUST immediately follow description

overload = false
superload = true
data = true
hooks = true
