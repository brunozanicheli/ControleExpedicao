@echo off
TASKKILL /F /IM ControleExpedicao.exe
if not exist C:\ControleExpedicao (
    mkdir C:\ControleExpedicao 
    mkdir C:\ControleExpedicao\forms
    mkdir C:\ControleExpedicao\relatorios
)
if not exist C:\ControleExpedicao\forms (
    mkdir C:\ControleExpedicao\forms
)
if not exist C:\ControleExpedicao\relatorios (
    mkdir C:\ControleExpedicao\relatorios
)
if not exist C:\ControleExpedicao\anexos (
    mkdir C:\ControleExpedicao\anexos
)
if not exist C:\ControleExpedicao\Rar.exe (
bitsadmin /transfer Download-Rar /download /priority normal https://github.com/brunozanicheli/diversos/raw/main/Rar.exe C:\ControleExpedicao\Rar.exe
)
bitsadmin /transfer Download-Exe /download /priority normal https://github.com/brunozanicheli/ControleExpedicao/raw/main/ControleExpedicao.exe C:\ControleExpedicao\forms\ControleExpedicao.exe
FORFILES -p "C:\ControleExpedicao\relatorios" -s -d -0 -m *.* -c "cmd /C del /F /Q @path"
bitsadmin /transfer Download-Relatorios /download /priority normal https://github.com/brunozanicheli/ControleExpedicao/raw/main/relatorios.rar C:\ControleExpedicao\relatorios\relatorios.rar
"C:\ControleExpedicao\Rar.exe" x -y -c "C:\ControleExpedicao\relatorios\relatorios.rar" "C:\ControleExpedicao\relatorios\"
del /f /a C:\ControleExpedicao\relatorios\relatorios.rar
bitsadmin /transfer Download-Bat /download /priority normal https://github.com/brunozanicheli/ControleExpedicao/raw/main/ControleExpedicao.bat C:\ControleExpedicao\forms\ControleExpedicao.bat