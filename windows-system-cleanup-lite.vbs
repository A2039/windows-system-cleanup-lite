Set objShell = CreateObject("Wscript.Shell")
' Get the folder where this VBScript is located
strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(strPath)
strFolder = objFSO.GetParentFolderName(objFile) 

' Construct the path to the PowerShell script
strPS1 = strFolder & "\windows-system-cleanup-lite.ps1"

' Run the PowerShell script hidden (0 means hidden window)
objShell.Run "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & strPS1 & """", 0, False
