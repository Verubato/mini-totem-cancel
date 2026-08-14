# MiniTotemCancel - bot reference

Version 1.0.5. Interface versions: 120100, 50504, 40402, 38002, 38000,
30405, 30300, 20506, 11509 (retail plus the classic client lines). No
settings, no saved variables, no slash commands.

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

## Troubleshooting

- "The macro does nothing": you need active totems, and the macro must use
  the exact button names above. If another addon or the client itself
  already owns frames named TotemFrameTotem1-4, this addon leaves them alone
  and the result depends on that existing frame's click behaviour.
- There is nothing to configure and no UI; the buttons are invisible by
  design.
