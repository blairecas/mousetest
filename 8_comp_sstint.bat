@echo off
echo.
echo ===========================================================================
echo Compiling PPU.MAC
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\preprocess.php sstintro_ppu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\..\macro11\macro11.exe -ysl 32 -yus -m ..\..\macro11\sysmac.sml -l _sstintro_ppu.lst _sstintro_ppu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Creating PPU data block
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\lst2bin.php _sstintro_ppu.lst sstintro_cpu_ppu.mac mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling CPU.MAC
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\preprocess.php sstintro_cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\..\macro11\macro11.exe -ysl 32 -yus -m ..\..\macro11\sysmac.sml -l _sstintro_cpu.lst _sstintro_cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking and cleanup
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\lst2bin.php _sstintro_cpu.lst ./release/sstint.sav sav
..\..\macro11\rt11dsk.exe d moutst.dsk .\release\sstint.sav >NUL
..\..\macro11\rt11dsk.exe a moutst.dsk .\release\sstint.sav >NUL

echo.