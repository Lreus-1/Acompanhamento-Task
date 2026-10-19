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

echo.
echo ==============================
echo   CRIANDO COMMIT
echo ==============================
echo.

git commit -m "%commitMsg%"

if errorlevel 1 (
    echo.
    echo [AVISO] Nenhum commit foi criado ou ocorreu um erro.
    echo.
)

echo.
echo ==============================
echo   ENVIANDO PARA O GITHUB
echo ==============================
echo.

git push origin main --force

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao enviar para o GitHub.
    echo.
    pause
    exit /b 1
)

echo.
echo ==============================
echo   PROCESSO CONCLUIDO!
echo ==============================
echo.
echo O GitHub foi atualizado com a versao local.
echo.
pause