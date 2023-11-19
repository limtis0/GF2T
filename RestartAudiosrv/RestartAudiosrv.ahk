; Run script as administrator
If !A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

^j::
Run, %comspec% /c net stop audiosrv && net start audiosrv,, Hide
return
