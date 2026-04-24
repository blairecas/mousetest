@echo off

echo.
echo ===========================================================================
echo Compiling %NAME%
echo ===========================================================================
php -f ..\scripts\preprocess.php %NAME%.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11.exe -ysl 64 -yus -m ..\scripts\sysmac.sml -l _%NAME%.lst _%NAME%.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ..\scripts\lst2bin.php _%NAME%.lst ./release/%NAME%.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Write to .dsk
echo ===========================================================================
..\scripts\rt11dsk.exe d .\release\moutst.dsk %NAME%.sav >NUL
..\scripts\rt11dsk.exe a .\release\moutst.dsk .\release\%NAME%.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk %NAME%.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\%NAME%.sav >NUL

del _%NAME%.mac
rem del _%NAME%.lst

echo.