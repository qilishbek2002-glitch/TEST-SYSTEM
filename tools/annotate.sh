#!/usr/bin/env bash
# Ishlatilishi: bash tools/annotate.sh "Sarlavha" log_fayl [oxirgi_qatorlar_soni]
# Log faylning oxirgi qatorlarini GitHub Annotations bo'limiga qizil xato qilib chiqaradi.
f="$2"
n="${3:-30}"
[ -f "$f" ] || exit 0
msg=$(tail -n "$n" "$f" | sed -e 's/\r//g' -e 's/%/%25/g' | awk '{printf "%s%%0A", $0}')
echo "::error title=$1::$msg"
