#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     04-wireless.sh
#
# 文件作用：
#     无线网络配置模块。
#
# 当前功能：
#     ① 预留 AX3000T Wi-Fi 默认配置
#     ② 设置默认国家码为 CN
#
# 作者：
#     Rory
#
# 技术支持：
#     福贵（ChatGPT）
#
# 创建日期：
#     2026-07-01
#
# 最后修改：
#     2026-07-01
###############################################################################

set -e

OPENWRT_DIR="${1:-openwrt}"

echo "【无线】开始配置无线网络..."

mkdir -p "$OPENWRT_DIR/files/etc/uci-defaults"

cat > "$OPENWRT_DIR/files/etc/uci-defaults/99-roryos-wireless" <<'EOF'
#!/bin/sh

# RoryOS 默认无线配置
# 首次开机自动执行

uci set wireless.radio0.country='CN'
uci set wireless.radio1.country='CN'

uci set wireless.default_radio0.disabled='0'
uci set wireless.default_radio1.disabled='0'

uci set wireless.default_radio0.ssid='RoryOS-2.4G'
uci set wireless.default_radio1.ssid='RoryOS-5G'

uci set wireless.default_radio0.encryption='none'
uci set wireless.default_radio1.encryption='none'

uci commit wireless

exit 0
EOF

chmod +x "$OPENWRT_DIR/files/etc/uci-defaults/99-roryos-wireless"

echo "【无线】无线默认配置完成。"
