@echo off
title Compling PassGen
echo|set /p="Cleanup? [Y/N] "
choice /c:NY > nul
if errorlevel 2 goto cleanup
goto compile 
:cleanup
del *.dof 2> nul
del *.dcu 2> nul
del *.cfg 2> nul
del *.~??? 2> nul
del *.ddp 2> nul
echo.
echo|set /p="Cleanup Done."
:compile
echo.
echo|set /p="Compiling project..."
brcc32 uac.rc > nul
dcc32.exe PassGen.dpr > nul
echo|set /p="Done."
echo.
echo|set /p="Hit any key..."
pause > nul