@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\preprocess.php mouse.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\..\macro11\macro11.exe -ysl 32 -yus -m ..\..\macro11\sysmac.sml -l _mouse.lst _mouse.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\lst2bin.php _mouse.lst ./release/mouse.sav sav
..\..\macro11\rt11dsk.exe d moutst.dsk .\release\mouse.sav >NUL
..\..\macro11\rt11dsk.exe a moutst.dsk .\release\mouse.sav >NUL

echo.