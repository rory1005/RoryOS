#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     02-theme.sh
#
# 文件作用：
#     管理界面（LuCI）主题配置。
#
# 当前功能：
#     ① 设置 Argon 为默认主题
#     ② 设置 LuCI 默认语言为中文
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

echo "【主题】开始设置默认主题..."

mkdir -p "$OPENWRT_DIR/files/etc/config"

cat > "$OPENWRT_DIR/files/etc/config/luci" <<'EOF'
config core 'main'
	option mediaurlbase '/luci-static/argon'
	option lang 'zh_cn'
EOF

echo "【主题】默认主题设置完成。"
