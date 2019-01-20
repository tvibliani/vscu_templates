@echo off

SET pwd=%~dp0
SET libDestination=%pwd%CUDA_10.0_Library_example.zip
SET appDestination=%pwd%CUDA_10.0_Application_example.zip

if exist "%libDestination%" del "%libDestination%"
powershell Compress-Archive -Path %pwd%CUDA_10.0_Library_example/* -Destination "%libDestination%"

if exist "%appDestination%" del "%appDestination%"
powershell Compress-Archive -Path %pwd%CUDA_10.0_Application_example/* -Destination "%appDestination%"
