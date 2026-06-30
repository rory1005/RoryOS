#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     01-system.sh
#
# 文件作用：
#     系统基础设置。
#
# 当前功能：
#     ① 设置默认主机名为 RoryOS
#     ② 设置默认时区为 Asia/Shanghai
#     ③ 设置默认 LAN IP 为 192.168.10.1
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

echo "【系统】开始系统基础设置..."

mkdir -p "$OPENWRT_DIR/files/etc/config"

cat > "$OPENWRT_DIR/files/etc/config/system" <<'EOF'
config system
	option hostname 'RoryOS'
	option timezone 'CST-8'
	option zonename 'Asia/Shanghai'
	option ttylogin '0'
	option log_size '64'
	option urandom_seed '0'
EOF

cat > "$OPENWRT_DIR/files/etc/config/network" <<'EOF'
config interface 'loopback'
	option device 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'auto'

config device
	option name 'br-lan'
	option type 'bridge'
	list ports 'lan1'
	list ports 'lan2'
	list ports 'lan3'
	list ports 'wan'

config interface 'lan'
	option device 'br-lan'
	option proto 'static'
	option ipaddr '192.168.10.1'
	option netmask '255.255.255.0'
	option ip6assign '60'
EOF

echo "【系统】系统基础设置完成。"
