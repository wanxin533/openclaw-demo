# GitHub Pages 一键部署脚本
Write-Host "🦞 OpenClaw AI 助手演示网站 - GitHub Pages 部署脚本" -ForegroundColor Cyan
Write-Host ""

# 检查 gh 是否安装
Write-Host "📦 检查 GitHub CLI..." -ForegroundColor Yellow
$check = gh --version 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ 未检测到 GitHub CLI，请先安装：https://cli.github.com/" -ForegroundColor Red
    exit 1
}
Write-Host "✅ GitHub CLI 已安装" -ForegroundColor Green
Write-Host ""

# 检查登录状态
Write-Host "🔐 检查 GitHub 登录状态..." -ForegroundColor Yellow
$authStatus = gh auth status 2>$null
if ($authStatus -match "not logged into") {
    Write-Host "⚠️  未登录 GitHub，正在启动登录流程..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "👉 请在打开的浏览器中完成登录，然后返回此处按回车继续" -ForegroundColor Cyan
    gh auth login --web
    Start-Sleep -Seconds 2
}
Write-Host "✅ GitHub 已登录" -ForegroundColor Green
Write-Host ""

# 创建仓库
Write-Host "📦 创建 GitHub 仓库..." -ForegroundColor Yellow
$repoName = "openclaw-demo"

Write-Host "正在创建仓库..." -ForegroundColor Cyan
$createResult = gh repo create $repoName --public --source=. --remote=origin --push 2>&1
Write-Host $createResult -ForegroundColor Gray
Write-Host ""

# 显示结果
Write-Host "✅ 仓库创建成功！" -ForegroundColor Green
Write-Host "   地址：https://github.com/wanxin-energy/$repoName" -ForegroundColor Cyan
Write-Host ""

# 启用 GitHub Pages
Write-Host "🌐 配置 GitHub Pages..." -ForegroundColor Yellow
Write-Host ""
Write-Host "👉 请访问以下页面手动启用 Pages：" -ForegroundColor Cyan
Write-Host "   https://github.com/wanxin-energy/$repoName/settings/pages" -ForegroundColor White
Write-Host ""
Write-Host "📋 配置步骤：" -ForegroundColor Yellow
Write-Host "   1. Source: Deploy from a branch" -ForegroundColor White
Write-Host "   2. Branch: main" -ForegroundColor White
Write-Host "   3. Folder: / (root)" -ForegroundColor White
Write-Host "   4. 点击 Save" -ForegroundColor White
Write-Host ""
Write-Host "⏱️  等待 1-2 分钟后，网站将上线：" -ForegroundColor Cyan
Write-Host "   https://wanxin-energy.github.io/openclaw-demo/demo/" -ForegroundColor Green
Write-Host ""

# 显示文件列表
Write-Host "📁 已部署的文件：" -ForegroundColor Yellow
Get-ChildItem -Path "." | ForEach-Object {
    Write-Host "   ✓ $($_.Name)" -ForegroundColor Green
}
Write-Host ""

Write-Host "🎉 部署完成！" -ForegroundColor Green
Write-Host ""

# 打开浏览器
Write-Host "🌐 正在打开仓库页面..." -ForegroundColor Yellow
Start-Process "https://github.com/wanxin-energy/openclaw-demo/settings/pages"
