@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php moutst.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\..\macro11\macro11.exe -ysl 32 -yus -m ..\..\macro11\sysmac.sml -l _moutst.lst _moutst.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _moutst.lst ./release/moutst.sav sav
..\scripts\rt11dsk.exe d moutst.dsk .\release\moutst.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\moutst.sav >NUL

echo.