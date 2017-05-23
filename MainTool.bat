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

:accsettings
cls
title Password Tool v2
echo -view Passwords
echo -change account data
echo -add new password
echo.
set /p acc=
if %acc%==view goto viewpw 
if %acc%==change goto changeacc
if %acc%==add goto addnew

:changeacc
cls

:addnew
cls
(
echo "type username here"
echo "type password here"
echo Save this in the programs directory!
)>%tmp%\addnewpassword.txt
call %tmp%\addnewpassword.txt
del %tmp%\addnewpassword.txt
::ask for new file
echo Type the new filename:
set /p filename=
(
set /p userme=
set /p pswd=
)<%filename%.txt
color a
:mainmenu
set savefile=on
::set Encrypt=Nothing
(set CHAR[a]=UDFM45) & (set CHAR[b]=H21DGF) & (set CHAR[c]=FDH56D) & (set CHAR[d]=FGS546) & (set CHAR[e]=JUK4JH)
(set CHAR[f]=ERG54S) & (set CHAR[g]=T5H4FD) & (set CHAR[h]=RG641G) & (set CHAR[i]=RG4F4D) & (set CHAR[j]=RT56F6)
(set CHAR[k]=VCBC3B) & (set CHAR[l]=F8G9GF) & (set CHAR[m]=FD4CJS) & (set CHAR[n]=G423FG) & (set CHAR[o]=F45GC2)
(set CHAR[p]=TH5DF5) & (set CHAR[q]=CV4F6R) & (set CHAR[r]=XF64TS) & (set CHAR[s]=X78DGT) & (set CHAR[t]=TH74SJ)
(set CHAR[u]=BCX6DF) & (set CHAR[v]=FG65SD) & (set CHAR[w]=4KL45D) & (set CHAR[x]=GFH3F2) & (set CHAR[y]=GH56GF)
(set CHAR[z]=45T1FG) & (set CHAR[1]=D4G23D) & (set CHAR[2]=GB56FG) & (set CHAR[3]=SF45GF) & (set CHAR[4]=P4FF12)
(set CHAR[5]=F6DFG1) & (set CHAR[6]=56FG4G) & (set CHAR[7]=USGFDG) & (set CHAR[8]=FKHFDG) & (set CHAR[9]=IFGJH6)
(set CHAR[0]=87H8G7) & (set CHAR[@]=G25GHF) & (set CHAR[#]=45FGFH) & (set CHAR[$]=75FG45) & (set CHAR[*]=54GDH5)
(set CHAR[(]=45F465) & (set CHAR[.]=HG56FG) & (set CHAR[,]=DF56H4) & (set CHAR[-]=F5JHFH) & (set CHAR[ ]=SGF4HF)
(set CHAR[\]=45GH45) & (set CHAR[/]=56H45G)
cls
set Encrypt2=%pswd%
set "EncryptOut="
:encrypt2
set char=%Encrypt2:~0,1%
set Encrypt2=%Encrypt2:~1%
set EncryptOut=%EncryptOut%!CHAR[%char%]!
if not "%Encrypt2%"=="" goto encrypt2
set string=%EncryptOut%
set temp_str=%string%
set str_len=0
:lengthloop
if defined temp_str (
set temp_str=%temp_str:~1%
set /A str_len += 1
goto lengthloop )
echo.

if "%savefile%"=="on" echo.%EncryptOut%>>%~d0%~p0encrypted.txt
echo.
pause

