@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php ppsg.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _ppsg.lst _ppsg.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _ppsg.lst ./release/ppsg.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk ppsg.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\ppsg.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk ppsg.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\ppsg.sav >NUL

del _ppsg.mac
del _ppsg.lst

echo.