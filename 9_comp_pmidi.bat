@echo off

echo.
echo ===========================================================================
echo Compiling PMIDI
echo ===========================================================================
php -f ..\scripts\preprocess.php pmidi.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11.exe -ysl 64 -yus -m ..\scripts\sysmac.sml -l _pmidi.lst _pmidi.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ..\scripts\lst2bin.php _pmidi.lst ./release/pmidi.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Write to .dsk
echo ===========================================================================
..\scripts\rt11dsk.exe d moutst.dsk pmidi.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\pmidi.sav >NUL

echo.