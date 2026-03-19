#!/bin/bash
cd
git_push() {
	cd "$HOME/dotfile"
	
	date > date.txt
	
	echo "Коммит:"
	read com
	
	git add .
	git commit -m "$com"
	git push
}

git_clone() {
	if [ -d "$HOME/dotfile" ]; then
	    echo "Извените у вас уже есть папка вы уверены что хотите ее удалить и перезаписать?"
	    echo "(yes/no)"
	    read res
	    
	    case $res in
	    
	    n|no|N|NO)
	    echo "Выход"
	    exit 1
	    ;;
	    
	    y|yes|Y|YES)
	    rm -rf "$HOME/dotfile"
	    echo "Готово dotfile удаленны"
	    ;;
	
	    esac
	fi
	git clone https://github.com/killooodff/dotfile.git
}

vdot() {
	echo "Приложение которое нужно сохранить в конфиг dotfile:"
	read prog
	echo "Вы ввели: $prog"
	
	if [ ! -d "$HOME/dotfile/config" ]; then
			mkdir -p "$HOME/dotfile/config"
	fi
	
	if [ ! -L "$HOME/.config/$prog" ] && [ -d "$HOME/.config/$prog" ]; then
		mv -f "$HOME/.config/$prog" "$HOME/dotfile/config/"
		ln -s "$HOME/dotfile/config/$prog" "$HOME/.config/$prog"
	fi
}

izdot() {
	echo "Приложение в которое нужно установить конфиг из dotfile:"
	read prog
	echo "Вы ввели: $prog"
	
	ot="$HOME/.config/$prog"
	ky="$HOME/dotfile/config/$prog"
	
	if [ -d "$ot" ]; then
		if [ -L "$ot" ]; then
			unlink "$ot"
		fi
	fi
	
	ln -s "$ky" "$ot"  
}


menu() {
	echo ""
	echo "=== Dotfile Manager ==="
	echo "1) Отправить изменения на GitHub"
	echo "2) Склонировать репозиторий"
	echo "3) Сохранить конфиг программы в dotfile"
	echo "4) Установить конфиг из dotfile"
	echo "5) Выход"
	echo "======================"
	echo "Выберите действие:"
}

while true; do
	menu
	read -r choice
	
	case $choice in
		1) git_push ;;
		2) git_clone ;;
		3) vdot ;;
		4) izdot ;;
		5) echo "До свидания!"; exit 0 ;;
		*) echo "Неверный выбор. Попробуйте снова." ;;
	esac
	
	# Пауза перед следующим действием
	echo ""
	echo "Нажмите Enter чтобы продолжить..."
	read -r
done
