#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     01-system.sh
#
# 文件作用：
#     系统基础配置模块。
#
# 当前功能：
#     ① 设置默认主机名为 RoryOS
#     ② 设置默认时区为 Asia/Shanghai
#     ③ 使用 uci-defaults 首次开机自动配置
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

echo "【系统】开始配置系统默认设置..."

mkdir -p "$OPENWRT_DIR/files/etc/uci-defaults"

cat > "$OPENWRT_DIR/files/etc/uci-defaults/97-roryos-system" <<'EOF'
#!/bin/sh

# RoryOS 系统默认配置
# 首次开机自动执行

uci set system.@system[0].hostname='RoryOS'
uci set system.@system[0].timezone='CST-8'
uci set system.@system[0].zonename='Asia/Shanghai'

uci commit system

exit 0
EOF

chmod +x "$OPENWRT_DIR/files/etc/uci-defaults/97-roryos-system"

echo "【系统】系统默认设置完成。"
