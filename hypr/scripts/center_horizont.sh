#!/usr/bin/env bash

# Получаем ширину монитора (в физических пикселях)
monitor_width=$(hyprctl monitors -j | jq -r '.[0].width')

# Получаем ширину активного окна (в логических пикселях)
window_width=$(hyprctl activewindow -j | jq -r '.size[0]')

# Получаем масштаб монитора (например, 1, 1.5, 2 и т.п.)
scale=$(hyprctl monitors -j | jq -r '.[0].scale')

# Переводим физическую ширину в логические пиксели
# и вычисляем смещение по X, чтобы центрировать окно
new_x=$(echo "($monitor_width / $scale - $window_width) / 2" | bc -l)

# Выводим итоговое значение (для отладки)
new_x_rounded=$(printf "%.0f" "$new_x")
y=

# Перемещаем активное окно
hyprctl dispatch moveactive exact $new_x_rounded 69
