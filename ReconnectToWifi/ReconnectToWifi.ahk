#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance Force

RunCmd(command) {
	return ComObjCreate("WScript.Shell").Exec("cmd.exe /c" . command).StdOut.ReadAll()
}

!h::

interfaces := RunCmd("netsh wlan show interfaces")

RegExMatch(interfaces, "Name +: (?![!#; ])([ !#%-*,->@-Z^-~]{1,31}[^ ])\n", interface) ; Saves interface name to interface1
RegExMatch(interfaces, "[^B]?SSID +: (?![!#; ])([ !#%-*,->@-Z^-~]{1,31}[^ ])\n", SSID) ; Saves wifi name to SSID1

StringReplace, interface1, interface1, `n,  , All
StringReplace, SSID1, SSID1, `n,  , All

RunCmd("netsh wlan disconnect interface=""" . interface1 . """")
RunCmd("netsh wlan connect name=""" . SSID1 . """ interface=""" . interface1 . """")

return
