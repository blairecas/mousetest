@echo off
echo.
echo ===========================================================================
echo Compiling PPU.MAC
echo ===========================================================================
php -f ..\scripts\preprocess.php sstintro_ppu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _sstintro_ppu.lst _sstintro_ppu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Creating PPU data block
echo ===========================================================================
php -f ..\scripts\lst2bin.php _sstintro_ppu.lst sstintro_cpu_ppu.mac mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling CPU.MAC
echo ===========================================================================
php -f ..\scripts\preprocess.php sstintro_cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11.exe -ysl 32 -yus -m ..\scripts\sysmac.sml -l _sstintro_cpu.lst _sstintro_cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking and cleanup
echo ===========================================================================
php -f ..\scripts\lst2bin.php _sstintro_cpu.lst ./release/sstint.sav sav
if %ERRORLEVEL% NEQ 0 ( exit /b )

..\scripts\rt11dsk.exe d moutst.dsk sstint.sav >NUL
..\scripts\rt11dsk.exe a moutst.dsk .\release\sstint.sav >NUL

..\scripts\rt11dsk.exe d ..\..\03_dsk\hdd.dsk sstint.sav >NUL
..\scripts\rt11dsk.exe a ..\..\03_dsk\hdd.dsk .\release\sstint.sav >NUL

del _sstintro_cpu.mac
del _sstintro_cpu.lst
del _sstintro_ppu.mac
del _sstintro_ppu.lst

echo.