@echo off
setlocal enableextensions enabledelayedexpansion
title Password Saving Tool
if exist appdata.dll goto login
if not exist appdata.dll goto register

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
echo %random%>data.dll
title Create new Account
echo Enter your Username:
set /p usernam= 
echo Enter a Usercode:
set /p decode=
echo Enter a Password:
set /p codenew=


:accsettings
cls
title Password Tool v2
echo -(v)iew Passwords
echo -(c)hange account data
echo -(a)dd new password
echo.
set /p acc=
if %acc%==v goto viewpw 
if %acc%==c goto changeacc
if %acc%==a goto addnew

:changeacc
cls

:addnew
cls
(
echo "type username here"
echo "type password here"
echo Save this in the programs directory!
)<%tmp%\addnewpassword.txt
call %tmp%\addnewpassword.txt
del %tmp%\addnewpassword.txt
::ask for new file
echo Type the new filename:
set /p filename=
(
set /p userme=
set /p pswd=
)<%filename%.txt
