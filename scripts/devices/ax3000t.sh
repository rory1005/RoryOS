#!/bin/bash
set -e

echo "AX3000T SAFE LOCK"

OPENWRT_DIR="${1:-openwrt}"
CONFIG_FILE="$OPENWRT_DIR/.config"

# 防止 .config 不存在
if [ ! -f "$CONFIG_FILE" ]; then
    echo "⚠ .config not ready, skip check"
    exit 0
fi

grep -q "mediatek_filogic" "$CONFIG_FILE" || {
    echo "WRONG TARGET"
    exit 1
}

echo "OK"
