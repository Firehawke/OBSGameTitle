; Start by giving us our GUI.
Gui, New, -Caption -Resize -MaximizeBox -MinimizeBox
Gui, Font, s12, MS Sans Serif
Gui, Font, s12, Arial
Gui, Font, s12, Verdana  ; Set 10-point Verdana.

; Let's open the text file for editing..
FileRead, Buffer, C:\StreamTools\GameInfo.txt

; Add the text box
Gui, Add, Edit, r5 w700 vBuffer
GuiControl,, Buffer, %Buffer%
Gui, Add, Button, w100 default gSave, Save
Gui, Add, Button, w100 gCancel x+20, Cancel

; Now show us the GUI.
Gui, Show
Return

Save:
GuiControlGet, Buffer ; This updates the variable with what's in the text field. Very important!
OutFile := FileOpen("c:\StreamTools\Gameinfo.txt", "w")
if !IsObject(OutFile)
{
    MsgBox Can't open c:\StreamTools\Gameinfo.txt for writing..!
    ExitApp
}
OutFile.Write(Buffer)

Cancel:
ExitApp