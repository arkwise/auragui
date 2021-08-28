@ECHO OFF
:MAKE 
del buildlog.txt
@make all > buildlog.txt 2>&1
ECHO Build was logged
Echo Check Buildlog.txt
pause
cls
GOTO MAKE