#!/bin/bash

cd

echo "Приложение которое нужно сохранить в конфиг dotfile:"
read prog
echo "Вы ввели: $prog"

if [ ! -d "$PWD/dotfile/dotfile/config" ]; then
		mkdir -p "$PWD/dotfile/dotfile/config"
fi

if [ ! -L "$PWD/.config/$prog" ] && [ -d "$PWD/.config/$prog" ]; then
	mv -f "$PWD/.config/$prog" "$PWD/dotfile/dotfile/config/"
	ln -s "$PWD/dotfile/dotfile/config/$prog" "$PWD/.config/$prog"
fi
