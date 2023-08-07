; Overhaul on 6/12/2023 to split GameInfo into two files.
; Redesigned on 1/29/2023 to run on AHK 2.x
; Improved error handling as well.

; Start by giving us our GUI.
ThisGui := Gui("-Caption -Resize -MaximizeBox -MinimizeBox")
ThisGui.SetFont("s12", "MS Sans Serif")
ThisGui.SetFont("s12", "Arial")
ThisGui.SetFont("s12", "Verdana")  ; These font choices in ascending order of availability.

; First the Game Title...
GameBox := ThisGui.Add("Edit","r1 vGameBuffer -wrap w700")

Try
{
	; Let's open the desc file for editing..
	TitleFile := FileOpen("GameTitleText.txt","r")
	
	if IsObject(TitleFile)
	{
		; We have an existing file, so let's read from it and then fill the GameBox with it.
		GameBox.Text := TextBuffer := TitleFile.Read()
		TitleFile.Close()
	}
}
If GameBox.Text == ""
    GameBox.Text := "Game Title Here"

DescBox := ThisGui.Add("Edit","r5 vDescBuffer -wrap w700")
Try
{
	; Let's open the desc file for editing..
	DescFile := FileOpen("GameInfoText.txt","r")
	
	if IsObject(DescFile)
	{
		; We have an existing file, so let's read from it and then fill the DescBox with it.
		DescBox.Text := TextBuffer := DescFile.Read()
		DescFile.Close()
	}
}
If DescBox.Text == ""
    DescBox.Text := "Stream Description Here meow meow"

ThisGui.Add("Button", "w90 default", "Save").OnEvent("Click", DoHistorySave)
ThisGui.Add("Button", "w90 x+5", "Cancel").OnEvent("Click", DoExit)
ThisGui.Add("Button", "w160 x+5", "Save / no history").OnEvent("Click", DoSave)
ThisGui.Add("Button", "w140 x+5", "Clear history").OnEvent("Click", DoHistoryClear)
ThisGui.Add("Button", "w180 x+5", "Clipboard History").OnEvent("Click", DoHistoryCopy)
; Now show us the GUI.
ThisGui.Show()
Return

DoHistorySave(*) {
    HistoryFile := FileOpen("GameHistory.txt","a")
	if !IsObject(HistoryFile)
        {
            MsgBox("Can't open GameHistory.txt for writing..!")
            ExitApp
        }
    HistoryFile.Write(GameBox.Text . ", ")
    HistoryFile.Close()
    DoSave()
}

DoHistoryCopy(*) {
    Try {
        A_Clipboard := FileRead("GameHistory.txt")
    }
    catch as e
    {
        MsgBox("Couldn't copy GameHistory.txt to clipboard..!")
        ExitApp
    }
}

DoHistoryClear(*) {
    HistoryFile := FileOpen("GameHistory.txt","w")
	if !IsObject(HistoryFile)
        {
            MsgBox("Can't open GameHistory.txt for writing..!")
            ExitApp
        }
    HistoryFile.Close()
}

DoSave(*) {
	GameFile := FileOpen("GameTitleText.txt","w")
	if !IsObject(GameFile)
	{
		MsgBox("Can't open GameTitleText.txt for writing..!")
		ExitApp
	}

	DescFile := FileOpen("GameInfoText.txt","w")
	if !IsObject(DescFile)
	{
		MsgBox("Can't open GameInfoText.txt for writing..!")
		ExitApp
	}

    OverallFile := FileOpen("GameInfo.txt","w")
	if !IsObject(OverallFile)
	{
		MsgBox("Can't open GameInfo.txt for writing..!")
		ExitApp
	}

    GameFile.Write(GameBox.Text)
	DescFile.Write(DescBox.Text)
    OverallFile.Write(GameBox.Text)
    OverallFile.Write("`n`n")
	OverallFile.Write(DescBox.Text)
	GameFile.Close()
    DescFile.Close()
    OverallFile.Close()

    ExitApp
}

DoExit(*) {
	ExitApp
}
