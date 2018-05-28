@echo off
title Creator
echo Type any Phrase
set /p phrase=
(
echo %phrase%
)<new.txt
certutil -encodehex new.txt enc_new.txt
certutil -encode enc_new.txt enc64_new.txt
call enc64_new.txt
pause
