#!/bin/bash

# --- 變數設定 ---
TARGET_IP="192.168.88.128"
TARGET_USER="user"

# --- 第一部分：清理本機 SSH 舊紀錄 (解決 Host Identification 錯誤) ---
echo "正在清理本機對 $TARGET_IP 的舊 SSH 紀錄..."
ssh-keygen -R $TARGET_IP -f ~/.ssh/known_hosts 2>/dev/null

# --- 第二部分：伺服器環境設定 ---
# 這裡使用 SSH 遠端執行指令，自動完成你 history 中的動作
echo "正在遠端設定伺服器 ($TARGET_IP)..."

ssh -o StrictHostKeyChecking=accept-new $TARGET_USER@$TARGET_IP << EOF
    # 更新並安裝套件
    sudo apt update
    sudo apt install -y ufw apache2

    # 防火牆規則設定 (務必先 allow ssh 避免斷線)
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw allow 80/tcp

    # 啟用並重新載入防火牆
    echo "y" | sudo ufw enable
    sudo ufw reload

    # 顯示目前狀態
    echo "--- 伺服器狀態 ---"
    sudo ufw status
    ss -ntl
EOF

echo "設定完成！"
