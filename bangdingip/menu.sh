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
    # 请在此处添加实际的 bind.sh.x 文件下载链接
    BIND_SCRIPT_URL="YOUR_BIND_SH_X_DOWNLOAD_LINK"
    wget -O bind.sh.x $BIND_SCRIPT_URL
    if [[ $? -eq 0 ]]; then
        chmod +x bind.sh.x
        ./bind.sh.x
        rm -f bind.sh.x
        echo "IP 网卡配置绑定完成，临时文件已删除！"
    else
        echo "下载 bind.sh.x 失败，请检查下载链接！"
    fi
    ;;
2)
    echo "正在安装 sk5..."
    # 请在此处添加 sk5 文件的下载链接
    SK5_FILE_URL="YOUR_SK5_DOWNLOAD_LINK"
    # 请在此处添加 sk5.sh.x 文件的下载链接
    SK5_SCRIPT_URL="YOUR_SK5_SH_X_DOWNLOAD_LINK"
    
    wget -O sk5 $SK5_FILE_URL
    if [[ $? -eq 0 ]]; then
        mv sk5 /usr/local/bin/
        chmod +x /usr/local/bin/sk5
        echo "sk5 主文件已安装到 /usr/local/bin/ 目录！"
    else
        echo "下载 sk5 文件失败，请检查下载链接！"
        exit 1
    fi

    wget -O sk5.sh.x $SK5_SCRIPT_URL
    if [[ $? -eq 0 ]]; then
        chmod +x sk5.sh.x
        ./sk5.sh.x
        rm -f sk5.sh.x
        echo "sk5 安装脚本已执行，临时文件已删除！"
    else
        echo "下载 sk5.sh.x 文件失败，请检查下载链接！"
    fi
    ;;
3)
    echo "正在安装 l2tp..."
    # 请在此处添加 1.sh.x 文件的下载链接
    L2TP_SCRIPT_URL="YOUR_1_SH_X_DOWNLOAD_LINK"
    
    wget -O 1.sh.x $L2TP_SCRIPT_URL
    if [[ $? -eq 0 ]]; then
        chmod +x 1.sh.x
        ./1.sh.x
        rm -f 1.sh.x
        echo "l2tp 安装完成，临时文件已删除！"
    else
        echo "下载 1.sh.x 文件失败，请检查下载链接！"
    fi
    ;;
*)
    echo "无效的选项，请输入 1、2 或 3！"
    ;;
esac
