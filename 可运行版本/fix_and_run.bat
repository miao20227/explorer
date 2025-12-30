@echo off
chcp 65001 >nul
title 以太坊区块链浏览器 - 一键启动工具
echo ========================================
echo       以太坊区块链浏览器启动工具
echo       解决CORS问题，恢复所有功能
echo ========================================
echo.

echo [1/3] 检查必要文件...
if not exist "index.html" (
    echo 错误：当前文件夹未找到 index.html
    echo 请将本文件放在包含index.html的文件夹中
    pause
    exit /b 1
)
echo ✓ 找到 index.html
echo.

echo [2/3] 启动本地HTTP服务器...
echo 这将解决"所有功能未被激活"问题
echo 服务器端口：8080
echo 如果8080被占用，会自动尝试8081-8090
echo.
echo 按 Ctrl+C 可停止服务器
echo.

REM 尝试多个端口
set port=8080
:check_port
netstat -an | find ":%port%" >nul
if errorlevel 1 (
    goto port_available
) else (
    echo 端口 %port% 被占用，尝试下一个...
    set /a port+=1
    if %port% gtr 8090 (
        echo 错误：8080-8090端口均被占用！
        pause
        exit /b 1
    )
    goto check_port
)

:port_available
echo ✓ 使用端口：%port%
echo.

echo [3/3] 启动服务器并打开浏览器...
echo 等待3秒...
timeout /t 3 /nobreak >nul

start "" "http://localhost:%port%/index.html"
echo 浏览器已打开，请测试功能是否正常！
echo.
echo 如果功能仍然失效，按F12查看控制台错误
echo ========================================
echo.

REM 启动HTTP服务器
npx http-server . -p %port% --cors -s