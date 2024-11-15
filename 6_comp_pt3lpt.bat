@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php pt3lpt.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 64 -yus -m ..\scripts\sysmac.sml -l _pt3lpt.lst _pt3lpt.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _pt3lpt.lst ./release/pt3lpt.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk pt3lpt.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\pt3lpt.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk pt3lpt.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\pt3lpt.sav >NUL

del _pt3lpt.mac
del _pt3lpt.lst

echo.