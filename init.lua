-- tome-modest-auto-accept/init.lua
-- For ToME version 1.7.2

long_name = "Modest Auto-accept target"
short_name = "modest-auto-accept" -- Determines the name of your addon's file.
for_module = "tome"
version = {1,7,2}
addon_version = {1,0,1}
weight = 99 -- The lower this value, the sooner your addon will load compared to other addons.
author = {'hukumitu.youhei@gmail.com'}
homepage = 'https://hkmtyh.com'
description = [[Base Game's Auto-accept target is too aggressive for me.
This Addon provides restricted version of Auto-accept target.
Auto-accept target if there is only one seen creature.

Prevent some Talents from Auto-accept target.
- Demented/Controlled-horrors/Decayed Bloated Horror

This addon ignores Auto-accept target setting.

Future update(Maybe):
Auto-accept creature hovering by mouse.
I can't figure out how to distinguish it from last attacked creature. Help welcome.

Github: https://github.com/h-youhei/tome-modest-auto-accept

Weight: 99

SuperLoad:
- mod/class/Player.lua:getTarget()]] -- the [[ ]] things are like quote marks that can span multiple lines
tags = {'auto-accept'} -- tags MUST immediately follow description

overload = false
superload = true
data = true
hooks = true
