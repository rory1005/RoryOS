#!/bin/bash
set -e

echo "AX3000T SAFE LOCK"

grep -q "mediatek_filogic" .config || {
    echo "WRONG TARGET"
    exit 1
}

echo "OK"
