@echo off
echo.
echo ===========================================================================
echo Compiling PPU.MAC
echo ===========================================================================
php -f ..\scripts\preprocess.php covox_ppu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _covox_ppu.lst _covox_ppu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Creating PPU data block
echo ===========================================================================
php -f ..\scripts\lst2bin.php _covox_ppu.lst covox_cpu_ppu.mac mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling CPU.MAC
echo ===========================================================================
php -f ..\scripts\preprocess.php covox_cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _covox_cpu.lst _covox_cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking and cleanup
echo ===========================================================================
php -f ..\scripts\lst2bin.php _covox_cpu.lst ./release/covox.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk covox.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\covox.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk covox.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\covox.sav >NUL

del _covox_cpu.mac
del _covox_cpu.lst
del _covox_ppu.mac
del _covox_ppu.lst

echo.