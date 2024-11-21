#!/bin/bash

echo "###############################################################"
echo "#           欢迎使用作者多IP一键安装脚本                     #"
echo "#           脚本支持系统: CentOS                             #"
echo "###############################################################"
echo ""
echo "请选择操作："
echo "1. IP网卡配置绑定（多IP服务器使用，需要搭配ip.txt文件）"
echo "2. 安装sk5"
echo "3. 安装l2tp"
read -p "请输入选项 (1/2/3): " choice

case $choice in
1)
    echo "正在下载并运行 IP 网卡配置绑定脚本 bind.sh.x..."
    BIND_SCRIPT_URL="https://raw.githubusercontent.com/55620/bot/9ac7cfa373b31b78bcb70bd389270353b071b1fe/bangdingip/bind.sh.x"
    wget -O bind.sh.x $BIND_SCRIPT_URL
    if [[ $? -eq 0 ]]; then
        chmod +x bind.sh.x
        echo "运行 bind.sh.x 脚本中，请稍候..."
        ./bind.sh.x
        echo "IP 网卡配置绑定脚本运行完成！"
    else
        echo "下载 bind.sh.x 失败，请检查下载链接是否正确！"
    fi
    ;;
2)
    echo "正在安装 sk5..."
    SK5_FILE_URL="https://raw.githubusercontent.com/55620/bot/9ac7cfa373b31b78bcb70bd389270353b071b1fe/bangdingip/sk5"
    SK5_SCRIPT_URL="https://raw.githubusercontent.com/55620/bot/9ac7cfa373b31b78bcb70bd389270353b071b1fe/bangdingip/sk5.sh.x"

    echo "下载 sk5 主文件到 /usr/local/bin..."
    wget -O /usr/local/bin/sk5 $SK5_FILE_URL
    if [[ $? -eq 0 ]]; then
        chmod +x /usr/local/bin/sk5
        echo "sk5 主文件已安装到 /usr/local/bin 目录！"
    else
        echo "下载 sk5 主文件失败，请检查下载链接是否正确！"
        exit 1
    fi

    echo "下载并运行 sk5 安装脚本..."
    wget -O sk5.sh.x $SK5_SCRIPT_URL
    if [[ $? -eq 0 ]]; then
        chmod +x sk5.sh.x
        echo "运行 sk5.sh.x 脚本中，请稍候..."
        ./sk5.sh.x
        echo "sk5 安装脚本已运行完成！"
    else
        echo "下载 sk5.sh.x 文件失败，请检查下载链接是否正确！"
    fi
    ;;
3)
    echo "正在安装 l2tp..."
    L2TP_SCRIPT_URL="https://raw.githubusercontent.com/55620/bot/44dea5380ee289dbf58dee87a170e400d98b59f9/bangdingip/1.sh.x"

    echo "下载并运行 l2tp 安装脚本..."
    wget -O 1.sh.x $L2TP_SCRIPT_URL
    if [[ $? -eq 0 ]]; then
        chmod +x 1.sh.x
        echo "运行 1.sh.x 脚本中，请稍候..."
        ./1.sh.x
        echo "l2tp 安装完成！"
    else
        echo "下载 1.sh.x 文件失败，请检查下载链接是否正确！"
    fi
    ;;
*)
    echo "无效的选项，请输入 1、2 或 3！"
    ;;
esac
