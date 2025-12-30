@echo off
chcp 65001 >nul
title 以太坊区块链浏览器 - 修复版启动器
echo ========================================
echo       以太坊区块链浏览器启动工具
echo ========================================
echo.

echo [1/3] 检查环境...
echo Node.js版本： 
node --version
echo.
echo 当前目录：%cd%
echo.

echo [2/3] 检查文件...
if not exist "index.html" (
    echo 错误：未找到 index.html
    dir *.html
    pause
    exit /b 1
)
echo ✓ 找到 index.html
echo.

echo [3/3] 启动HTTP服务器...
echo 注意：首次运行可能需要下载http-server，请等待...
echo 如果卡住，按回车键继续
echo.
echo 尝试端口：8080（如果被占用会自动尝试其他端口）
echo.

REM 清理可能的缓存
where /q npx.cmd
if errorlevel 1 (
    echo 警告：npx可能有问题，尝试使用npm直接安装...
    npm install http-server -g
)

REM 先尝试直接启动，不等待浏览器
echo 正在启动服务器，请稍等...
start /B cmd /c "npx http-server . -p 8080 --cors -s -d false"

echo 等待5秒让服务器启动...
timeout /t 5 /nobreak >nul

echo 正在打开浏览器...
start "" "http://localhost:8080/index.html"

echo.
echo ========================================
echo 如果浏览器显示无法连接：
echo 1. 等待30秒再刷新（首次启动较慢）
echo 2. 按F12查看控制台错误
echo 3. 尝试其他端口：http://localhost:8081
echo ========================================
echo.
echo 服务器日志将在新窗口中显示
echo 按任意键查看服务器状态...
pause >nul

REM 检查服务器是否运行
tasklist | find "node.exe" >nul
if errorlevel 1 (
    echo 服务器启动失败！尝试手动启动...
    echo 请在新窗口中手动输入：
    echo   npx http-server . -p 8080 --cors
    pause
) else (
    echo ✓ 服务器正在运行
    echo 进程ID：
    tasklist | find "node.exe"
)
pause