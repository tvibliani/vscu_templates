@echo off

SET VS_VERSION=2017

SET pwd=%~dp0
SET libDestination=%pwd%CUDA_10.0_Library_example.zip
SET appDestination=%pwd%CUDA_10.0_Application_example.zip

FOR /F "tokens=3" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET docsdir=%%G)
echo "MyDocuments: %docsdir%"

SET install_dir=%docsdir%\Visual Studio %VS_VERSION%\Templates\ProjectTemplates
SET source_dir=%docsdir%\Visual Studio %VS_VERSION%\My Exported Templates
echo "Source  Directory: %source_dir%"
echo "Install Directory: %install_dir%"

if exist "%libDestination%" del "%libDestination%"
powershell Compress-Archive -Path %pwd%CUDA_10.0_Library_example/* -Destination "%libDestination%"

if exist "%appDestination%" del "%appDestination%"
powershell Compress-Archive -Path %pwd%CUDA_10.0_Application_example/* -Destination "%appDestination%"

robocopy "%pwd% "  "%install_dir%"  "*.zip" /V
robocopy "%pwd% "  "%source_dir%"  "*.zip" /V /MOV
