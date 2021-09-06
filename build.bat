@ECHO OFF
:MAKE
dj 
@make all
pause
cls
IF EXIST bin\main.exe GOTO END
GOTO MAKE

:end