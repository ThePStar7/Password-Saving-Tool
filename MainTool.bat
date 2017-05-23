@echo off
setlocal enableextensions enabledelayedexpansion
title Password Saving Tool
if exist data.dll goto login
if not exist data.dll goto register

:login
cls
title Password Saving Tool-Login
echo Enter your Username:
set /p usernme=
echo Enter your Usercode:
set /p ipcde=
echo Enter your Password:
set /p code=
(
set /p codec=
)<%ipcde%.pwd
set chars=0123456789abcdefghijklmnopqrstuvwxyz
for /L %%N in (10 1 36) do (
for /F %%C in ("!chars:~%%N,1!") do (
set /a MATH=%%N*!ipcde!

for /F %%F in ("!MATH!") do (
set "codec=!codec:%%F=-%%C!
)
)
)

for /f %%F in ("!MATH!") do (
set "codec=!codec:-=!"
)
echo !code!
echo !codec!
pause
)
if !code!==!codec! goto accsettings
if not !code!==!codec! (
echo Wrong password!
pause
goto login
)

:register
cls
::creating appdata here
echo %random%>appdata.dll
title Create nem 
echo Enter your Username:
set /p usernam= 
echo Enter a Usercode:
set /p decode=
echo Enter a Password:
set /p codenew=
set chars=0123456789abcdefghijklmnopqrstuvwxyz

for /L %%N in (10 1 36) do (
for /F %%C in ("!chars:~%%N,1!") do (

set /a MATH=%%N*%decode%

for /F %%F in ("!MATH!") do (
set "code=!code:%%C=-%%F!"
)

)
)
echo !codenew!> !decode!.pwd
echo Account created!
pause
exit
