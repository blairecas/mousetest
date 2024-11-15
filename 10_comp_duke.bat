@echo off

echo.
echo ===========================================================================
echo Picture
echo ===========================================================================
php -f graphics\convert_img.php duke.png
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling DUKE
echo ===========================================================================
php -f ..\scripts\preprocess.php duke.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 64 -yus -m ..\scripts\sysmac.sml -l _duke.lst _duke.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ..\scripts\lst2bin.php _duke.lst ./release/duke.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Write to .dsk
echo ===========================================================================
..\scripts\rt11dsk.exe d moutst.dsk duke.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\duke.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk duke.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\duke.sav >NUL

del _duke.mac
del _duke.lst

echo.