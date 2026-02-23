#!/bin/bash
# GitHub推送脚本（使用Personal Access Token）
# 用户名: austinwoocn

cd ~/sentinel-ai-audit

# 设置远程仓库为HTTPS（带token方式）
# 推送时会提示输入token

echo "=== GitHub推送 ==="
echo "用户名: austinwoocn"
echo ""
echo "1. 先在GitHub创建Token:"
echo "   https://github.com/settings/tokens"
echo "   点击 'Generate new token (classic)'"
echo "   勾选 'repo' 权限"
echo "   点击 'Generate token'"
echo "   复制生成的token"
echo ""
echo "2. 然后执行推送:"
echo "   git push -u origin main"
echo ""
echo "3. 提示输入密码时，粘贴token（不是GitHub密码）"
echo ""

# 检查是否已设置远程仓库
if git remote | grep -q origin; then
    echo "✅ 远程仓库已设置"
    git remote -v
else
    echo "设置远程仓库..."
    git remote add origin https://github.com/austinwoocn/sentinel-ai-audit.git
    echo "✅ 远程仓库已添加"
fi

echo ""
echo "执行: git push -u origin main"
