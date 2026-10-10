#!/bin/sh
set -eu
sh -n hola-mundo.sh
output="$(sh hola-mundo.sh)"
if [ "$output" != 'Hola Mundo' ]; then
  printf 'ERROR: se esperaba Hola Mundo, recibido: %s\n' "$output" >&2
  exit 1
fi
printf '%s\n' 'OK: el script imprime Hola Mundo'
