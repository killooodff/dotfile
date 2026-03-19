#!/bin/bash

cd
cd "$HOME/dotfile"

date > date.txt

echo "Коммит:"
read com

git add .
git commit -m "$com"
git push
