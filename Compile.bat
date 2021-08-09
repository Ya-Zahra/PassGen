@echo off
echo Cleanup?
choice /c:NY > nul
if errorlevel 2 goto cleanup
goto compile 
:cleanup
del *.dof 2> nul
del *.dcu 2> nul
del *.cfg 2> nul
del *.~??? 2> nul
del *.ddp 2> nul
echo Cleanup Done. 
:compile
echo Compiling project...
dcc32.exe PassGen.dpr > nul
echo Compile Done.
pause