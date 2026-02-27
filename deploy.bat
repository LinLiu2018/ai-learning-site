@echo off
chcp 65001 >nul
echo ============================================================
echo AI 学习网站 - 一键部署到 Vercel
echo ============================================================
echo.

REM 检查 Node.js
echo [1/4] 检查 Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js 未安装
    echo.
    echo 请先安装 Node.js:
    echo 1. 访问 https://nodejs.org/
    echo 2. 下载并安装 LTS 版本
    echo 3. 重新运行此脚本
    pause
    exit /b 1
)
echo [OK] Node.js 已安装
echo.

REM 检查 Vercel CLI
echo [2/4] 检查 Vercel CLI...
vercel --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] 正在安装 Vercel CLI...
    npm install -g vercel
    if %errorlevel% neq 0 (
        echo [ERROR] 安装失败
        pause
        exit /b 1
    )
    echo [OK] Vercel CLI 安装完成
) else (
    echo [OK] Vercel CLI 已安装
)
echo.

REM 登录 Vercel
echo [3/4] 登录 Vercel...
echo.
echo 请在打开的浏览器中用 GitHub 账号登录
echo.
vercel login
if %errorlevel% neq 0 (
    echo [ERROR] 登录失败
    pause
    exit /b 1
)
echo [OK] 登录成功
echo.

REM 部署
echo [4/4] 部署到 Vercel...
echo.
vercel --prod
if %errorlevel% neq 0 (
    echo.
    echo ============================================================
    echo 部署失败，请检查错误信息
    echo ============================================================
    pause
    exit /b 1
)

echo.
echo ============================================================
echo 🎉 部署成功!
echo ============================================================
echo.
echo 访问你的网站:
echo   https://ai-learning-site.vercel.app
echo.
echo 查看部署详情:
echo   https://vercel.com/dashboard
echo.
pause
