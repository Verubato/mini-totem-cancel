# MiniTotemCancel - bot reference

Version 1.0.7. Interface versions: 120100, 50504, 40402, 38002, 38000,
30405, 30300, 20506, 11509 (retail plus the classic client lines). No
saved variables. It has a settings panel showing the macros, but nothing
on it is configurable.

## What it does

Creates four invisible secure buttons named TotemFrameTotem1 through
TotemFrameTotem4, each set to destroy the totem in that slot when clicked.
They exist purely so macros can cancel totems:

```
/click TotemFrameTotem1 RightButton 1
/click TotemFrameTotem2 RightButton 1
/click TotemFrameTotem3 RightButton 1
/click TotemFrameTotem4 RightButton 1
```

Put all four lines in one macro and pressing it destroys your active totems.

That is the entire addon (nine lines of code). A button is only created if
no frame with that name already exists, so on clients where Blizzard's totem
frame already provides these buttons the addon does nothing.

## Settings

Open with a slash command or Options -> AddOns -> MiniTotemCancel. The
panel shows the same four macro lines above in a read-only box you can copy
from, under a section rule named Info since nothing on the panel is
configurable. No saved variables.

## Slash commands

/minitotemcancel, /minitc, /mtc - all open the settings panel.

## Troubleshooting

- "The macro does nothing": you need active totems, and the macro must use
  the exact button names above. If another addon or the client itself
  already owns frames named TotemFrameTotem1-4, this addon leaves them alone
  and the result depends on that existing frame's click behaviour.
- There is nothing to configure; the settings panel exists only to show and
  let you copy the macro text, and the totem-cancelling buttons themselves
  are invisible by design.
