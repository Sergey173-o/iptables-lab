#!/usr/bin/env bash
# Посылает три TCP knock на внутренний адрес inetRouter.
set -u

for port in 7001 7002 7003; do
  # Правила отвечают TCP reset, поэтому отказ соединения ожидаем.
  timeout 1s bash -c 'true < "/dev/tcp/192.168.255.1/$1"' bash "$port" 2>/dev/null || true
done
echo 'Последовательность отправлена. Проверь TCP/22 в течение 30 секунд.'

# Версия 1 | 2026-11-08 | Три TCP knock с фиксированным адресом шлюза.
