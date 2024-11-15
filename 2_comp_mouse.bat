@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php mouse.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _mouse.lst _mouse.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _mouse.lst ./release/mouse.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk mouse.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\mouse.sav >NUL

del _mouse.mac
del _mouse.lst

echo.