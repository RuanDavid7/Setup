@echo off
setlocal enabledelayedexpansion

REM Obter um número aleatório de 4 dígitos
set "random_number="
for /l %%i in (1,1,4) do (
    set /a "digit=!random! %% 10"
    set "random_number=!random_number!!digit!"
)

REM Definir o diretório temporário
set "temp_dir=%TEMP%\setup%random_number%"

REM Criar o diretório temporário se não existir
if not exist "!temp_dir!" mkdir "!temp_dir!"

REM Baixar os arquivos
echo Baixando Setup.exe...
curl -o "!temp_dir!\Setup.exe" -L "https://github.com/RuanDavid7/Setup/raw/main/Setup.exe"
echo Baixando install.ini...
curl -o "!temp_dir!\install.ini" -L "https://github.com/RuanDavid7/Setup/raw/main/Toolbox/install.ini"

echo Arquivos baixados com sucesso em: !temp_dir!

REM Copiar install.ini para o mesmo diretório do Setup.exe
copy /y "!temp_dir!\install.ini" "!temp_dir!"

REM Alterar para o diretório temporário antes de executar o Setup.exe
cd /d "!temp_dir!"
echo Executando Setup.exe...
start "" "Setup.exe"

exit
