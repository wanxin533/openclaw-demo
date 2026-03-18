# 🚀 GitHub Pages 快速部署指南

## 方法 1: 一键部署脚本（推荐）

```powershell
# 进入 demo 目录
cd C:\Users\EF\.openclaw\workspace\demo

# 运行部署脚本
.\deploy-to-github.ps1
```

脚本会自动：
- ✅ 检查 GitHub CLI 安装
- ✅ 引导登录 GitHub
- ✅ 创建仓库
- ✅ 推送代码
- ✅ 打开 Pages 配置页面

---

## 方法 2: 手动部署

### 步骤 1: 登录 GitHub

```powershell
gh auth login
```

按提示操作：
1. 选择 `GitHub.com`
2. 选择 `HTTPS`
3. 选择 `Login with a browser`
4. 在浏览器完成登录

### 步骤 2: 创建仓库

```powershell
cd C:\Users\EF\.openclaw\workspace
gh repo create openclaw-demo --public --source=. --remote=origin --push
```

### 步骤 3: 启用 GitHub Pages

1. 访问：https://github.com/wanxin-energy/openclaw-demo/settings/pages
2. 选择：
   - **Source**: Deploy from a branch
   - **Branch**: main
   - **Folder**: / (root)
3. 点击 **Save**

### 步骤 4: 等待上线

等待 1-2 分钟，页面刷新后显示：
```
Your site is live at https://wanxin-energy.github.io/openclaw-demo/
```

---

## 方法 3: 纯手动（无 gh CLI）

### 1. 创建仓库

访问 https://github.com/new

- Repository name: `openclaw-demo`
- 选择 `Public`
- 不要初始化（不要勾选 README/.gitignore）
- 点击 **Create repository**

### 2. 推送代码

```powershell
cd C:\Users\EF\.openclaw\workspace
git remote add origin https://github.com/wanxin-energy/openclaw-demo.git
git branch -M main
git push -u origin main
```

### 3. 启用 Pages

同上（方法 2 的步骤 3）

---

## 📁 网站结构

```
openclaw-demo/
├── demo/
│   ├── index.html          # 首页
│   ├── capabilities.html   # 核心能力
│   ├── tips.html          # 使用技巧
│   ├── memory.html        # 记忆系统
│   ├── cases.html         # 行业案例
│   ├── README.md          # 说明文档
│   └── deploy-to-github.ps1  # 部署脚本
```

**注意**: 网站根目录是 `/demo`，访问地址：
```
https://wanxin-energy.github.io/openclaw-demo/demo/
```

---

## 🎯 访问地址

部署完成后访问：
```
https://wanxin-energy.github.io/openclaw-demo/demo/
```

---

## ⚠️ 常见问题

### Q: 提示 "Repository not found"
A: 仓库不存在，请先创建仓库（方法 2 步骤 2 或 方法 3 步骤 1）

### Q: 提示 "not logged into"
A: 运行 `gh auth login` 登录

### Q: Pages 不显示
A: 检查 Settings → Pages → Source 是否选择了 main 分支

### Q: 404 错误
A: 等待 1-2 分钟，GitHub 需要时间构建

---

*最后更新：2026-03-18*  
*版本：v1.0*