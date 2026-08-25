@echo off
chcp 65001 >nul
title Atualizar Git
cd /d "%~dp0"

echo ==============================
echo   ATUALIZAR REPOSITORIO GIT
echo ==============================
echo.

git add .

echo.
set /p commitMsg="Digite a mensagem do commit: "

if "%commitMsg%"=="" (
    echo.
    echo [ERRO] Mensagem vazia. Operacao cancelada.
    pause
    exit /b 1
)

git commit -m "%commitMsg%"
git push

echo.
echo ==============================
echo   PROCESSO CONCLUIDO!
echo ==============================
pause
