#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; saved variables for mouse positions

xAwakePosition = null
yAwakePosition = null
xUnawakePosition = null
yUnawakePosition = null
xItem = null
yItem = null

; Select Awakening Scroll

PgUp::

MouseGetPos, xpos, ypos 

xAwakePosition = %xpos%
yAwakePosition = %ypos%

Return

; Select Unawakening Scroll

PgDn::

MouseGetPos, xpos, ypos 

xUnawakePosition = %xpos%
yUnawakePosition = %ypos%

Return

Home::

MouseGetPos, xpos, ypos
xItem = %xpos%
yItem = %ypos%

Return

; Awake item

Insert::
SendEvent {Click, %xAwakePosition%, %yAwakePosition%}
SendEvent {Click, %xAwakePosition%, %yAwakePosition%}
Sleep, 0.2
SendEvent {Click, %xItem%, %yItem%}
SendEvent {Click, %xItem%, %yItem%}
MouseMove, %xAwakePosition%, %yAwakePosition%
Sleep, 50
MouseMove, %xItem%, %yItem%


Return

; Unawake item

Delete::
SendEvent {Click, %xUnawakePosition%, %yUnawakePosition%}
SendEvent {Click, %xUnawakePosition%, %yUnawakePosition%}
Sleep, 0.2
SendEvent {Click, %xItem%, %yItem%}
SendEvent {Click, %xItem%, %yItem%}
MouseMove, %xUnawakePosition%, %yUnawakePosition%
Sleep, 50
MouseMove, %xItem%, %yItem%

Return

; Closes script

End::
ExitApp
Return