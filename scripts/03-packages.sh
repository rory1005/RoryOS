#!/bin/bash
set -e

echo "RoryOS packages config"

cat >> .config <<'EOF'

# LuCI Core
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-ssl=y
CONFIG_PACKAGE_luci-base=y
CONFIG_PACKAGE_luci-mod-admin-full=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_rpcd=y
CONFIG_PACKAGE_rpcd-mod-luci=y
CONFIG_PACKAGE_lua=y

# Argon
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y

# Apps
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-ddns=y

# WiFi
CONFIG_PACKAGE_kmod-mt7915e=y
CONFIG_PACKAGE_mt7981-wo-firmware=y

EOF
