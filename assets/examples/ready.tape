Output ready.mp4
Require sleep

Set Shell bash
Set Width 880
Set Height 400
Set FontSize 20
Set Padding 20
Set TypingSpeed 20ms

# Splitting the marker keeps the echoed command from matching it.
Type "sleep 1 && printf '%s%s\n' 'BUILD_' 'READY'"
Enter
Wait+Screen@5s /BUILD_READY/
Sleep 500ms
Screenshot ready.png
Sleep 1s
