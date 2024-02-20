@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\preprocess.php pt3lpt.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\..\macro11\macro11.exe -ysl 64 -yus -m ..\..\macro11\sysmac.sml -l _pt3lpt.lst _pt3lpt.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\lst2bin.php _pt3lpt.lst ./release/pt3lpt.sav sav
..\..\macro11\rt11dsk.exe d moutst.dsk .\release\pt3lpt.sav >NUL
..\..\macro11\rt11dsk.exe a moutst.dsk .\release\pt3lpt.sav >NUL

echo.