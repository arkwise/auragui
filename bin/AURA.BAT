echo off
echo loading Aura gui..

hdpmi32.exe

REM cwsdpmi.exe
ne2000 0x60
doslfn
ctmouse
main.exe

