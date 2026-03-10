#!/bin/bash

cd

dir1="$PWD"
dir2="$PWD/dotfile/dotfile"

echo "Приложение в которое нужно установить конфиг из dotfile:"
read prog
echo "Вы ввели: $prog"

ot="$dir1/.config/$prog"
ky="$dir2/config/$prog"

if [ -d "$ot" ]; then
	if [ -L "$ot" ]; then
		unlink "$ot"
	fi
fi

ln -s "$ky" "$ot"  
