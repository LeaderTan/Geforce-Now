@ECHO OFF
COLOR 0c
TITLE WinShell Recovery script for GFN - by EricPlayZ
GOTO RecoverWinShell

:RecoverWinShell
ECHO Setting regkey for shell explorer
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d explorer.exe /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Windows\system32\userinit.exe," /f
ECHO Restoring default file explorer to explorer.exe
takeown /f c:\windows\explorer.exe
takeown /f c:\windows\SysWOW64\explorer.exe
del /q c:\windows\explorer.exe
del /q c:\windows\SysWOW64\explorer.exe
copy /Y c:\asgard\IETemp\32\explorer.exe c:\windows\SysWOW64\explorer.exe
copy /Y c:\asgard\IETemp\64\explorer.exe c:\windows\explorer.exe
Icacls c:\windows\explorer.exe /grant xen:RX
Icacls c:\windows\SysWOW64\explorer.exe /grant xen:RX
ECHO Restoring default openwith to openwith.exe
takeown /f c:\windows\system32\openwith.exe
takeown /f c:\windows\SysWOW64\openwith.exe
del /q c:\windows\system32\openwith.exe
del /q c:\windows\SysWOW64\openwith.exe
copy /Y c:\asgard\IETemp\32\openwith.exe c:\windows\SysWOW64\openwith.exe
copy /Y c:\asgard\IETemp\64\openwith.exe c:\windows\system32\openwith.exe
Icacls c:\windows\system32\openwith.exe /grant xen:RX
Icacls c:\windows\SysWOW64\openwith.exe /grant xen:RX
ECHO Killing GFNDesktop process
TASKKILL /F /IM gfndesktop*
ECHO Relaxing perm for kiosk user
icacls c:\asgard\tools\gfndesktop /grant kiosk:F /T
ECHO Launching Windows shell...
userinit
ECHO Done!
PAUSE