@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ..\scripts\preprocess.php ppt3.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 64 -yus -m ..\scripts\sysmac.sml -l _ppt3.lst _ppt3.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
php -f ..\scripts\lst2bin.php _ppt3.lst ./release/ppt3.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk ppt3.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\ppt3.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk ppt3.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\ppt3.sav >NUL

del _ppt3.mac
rem del _ppt3.lst

@run_ukncbtl.bat
echo.