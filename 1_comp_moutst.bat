@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php moutst.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _moutst.lst _moutst.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _moutst.lst ./release/moutst.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk moutst.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\moutst.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk moutst.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\moutst.sav >NUL

del _moutst.mac
del _moutst.lst

echo.