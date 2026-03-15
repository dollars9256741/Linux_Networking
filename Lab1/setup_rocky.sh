#!/bin/bash

# =================================================================
# Script Name: setup_rocky.sh
# Description: Automate Firewall (HTTP) and Apache installation
# Target OS: Rocky Linux 9 (RHEL-based)
# =================================================================

# 顏色定義 (讓輸出更好看)
GREEN='\e[32m'
BLUE='\e[34m'
NC='\e[0m' # No Color

echo -e "${BLUE}>>> Starting Lab 1 Environment Setup...${NC}"

# 1. 檢查並啟動 Firewalld
echo -e "${BLUE}[1/4] Checking Firewalld status...${NC}"
sudo systemctl enable --now firewalld
sudo systemctl restart firewalld

# 2. 設定防火牆規則 (永久新增 http 服務並生效)
echo -e "${BLUE}[2/4] Configuring Firewall rules...${NC}"
if sudo firewall-cmd --permanent --add-service=http; then
    sudo firewall-cmd --reload
    echo -e "${GREEN}✔ HTTP service added and firewall reloaded.${NC}"
else
    echo "Firewall rule already exists or failed."
fi

# 3. 安裝 Apache (httpd)
echo -e "${BLUE}[3/4] Installing Apache (httpd)...${NC}"
# 使用 -y 自動確認 [y/N]
if sudo dnf install -y httpd; then
    sudo systemctl enable --now httpd
    echo -e "${GREEN}✔ Apache installed and started successfully.${NC}"
else
    echo "Installation failed. Please check your network or repository."
    exit 1
fi

# 4. 驗證最終狀態
echo -e "${BLUE}[4/4] Verifying configuration...${NC}"
echo "----------------------------------------"
echo -n "Default Zone: " && sudo firewall-cmd --get-default-zone
echo "Active Services: " && sudo firewall-cmd --list-all | grep services
echo -n "Apache Status: " && systemctl is-active httpd
echo "----------------------------------------"

echo -e "${GREEN}>>> Lab 1 Setup Complete!${NC}"
