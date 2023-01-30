; Redesigned on 1/29/2023 to run on AHK 2.x
; Improved error handling as well.

; Start by giving us our GUI.
ThisGui := Gui("-Caption -Resize -MaximizeBox -MinimizeBox")
ThisGui.SetFont("s12", "MS Sans Serif")
ThisGui.SetFont("s12", "Arial")
ThisGui.SetFont("s12", "Verdana")  ; These font choices in ascending order of availability.

; Add the text box
TextBox := ThisGui.Add("Edit","r5 vBuffer -wrap w700")

Try
{
	; Let's open the text file for editing..
	OutFile := FileOpen("C:\StreamTools\GameInfo.txt","r")
	
	if IsObject(OutFile)
	{
		; We have an existing file, so let's read from it and then fill the textbox with it.
		TextBox.Text := TextBuffer := OutFile.Read()
		OutFile.Close()
	}
}

ThisGui.Add("Button", "w100 default", "Save").OnEvent("Click", DoSave)
ThisGui.Add("Button", "w100 x+20", "Cancel").OnEvent("Click", DoExit)

; Now show us the GUI.
ThisGui.Show()
Return

DoSave(*) {
	OutFile := FileOpen("C:\StreamTools\GameInfo.txt","w")
	if !IsObject(OutFile)
	{
		MsgBox("Can't open c:\StreamTools\GameInfo.txt for writing..!")
		ExitApp
	}

	OutFile.Write(TextBox.Text)
	OutFile.Close()
	ExitApp
}

DoExit(*) {
	ExitApp
}
