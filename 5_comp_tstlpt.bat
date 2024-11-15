@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php tstlpt.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _tstlpt.lst _tstlpt.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _tstlpt.lst ./release/tstlpt.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk tstlpt.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\tstlpt.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk tstlpt.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\tstlpt.sav >NUL

del _tstlpt.mac
del _tstlpt.lst

echo.