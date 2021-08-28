@ECHO OFF
:MAKE 
@make all
pause
cls
IF EXIST bin\main.exe GOTO END
GOTO MAKE

:end