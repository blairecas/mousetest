@echo off

echo.
echo ===========================================================================
echo Picture
echo ===========================================================================
php -f graphics\convert_img.php duke.png
if %ERRORLEVEL% NEQ 0 ( exit /b )

set NAME=duke
1_comp.bat