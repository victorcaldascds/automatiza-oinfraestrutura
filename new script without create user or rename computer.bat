@echo off
echo ========================================================================
echo Vamos iniciar o processo de instalacao em lote, fique atento a todas as solicitacoes!
echo ========================================================================
echo ================================
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type"
:: Section 2: Hardware information.
echo ===============================
echo Informacoes de Hardware
echo ===============================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
:: Section 3: Networking information.
ECHO ============================
ECHO Informacoes de REDE
ECHO ============================
ipconfig | findstr IPv4
PAUSE

cls
:: Instalacao CHOCO :
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo Chocolatey Instalado com Sucesso! Pressione qualquer tecla para continuar!

choco install anydesk.install -y
choco install googlechrome -y
choco install slack -y
choco install dopdf -y
choco install lightshot -y

echo Instalacao concluida, agora vamos para a parte da pergunta de qual notebook estamos formando.
pause

cls
:menu
cls
echo Usuario Logado: %username%  Computador:%computername%
date /t

echo O Notebook que esta sendo formatado eh Dell ou Lenovo? Se for Dell, digite dell e se for Lenovo, digite lenovo.
echo ________________________________________
set /p notebook= dell ou lenovo:
echo ________________________________________
if %notebook% equ dell goto notebook1
if %notebook% equ lenovo goto notebook2

:notebook1
cls
bitsadmin /transfer DellSupport /priority normal https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe "C:\Users\%username%\Downloads\SupportAssistInstaller.exe"
PAUSE
echo Aperte para instalar
start C:\Users\"%username%"\Downloads\SupportAssistInstaller.exe
PAUSE
echo Ja finalizamos as instalacoes, seria interessante reiniciar a maquina e executar o windows update!!!
pause
exit
:notebook2
echo Se escolheu lenovo, ja finalizamos as instalacoes, seria interessante reiniciar a maquina e executar o windows update!!!

:: Instalador configurado pelo Estagiário Victor Caldas dos Santos ::
pause
exit



